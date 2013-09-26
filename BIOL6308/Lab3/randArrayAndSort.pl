#!/usr/bin/perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Computational Methods I
# Author: Dan Shea
# Date: 2013-09-25
# Description:
#
# This program (name the program randArrayAndSort.pl) should create an array and
# populate it with 100 random integers between 1 and 100 ($ perdoc –f rand). Sort
# the array numerically and write out the lowest 10 numbers on one line separated
# by tabs.
#
################################################################################

sub random_number {
    # Return a random number between 1 and 100
    # NOTE: int(rand(100)) returns floats between 0 and 99, hence we add 1 to the
    # result to get random integers in the range [1,100] inclusive.
    return (int(rand(100)) + 1);
}

# Generate an array of random numbers
my @random_array;
for my $i (0..99){
    $random_array[$i] = &random_number();
}

# Sort the array numerically
my @sorted_random_array = sort {$a <=> $b} @random_array;

# Display the output (the ten lowest numbers in the newly sorted array)
print "The ten lowest numbers:\n";
for my $i (0..9){
    printf "%d\t", $sorted_random_array[$i];
}
print "\n";
exit(0);