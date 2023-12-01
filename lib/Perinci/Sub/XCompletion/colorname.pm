package Perinci::Sub::XCompletion::colorname;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

$SPEC{gen_completion} = {
    v => 1.1,
};
sub gen_completion {
    my %fargs = @_;

    sub {
        require Complete::Color;

        my %cargs = @_;
        Complete::Color::complete_color_name(word=>$cargs{word});
    };
}

1;
# ABSTRACT: Generate completion for color names (names from Graphics::ColorNames scheme)

=head1 CONFIGURATION

=head2 scheme

str, default C<X>. Set L<Graphics::ColorNames> scheme to use.


=head1 SEE ALSO

L<Graphics::ColorNames>

=cut
