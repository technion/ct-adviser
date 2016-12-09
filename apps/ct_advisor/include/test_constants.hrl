% Several EUnit tests involve very long strings. Define them here to keep 
% main source clean.
-define(TEST_LOOKUP_DOMAINS, [{dNSName,"lolware.net"},{dNSName,"www.lolware.net"}]).
-define(TEST_NONDNS_DOMAINS, [{dNSName,"irrelevant.com"}, {rfc822Name,"email@lolware.net"}]).
-define(TEST_ENUMERATED_DOMAINS, [[{dNSName,"lolware.net"},{dNSName,"www.lolware.net"},{serial,"19F169D2A081E71A79CE2219220D0B582D6"}]]).
-define(TEST_STH, "{\"tree_size\":9910235,\"timestamp\":1448090100891,\"sha256_root_hash\":\"f/yL52udFFrqHzwxLZwpWKbBV1PxlqlanZ7dTT+3Ylo=\",\"tree_head_signature\":\"BAMARzBFAiEAiBAlcFyk8a0wz5KdWugGbZL+DZ8gXq7gKDoiu+eDbcICIFrNiPLM/oHPDTge3B7XsXmiYf/kaCp96+BbFt30sj4o\"}").
-define(TEST_DOMAIN_LIST, [{dNSName,"lolware.net"},{dNSName,"www.lolware.net"}]).
-define(TEST_MTL, <<"AAAAAAFQ6ROVpwAAAAUSMIIFDjCCA/agAwIBAgISAZ8WnSoIHnGnnOIhkiDQtYLWMA0GCSqGSIb3DQEBCwUAMEoxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MSMwIQYDVQQDExpMZXQncyBFbmNyeXB0IEF1dGhvcml0eSBYMTAeFw0xNTExMDgyMDUwMDBaFw0xNjAyMDYyMDUwMDBaMBYxFDASBgNVBAMTC2xvbHdhcmUubmV0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1SePrSId4PdCXLuB3PH+6nMaQ5yDEUsCRPJ6oJkR/uqeOTgmHdIelpI3FAtHvc/BqxGe8phwkEtnAFtnYTtKSPmwJS6LF/kNWEjvUd1k6PXQMfjgmRT4XJcnOfAU/dGlZlc6hLxL/H40Ol7ohX4oepJBsakkFBx+gZ07ufh91U2DKL/37zghuZ4P61S5AW4rojvYsIE7B3jJAYhqoZO82l/ywDF/0RYdJmEoiLRZULSiVqJTdLSi6+6qNjsiEz9dtP2xj1/kCM7cLXoLLfnCHhX76HSzpzl5Hs4AwovpQ15yeo7WE8RkBP7l5bndYNXtxLATPXNmhfaGEL/vb87NewIDAQABo4ICIDCCAhwwDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSisGjWvbZ/u0XSHaj7LoebOAAMcDAfBgNVHSMEGDAWgBSoSmpjBH3duubRObemRWXv86jsoTBwBggrBgEFBQcBAQRkMGIwLwYIKwYBBQUHMAGGI2h0dHA6Ly9vY3NwLmludC14MS5sZXRzZW5jcnlwdC5vcmcvMC8GCCsGAQUFBzAChiNodHRwOi8vY2VydC5pbnQteDEubGV0c2VuY3J5cHQub3JnLzAnBgNVHREEIDAeggtsb2x3YXJlLm5ldIIPd3d3LmxvbHdhcmUubmV0MIIBAAYDVR0gBIH4MIH1MAoGBmeBDAECATAAMIHmBgsrBgEEAYLfEwEBATCB1jAmBggrBgEFBQcCARYaaHR0cDovL2Nwcy5sZXRzZW5jcnlwdC5vcmcwgasGCCsGAQUFBwICMIGeDIGbVGhpcyBDZXJ0aWZpY2F0ZSBtYXkgb25seSBiZSByZWxpZWQgdXBvbiBieSBSZWx5aW5nIFBhcnRpZXMgYW5kIG9ubHkgaW4gYWNjb3JkYW5jZSB3aXRoIHRoZSBDZXJ0aWZpY2F0ZSBQb2xpY3kgZm91bmQgYXQgaHR0cHM6Ly9sZXRzZW5jcnlwdC5vcmcvcmVwb3NpdG9yeS8wDQYJKoZIhvcNAQELBQADggEBAFudN5CzroT/YpaY7VVutGi85lbYWdYu9n3FDrmA8t10NvR4S78PftF87pxHQYRd7oEWAnOtxTt0y3oSCzkWzONTp1VzU7TBd2orHQ7jDn4XQ+Zbm9s1nO3/Ykzk+nQAMbSiBtAaxCwExT/UAb2fuKyIHkh+CXyx+eVfaz7MEXRmLuhsmn6PIrQu9FpaPJ+QAn8uD/LBA6IFBCcvVwnO9sOpnh+vJTQj6jpyY7jjPWBgFVLAXflS1Y1n7tKYZf4drKoDhZ9cV+5bOS/mPFZYnHMotDf9XAZSQjbJ6h+aF3GydYRQqR5SKTJp+MvExTUlSiS5+Q2IzGfzjo+gD2WKP7kAAA==">>).
-define(TEST_LEAF_ENTRY, "{\"entries\":[{\"leaf_input\":\"AAAAAAFQ6ROYSAAAAAUSMIIFDjCCA/agAwIBAgISAZ8WnSoIHnGnnOIhkiDQtYLWMA0GCSqGSIb3DQEBCwUAMEoxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MSMwIQYDVQQDExpMZXQncyBFbmNyeXB0IEF1dGhvcml0eSBYMTAeFw0xNTExMDgyMDUwMDBaFw0xNjAyMDYyMDUwMDBaMBYxFDASBgNVBAMTC2xvbHdhcmUubmV0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1SePrSId4PdCXLuB3PH+6nMaQ5yDEUsCRPJ6oJkR/uqeOTgmHdIelpI3FAtHvc/BqxGe8phwkEtnAFtnYTtKSPmwJS6LF/kNWEjvUd1k6PXQMfjgmRT4XJcnOfAU/dGlZlc6hLxL/H40Ol7ohX4oepJBsakkFBx+gZ07ufh91U2DKL/37zghuZ4P61S5AW4rojvYsIE7B3jJAYhqoZO82l/ywDF/0RYdJmEoiLRZULSiVqJTdLSi6+6qNjsiEz9dtP2xj1/kCM7cLXoLLfnCHhX76HSzpzl5Hs4AwovpQ15yeo7WE8RkBP7l5bndYNXtxLATPXNmhfaGEL/vb87NewIDAQABo4ICIDCCAhwwDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSisGjWvbZ/u0XSHaj7LoebOAAMcDAfBgNVHSMEGDAWgBSoSmpjBH3duubRObemRWXv86jsoTBwBggrBgEFBQcBAQRkMGIwLwYIKwYBBQUHMAGGI2h0dHA6Ly9vY3NwLmludC14MS5sZXRzZW5jcnlwdC5vcmcvMC8GCCsGAQUFBzAChiNodHRwOi8vY2VydC5pbnQteDEubGV0c2VuY3J5cHQub3JnLzAnBgNVHREEIDAeggtsb2x3YXJlLm5ldIIPd3d3LmxvbHdhcmUubmV0MIIBAAYDVR0gBIH4MIH1MAoGBmeBDAECATAAMIHmBgsrBgEEAYLfEwEBATCB1jAmBggrBgEFBQcCARYaaHR0cDovL2Nwcy5sZXRzZW5jcnlwdC5vcmcwgasGCCsGAQUFBwICMIGeDIGbVGhpcyBDZXJ0aWZpY2F0ZSBtYXkgb25seSBiZSByZWxpZWQgdXBvbiBieSBSZWx5aW5nIFBhcnRpZXMgYW5kIG9ubHkgaW4gYWNjb3JkYW5jZSB3aXRoIHRoZSBDZXJ0aWZpY2F0ZSBQb2xpY3kgZm91bmQgYXQgaHR0cHM6Ly9sZXRzZW5jcnlwdC5vcmcvcmVwb3NpdG9yeS8wDQYJKoZIhvcNAQELBQADggEBAFudN5CzroT/YpaY7VVutGi85lbYWdYu9n3FDrmA8t10NvR4S78PftF87pxHQYRd7oEWAnOtxTt0y3oSCzkWzONTp1VzU7TBd2orHQ7jDn4XQ+Zbm9s1nO3/Ykzk+nQAMbSiBtAaxCwExT/UAb2fuKyIHkh+CXyx+eVfaz7MEXRmLuhsmn6PIrQu9FpaPJ+QAn8uD/LBA6IFBCcvVwnO9sOpnh+vJTQj6jpyY7jjPWBgFVLAXflS1Y1n7tKYZf4drKoDhZ9cV+5bOS/mPFZYnHMotDf9XAZSQjbJ6h+aF3GydYRQqR5SKTJp+MvExTUlSiS5+Q2IzGfzjo+gD2WKP7kAAA==\",\"extra_data\":\"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\"}]}").
