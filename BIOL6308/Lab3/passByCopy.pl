#!/usr/bin/perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Computational Methods I
# Author: Dan Shea
# Date: 2013-09-25
# Description:
#
# This program (name the program passByCopy.pl) should open this file and slurp
# the entire file into an array. Then create a subroutine called passByCopy and
# pass the array (pass by value) to the newly created subroutine, inside your
# subroutine change the 0 element of the array to = "changed", do not return
# anything from the subroutine. Outside your subroutine, print the array out in
# the main part of your program.
#
# Do not do a:
#
# print passByCopy(@arr), "\n";
#
# Did your program change the array in main?
#
# No.
#
################################################################################

sub passByCopy {
    my @arg = @_;
    $arg[0] = "changed";
}

my $filename = "sequence.fasta";
open(my $infile, "<", $filename) or die "Couldn't open ",$filename," for reading. ",$!;
my @ary = <$infile>;
print "Contents of \@ary before subroutine call:\n","@ary\n";
&passByCopy(@ary);
print "Contents of \@ary after subroutine call:\n","@ary\n";
exit(0);