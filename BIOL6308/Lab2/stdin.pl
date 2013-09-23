#!/usr/bin/env perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Methods I
################################################################################
# Author: Dan Shea
# Date: 2013-09-18
# Description:
# Write a program (name the program stdin.pl) should ask the user for two
# values.  There should be two STDIN calls, one for each value (Remember to
# chomp these values once you have them stored in variables). Then your program
# should find both the sum and product of the two values and output these values
# to STDOUT, like shown below.
#
# The sum of your values: 8 + 9 = 17
# The product of your values: 8 * 9 = 72
#
# Here is an example of chomp:
#
# print "please enter your name: ";
# my $name = <STDIN>;
# chomp $name;
#
################################################################################

print "Please enter the first value: ";
my $first_value = <STDIN>;
chomp $first_value;
print "Please enter the second value: ";
my $second_value = <STDIN>;
chomp $second_value;
print "The sum of your values: $first_value + $second_value = ",$first_value+$second_value,"\n";
print "The product of your values: $first_value * $second_value = ",$first_value*$second_value,"\n";
exit(0);
