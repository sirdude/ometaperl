#!/usr/bin/perl6

use v6;

# Inspired by
# http://dev.aboutus.org/2011/07/03/getting-started-exploratory-parsing.html
# but using Perl 6 regexes and tokens

grammar ExploratoryParsing {
    token TOP {
        <fact>+
    }

    token fact { <key> <value> | <other_char> }

    token key { <whitespace> <word>+ ':' }

    token value { [<!key> .]+ }

    token word { <alpha>+ ' '* }

    token whitespace { '\n' ' '* }

    token other_char { . }

}

sub MAIN() {
    my $text = slurp('world192.txt');
    say "Read world factbook. Parsing...";

    my $match = ExploratoryParsing.parse($text);
    say "Found ", +$match, " facts.";
}
