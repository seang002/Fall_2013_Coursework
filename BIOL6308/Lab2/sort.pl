#!/usr/bin/env perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Methods I
################################################################################
# Author: Dan Shea
# Date: 2013-09-18
# Description:
# Write a program (name the program sort.pl) that opens the following file (this
# file is tab delimited) and puts each of these value into one array. Next, sort
# the array in ascending order and print the array to STDOUT. Then, sort the
# array in descending order and print the array to STDOUT.
#
# Use the following syntax in a while loop to get the values into your array:
#
# my @arr2 = split/\t/, $_;
# push @arr, @arr2;
#
# What do you think we are doing with this quick function from above (split)?
#
# split is a function that splits a string based on the provided delimiter argument.
#
# Sorting an array is very easy, you can do it numerically like this:
#
# my @array = (100,5,8,92,-7,34,29,58,8,10,24);
# my @sorted = (sort @array);
#
################################################################################

# the input file
my $infile = "numbers.txt";
# the output array, initialized as an empty array
my @arr = ();
# open the file or die trying!
open(INFILE, "<$infile") or die "Couldn't open $infile for reading. $!\n";
# read in one line at a time and split it on tabs, toss the contents into an array
# called @line and push that array onto the output array.
while (<INFILE>) {
    chomp;
    my @line = split(/\t/, $_);
    push(@arr, @line);
}
# Sort the contents in numerical ascending order
my @sorted_ascending = sort({$a <=> $b} @arr);
# Sort the contents in numerical descending order
my @sorted_descending = sort({$b <=> $a} @arr);
# Display the output
print "Sorted numerically ascending order:\n";
print "@sorted_ascending\n";
print "Sorted numerically descending order:\n";
print "@sorted_descending\n";
# Exit
exit(0);