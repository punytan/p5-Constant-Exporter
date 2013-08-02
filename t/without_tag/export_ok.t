use strict;
use warnings;
use Test::More;
use t::MyApp::Constant::WithoutTag qw/ ERROR_PARSE_ERROR /;

subtest 'export_ok' => sub {
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

