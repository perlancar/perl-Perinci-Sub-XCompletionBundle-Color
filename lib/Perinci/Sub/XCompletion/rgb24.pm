package Perinci::Sub::XCompletion::rgb24;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Complete::Util qw(complete_array_elem hashify_answer);

our %SPEC;

$SPEC{gen_completion} = {
    v => 1.1,
};
sub gen_completion {
    my %fargs = @_;

    sub {
        my %cargs = @_;
        my $word = $cargs{word};
        my @words;
        my $is_partial = 0;
        if ($word =~ /\A(#?)([0-9A-Fa-f]{0,6})\z/) {
            my $has_pound_sign = $1 ? 1:0;
            my $digits = lc $1;
            if (length $digits == 6) {
                push @words, $digits;
            } else {
                push @words, map {"$digits$_"} 0..9,"a".."f";
                $is_partial = 1;
            }
        }

        complete_array_elem(array=>\@words, word=>$word);
    };
}

1;
# ABSTRACT: Generate digit-by-digit completion for rgb24 color

=cut
