use strict;
use warnings;
use Test::More;
use t::MyApp::Constant::WithTag qw/ DEVICE_PC ERROR_PARSE_ERROR /;

subtest 'export_ok' => sub {
    is DEVICE_PC,         1 << 1;
    is ERROR_PARSE_ERROR, -32700;
};

subtest 'not exported' => sub {
    eval "DEVICE_IPHONE()";
    if (my $e = $@) {
        like $e, qr/DEVICE_IPHONE/
            and note $e;
    } else {
        fail "oops";
    }
};

done_testing;
