#!/usr/bin/env perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Methods I
################################################################################
# Author: Dan Shea
# Date: 2013-09-18
# Description:
# Write a program (name the program printLines.pl) that prompts for and reads a
# string (on one line), then prompts the user for a number (on another line), then
# prints out the string the number of times indicated by the number, with each
# copy on a separate line. Have it print a maximum of 100 lines, then print an
# error message if the number given is greater than 100.
#
# Exit status:
# 0 - program completed successfully
# 1 - Willis don't know his positive integer numbers
# 2 - Willis don't know his positive integer numbers between 1 and 100 inclusive
################################################################################

# Get the inputs from the user
print "Please enter a string: ";
my $input_string = <STDIN>;
print "Please enter number: ";
my $input_number = <STDIN>;
chomp $input_number;

# Ensure the second input is an integer number
unless ($input_number =~ /^[0-9]+$/) {
    print "What'chu talking 'bout Willis, that ain't no positive integer number fool!\n";
    print "Exiting...\n";
    exit(1)
}

# Ensure it is a positive integer between 1 and 100
if ($input_number <= 0 || $input_number > 100){
    print "What'chu talking 'bout Willis!\n";
    print "You must enter a number greater than 0 and less than 100.\n";
    print "Exiting...\n";
    exit(2);
}

for (1..$input_number){
    print $input_string;
}
exit(0);