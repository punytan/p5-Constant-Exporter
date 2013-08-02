package Constant::Exporter;
use strict;
use warnings;
our $VERSION = '0.01';
require Exporter;

sub import {
    my ($class, %args) = @_;

    my $pkg = caller;

    my (@export, @export_ok, %export_tags, %constants);

    if ($args{EXPORT_TAGS}) {
        @export    = @{ $args{EXPORT}    || [] };
        @export_ok = @{ $args{EXPORT_OK} || [] };

        for my $tag (keys %{ $args{EXPORT_TAGS} }) {
            for my $name (keys %{ $args{EXPORT_TAGS}{$tag} || {} }) {
                my $value = $args{EXPORT_TAGS}{$tag}{$name};
                $constants{$name} = $value;
                $export_tags{$tag} ||= [];
                push @{$export_tags{$tag}}, $name;
                push @export_ok, $name;
            }
        }
    } else {
        for my $name (keys %{ $args{EXPORT} || {} }) {
            $constants{$name} = $args{EXPORT}->{$name};
            push @export, $name;
        }
        for my $name (keys %{ $args{EXPORT_OK} || {} }) {
            $constants{$name} = $args{EXPORT_OK}->{$name};
            push @export_ok, $name;
        }
    }

    no strict 'refs';
    for my $name (keys %constants) {
        my $value = $constants{$name};
        *{"${pkg}::${name}"} = sub () { $value };
    }

    push @{"${pkg}::ISA"}, 'Exporter';
    push @{"${pkg}::EXPORT"}, @export;
    push @{"${pkg}::EXPORT_OK"}, @export_ok;
    %{"${pkg}::EXPORT_TAGS"} = %export_tags;

    *{"${pkg}::import"} = sub {
        my $pkg = shift;
        $pkg->export_to_level(1, undef, @_)
    };
}

1;
__END__

=encoding utf-8

=head1 NAME

Constant::Exporter - Blah blah blah

=head1 SYNOPSIS

  use Constant::Exporter;

=head1 DESCRIPTION

Constant::Exporter is

=head1 AUTHOR

punytan E<lt>punytan@gmail.comE<gt>

=head1 COPYRIGHT

Copyright 2013- punytan

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
