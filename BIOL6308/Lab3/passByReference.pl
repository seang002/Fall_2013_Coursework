#!/usr/bin/perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Computational Methods I
# Author: Dan Shea
# Date: 2013-09-25
# Description:
#
# This program (name the program passByReference.pl) should open the same file
# as above and slurp the entire file into an array. Then create a subroutine
# called passByReference and pass the array by reference (pass by reference) to
# the newly created subroutine, inside the subroutine change the 0 element of
# the array to = "changed", do not return anything from the subroutine. Outside
# your subroutine, print the array out in the main part of your program.
#
# Did your program change the array in main?
# Yes.
#
################################################################################

sub passByReference {
    (my $arg_ref) = @_;
    $arg_ref->[0] = "changed";
}

my $filename = "sequence.fasta";
open(my $infile, "<", $filename) or die "Couldn't open ",$filename," for reading. ",$!;
my @ary = <$infile>;
print "Contents of \@ary before subroutine call:\n","@ary\n";
&passByReference(\@ary);
print "Contents of \@ary after subroutine call:\n","@ary\n";
exit(0);