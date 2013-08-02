use strict;
use warnings;
use Test::More;
use t::MyApp::Constant::WithTag;

subtest 'not exported by default (:device)' => sub {
    eval "DEVICE_IPHONE()";
    if (my $e = $@) {
        like $e, qr/DEVICE_IPHONE/
            and note $e;
    } else {
        fail "oops";
    }
};

subtest 'not exported by default (:error)' => sub {
    eval "ERROR_PARSE_ERROR()";
    if (my $e = $@) {
        like $e, qr/ERROR_PARSE_ERROR/
            and note $e;
    } else {
        fail "oops";
    }
};

done_testing;

