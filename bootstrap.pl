#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;

my (%Options, $debug);

GetOptions(\%Options, "help", "debug");

sub usage {
	print "Usage: $0 [OPTIONS] [INFILE]\n";
	print "This is a very simple interpreter to bootstrap our program.\n";
	print "It is very basic and only designed to get things going.  ";
	print "If you attempt to run\n";
	print "this on a complicated bnf it will fail.\n";
	print "Options:\n";
	print "\t--help prints this usage message.\n";
	print "\t--debug Enable debugging.\n";
}

my ($infile) = @ARGV;

if ($Options{"debug"}) {
	$debug = 1;
}

if ($Options{"help"} || ($infile eq "") || !(-f $infile)) {
	usage();
	exit 1;
}

open(my $fh, "<", $infile) or die "Unable to open $infile\n";
my $line = 1;
while (my $str = <$fh>) {
	chomp $str;
	if ($str eq "") {
		if ($debug) {
			print "Skipping line: $line: $str\n";
		}
	} elsif ($str =~ /^--(.*)$/) {
		if ($debug) {
			print "Skipping line: $line: $str\n";
		}
	} elsif ($str =~ /^comment (.*)$/) {
		if ($debug) {
			print "$line: comment $1\n";
		}
	} elsif ($str =~ /^separator (.*)$/) {
		if ($debug) {
			print "$line: separator : $1\n";
		}
	} elsif ($str =~ /^terminator (.*)$/) {
		if ($debug) {
			print "$line: terminator : $1\n";
		}
	} elsif ($str =~ /^token (.*) (.*)$/) {
		if ($debug) {
			print "$line: token : $1\n";
		}
	} elsif ($str =~ /^coercions (.*)$/) {
		if ($debug) {
			print "$line: coercions : $1\n";
		}
	} elsif ($str =~ /(.*)\.(.*)::=(.*)/) {
		if ($debug) {
			print "$line: Rule: $1: $2: $3\n";
		}
	} else {
		print "unhandled line $line: $str\n";
	}	
	$line = $line + 1;
}
close $fh;
