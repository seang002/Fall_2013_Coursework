#!/usr/bin/env perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Methods I
################################################################################
# Author: Dan Shea
# Date: 2013-09-18
# Description:
# Write a program ((name the program scrambler.pl) which will do a simple
# scrambling of a string. The script should have variables for the original
# string (eg $message) and a number (eg $number) (which should be less than the
# length of the string). The scrambling should be achieved by reversing
#
# 1). The first $number of characters of $string
# Then...
# 2). The last $number characters of $string
#
# Order of steps must be preserved to avoid giving any hints as to the values
# used the scrambled string should appear all in lowercase.
#
# For example:
# String=Babraham Number=2, Scrambed= abbrahma
# String=Institute Number=3, Scrambled=snititetu
#
# Hint: use perl's substr and reverse functions
#
################################################################################

sub scramble{
    # Gather arguments
    my ($string, $number, $length) = @_;
    # Get first $number characters of the string
    my $first_n = substr($string, 0, $number);
    # Reverse them
    my $first_n_reversed = join("",reverse(split(//,$first_n)));
    # Reverse the entire string
    my $string_reversed = join("",reverse(split(//,$string)));
    # Get first $number characters of the reversed string
    my $last_n_reversed = substr($string_reversed, 0, $number);
    # Get the middle of the string
    my $middle_n = substr($string, $number, $length-(2*$number));
    # Display the scrambled string
    my $scrambled_string = lc($first_n_reversed.$middle_n.$last_n_reversed);
    print "$scrambled_string\n";
}

print "Enter a string:";
my $input_string = <STDIN>;
chomp $input_string;
print "Enter a number:";
my $input_number = <STDIN>;
chomp $input_number;

my $length = split(//,$input_string);
if ($input_number =~ /^[0-9]+$/ && $length/2 >= $input_number) {
    &scramble($input_string, $input_number, $length);
    exit(0);
}
else {
    print "The number should be equal to or less than half the legnth of the input string.\n";
    print "Exiting...\n";
    exit(1);
}