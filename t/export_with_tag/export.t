use strict;
use warnings;
use Test::More;
use t::MyApp::Constant::ExportWithTag;

subtest 'export' => sub {
    is DEVICE_PC,       1 << 1;
};

subtest 'not exported' => sub {
    eval "DEVICE_ANDROID()";
    if (my $e = $@) {
        like $e, qr/DEVICE_ANDROID/
            and note $e;
    } else {
        fail "oops";
    }
};

done_testing;

