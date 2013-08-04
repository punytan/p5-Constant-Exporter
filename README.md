# NAME

Constant::Exporter - define and export constants easily

# SYNOPSIS

    # define constants in your MyApp::Constants,

    package MyApp::Constants;
    use strict;
    use warnings;

    use Constant::Exporter (
        EXPORT => {
            FB_CLIENT_ID => 12345,
        },
        EXPORT_OK => {
            TITLE_MAX_LENGTH => 128,
        },
        EXPORT_TAGS => {
            user_status => {
                USER_STATUS_FB_ASSOCIATED     => 1,
                USER_STATUS_FB_NOT_ASSOCIATED => 0,
            },
        },
        EXPORT_OK_TAGS => {
            fb_api_error => {
                ERROR_OAUTH       => 190,
                ERROR_API_SESSION => 102,
                ERROR_API_USER_TOO_MANY_CALLS => 17,
            },
            fb_payment_error => {
                ERROR_PAYMENTS_ASSOCIATION_FAILURE   => 1176,
                ERROR_PAYMENTS_INSIDE_IOS_APP        => 1177,
                ERROR_PAYMENTS_NOT_ENABLED_ON_MOBILE => 1178,
            },
        },
    );

    1;

    # then use it like Exporter's `%EXPORT_TAGS` and `@EXPORT_OK`
    package main;
    use MyApp::Constants qw( TITLE_MAX_LENGTH :fb_api_error );

    sub foo {
        my ($title) = @_;
        if (length $title > TITLE_MAX_LENGTH) {
            ...
        }
    }

    sub bar {
        my ($response) = @_;

        if ($response->{error}{code} == ERROR_OAUTH) {
            ...
        }
    }



# DESCRIPTION

Constant::Exporter is a module to define and export constants easily.

This module adopts [Exporter](http://search.cpan.org/perldoc?Exporter)'s full functionality so you can import constants with default constants, tags or only selected constants.

# KEYS AND MEANINGS

## `EXPORT`, `EXPORT_TAGS`

Constant names in `EXPORT` and `EXPORT_TAGS` will be exported by default.

## `EXPORT_OK` `EXPORT_OK_TAGS`

Constant names in `EXPORT_OK` and `EXPORT_OK_TAGS` will not be exported by default.
You can import these constants by feeding arguments to your constant class.

# AUTHOR

punytan <punytan@gmail.com>

# COPYRIGHT

Copyright 2013- punytan

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

[Exporter](http://search.cpan.org/perldoc?Exporter)
