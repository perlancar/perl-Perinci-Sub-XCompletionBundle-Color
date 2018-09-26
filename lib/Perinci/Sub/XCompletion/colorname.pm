package Perinci::Sub::XCompletion::colorname;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Complete::Util qw(complete_hash_key);

our %SPEC;

$SPEC{gen_completion} = {
    v => 1.1,
};
sub gen_completion {
    my %fargs = @_;

    sub {
        require Graphics::ColorNames;

        my %cargs = @_;

        my $scheme = $fargs{scheme} // 'X';
        tie my %colors, 'Graphics::ColorNames', $scheme;
        complete_hash_key(hash=>\%colors, word=>$cargs{word});
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
