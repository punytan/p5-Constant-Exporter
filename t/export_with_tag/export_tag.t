use strict;
use warnings;
use Test::More;
use t::MyApp::Constant::ExportWithTag ':device';

subtest 'export' => sub {
    is DEVICE_PC,      1 << 1;
    is DEVICE_ANDROID, 1 << 2;
    is DEVICE_IPHONE,  1 << 3;
};

subtest 'not exported' => sub {
    eval "ERROR_PARSE_ERROR()";
    if (my $e = $@) {
        like $e, qr/ERROR_PARSE_ERROR/
            and note $e;
    } else {
        fail "oops";
    }
};

done_testing;


