package t::MyApp::Constant::WithoutTag;
use strict;
use warnings;
use Constant::Exporter (
    EXPORT => {
        DEVICE_PC      => 1 << 1,
        DEVICE_ANDROID => 1 << 2,
        DEVICE_IPHONE  => 1 << 3,
    },
    EXPORT_OK => {
        ERROR_PARSE_ERROR           => -32700,
        ERROR_INVALID_REQUEST       => -32600,
        ERROR_METHOD_NOT_FOUND      => -32601,
        ERROR_INVALID_PARAMS        => -32602,
        ERROR_INTERNAL_SERVER_ERROR => -32603,
    }
);

1;
__END__
