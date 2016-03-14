#!/usr/bin/perl6

use v6;

# Inspired by
# http://dev.aboutus.org/2011/07/03/getting-started-exploratory-parsing.html
# but using Perl 6 regexes and tokens

grammar ExploratoryParsing {
    token TOP {
        <grammar>+
    }

    token grammar { <comment> | <rrule> | <whitespace> | <other_char> }
    token comment { ^ '--' .* $ }

    rule rrule { <label> '.' <key> '::=' <value> ';' }

    token value { [<![';']> .]+ }

    token label { <alpha>+ }
    token key { <alpha>+ }

    token whitespace { '\n' ' '* }

    token other_char { . }

}

sub MAIN() {
    my $text = slurp('../lbnf.bnf');
    say "Read infile, parsing...";

    my $match = ExploratoryParsing.parse($text);
    say "Found ", +$match, " facts.";
}
