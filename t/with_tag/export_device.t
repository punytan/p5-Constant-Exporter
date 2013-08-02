use strict;
use warnings;
use Test::More;
use t::MyApp::Constant::WithTag qw/ :device /;

subtest 'exported device tag' => sub {
    is DEVICE_PC,      1 << 1;
    is DEVICE_ANDROID, 1 << 2;
    is DEVICE_IPHONE,  1 << 3;
};

done_testing;
