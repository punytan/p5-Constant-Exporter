use strict;
use warnings;
use Test::More;
use t::MyApp::Constant::WithTag qw/ :device :error /;

subtest 'exported device tag' => sub {
    is DEVICE_PC,      1 << 1;
    is DEVICE_ANDROID, 1 << 2;
    is DEVICE_IPHONE,  1 << 3;
};

subtest 'exported error tag' => sub {
    is ERROR_PARSE_ERROR,           -32700;
    is ERROR_INVALID_REQUEST,       -32600;
    is ERROR_METHOD_NOT_FOUND,      -32601;
    is ERROR_INVALID_PARAMS,        -32602;
    is ERROR_INTERNAL_SERVER_ERROR, -32603;
};

done_testing;
