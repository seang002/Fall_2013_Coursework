#!/usr/bin/perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Computational Methods I
# Author: Dan Shea
# Date: 2013-09-25
# Description:
#
# This program (name the program passScalar.pl) should create a scalar:
#
# $dna1 = 'atggttt';
#
# Next create a subroutine called reverseSequence which takes a scalar as an
# argument (parameter), just pass the scalar by value. Inside the subroutine
# reverse the scalar and return this new reversed scalar to your main program.
#
# Print both scalars out (the original and the returned),
# do you have the reverse?
################################################################################

sub reverseSequence {
    (my $arg) = @_;
    return join('',reverse(split('',$arg)));
}

my $dna = 'atggttt';

print "The original scalar value: ",$dna,"\n";
print "The result of calling reverseSequence with ",$dna," as an argument: ",&reverseSequence($dna),"\n";
exit(0);