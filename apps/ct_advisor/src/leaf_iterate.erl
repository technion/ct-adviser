-module(leaf_iterate).
-export([scheduled_check/0]).
%enumberate_ids/2 is not a programatically required export.
% It is often required for debugging however.
-export([enumerate_ids/2]).

%% The entry function. This checks the latest recorded certificate and fires
%% processing based on that.
-spec scheduled_check() -> 'noupdate' |  [any(), ...].
scheduled_check() ->
    STH = ct_fetch:fetch_sth(),
    Latest = ct_fetch:parse_sth(STH),
    lookup_updates(Latest).

% Compares the input STH with the last checked value based on database lookup.
% Calls new checks as appropriate.
-spec lookup_updates(pos_integer()) -> 'noupdate' |  [any(), ...].
lookup_updates(Latest) ->
    {ok, _Columns, Rows} = pgapp:equery("SELECT latest FROM STH", []),
    case Rows of
    [{LastLookup}] when Latest > LastLookup ->
        lager:info("Performing checks: ~B~n", [Latest]),
        run_checks(LastLookup, Latest);
    _ ->
        lager:debug("No updates, latest still: ~B~n", [Latest]),
        noupdate
    end.

%% Downloads and parses a a range of certificate id's, updates
%% last checked value in database
-spec run_checks(pos_integer(), pos_integer()) -> [any(), ...].
run_checks(LOW, HIGH) ->
    {FROM, TO} = get_range(LOW, HIGH),
    lager:info("Running between: ~B and ~B~n", [FROM, TO]),
    Domains = enumerate_ids(FROM, TO),
    % This task can involve delays, spawning here makes this work somewhat
    % asynchronous.
    spawn(domain_parse, cert_domain_list, [Domains]),
    {ok, 1} = pgapp:equery("UPDATE sth SET latest = $1", [TO + 1]),
    Domains.

%% Rate limiting function - if a range is higher than a configured
%% value - reduce the range.
-define(ITERATIONS, 64).
-spec get_range(pos_integer(), pos_integer()) -> {pos_integer(), pos_integer()}.
get_range(LOW, HIGH) when HIGH > LOW ->
    % Note the highest lookup should be STH -1
    % We also rate limit lookups per run
    case (HIGH - LOW) of
    Diff when Diff > ?ITERATIONS ->
        {LOW, LOW+?ITERATIONS};
    _Diff ->
        {LOW, HIGH-1}
    end.

%% Will fetch a certificate and use the various parsing functions to
%% extract a list of domains on that certificate.
-spec get_domain_from_id(pos_integer()) -> any().
get_domain_from_id(MTL) ->
    try leaf_parse:xparse(MTL) of
    X509 ->
        leaf_parse:get_subjects(X509) ++ [leaf_parse:get_serial(X509)]
    catch
    _:_ ->
        []
    end.

-spec enumerate_ids(pos_integer(), pos_integer()) -> [any(), ...].
enumerate_ids(FROM, TO) ->
    Entries = ct_fetch:fetch_entry(FROM, TO),
    Leaves = leaf_parse:parse_leaf(Entries),
    MTLs = [proplists:get_value(<<"leaf_input">>, MTLs) || {MTLs} <- Leaves ],
    [get_domain_from_id(MTL) || MTL <- MTLs].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-include("test_constants.hrl").

lookup_fixture_test_() ->
    {setup, fun connect/0, fun teardown/1, fun lookup/0}.

connect() ->
    application:ensure_all_started(pgapp),
    db_connect:db_connect().

teardown(_C) ->
    application:stop(pgapp),
    ok.

ranges_test() ->
    ?assertEqual({7, 7}, get_range(7, 8)),
    ?assertEqual({7, 71}, get_range(7, 107)).

lookup() ->
    ?assertEqual(noupdate, lookup_updates(1025)).

enumerate_test() ->
    ?assertEqual(?TEST_ENUMERATED_DOMAINS, enumerate_ids(10502585, 10502585)).

-endif.
