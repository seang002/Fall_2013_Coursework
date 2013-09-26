#!/usr/bin/perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Computational Methods I
# Author: Dan Shea
# Date: 2013-09-25
# Description:
#
# This program (name the program stats.pl) should have a subroutine to calculate
# the mean, variance and standard deviation of an array of numbers. Generate a
# random data set of between 10 and 20 measures with values between 0 and 100 and
# pass this to the subroutine.
#
# The formula for calculating the variance of a sample is
#
# variance = (sum((x-n)**2))/(n-1)
#
# Standard deviation is the square root of the variance.
#
################################################################################

sub random_number {
    # Generate a random integer between $lower_bound and $upper_bound inclusive
    # &random_number(0,10) would return a random number between [0,10]
    # &random_number(10,20) would return a random number between [10,20]
    my $lower_bound = $_[0];
    my $upper_bound = $_[1];
    return int(rand($upper_bound-$lower_bound+1))+$lower_bound;
}

sub sum {
    # return the sum of an array of integers
    my @ary = @_;
    my $sum = 0;
    for my $i (@ary){
        $sum += $i;
    }
    return $sum;
}

sub mean {
    # return the computed mean of an array of integers
    my @ary = @_;
    my $count = @ary;
    my $sum = &sum(@ary);
    return ($sum/$count);
}

sub variance {
    # Return the computed variance of an array of integers
    my @ary = @_;
    my $count = @ary;
    my $mean = &mean(@ary);
    my @square_of_differences = map {($mean - $_)**2} @ary;
    my $sum_of_square_of_differences = &sum(@square_of_differences);
    return ($sum_of_square_of_differences / ($count-1));
}

sub standard_deviation {
    # Compute the standard deviation of an array of integers
    my @ary = @_;
    my $variance = &variance(@ary);
    return sqrt($variance);
}

# Generate an array of size between [10,20]
# Populate the array with random numbers between [0,100]
my @random_array;
for my $i (0..&random_number(9,19)){
    $random_array[$i] = &random_number(0,100);
}

# Display measures and statistics
print "Measures:\n";
print "@random_array\n";
print "          Mean: ",&mean(@random_array),"\n";
print "      Variance: ",&variance(@random_array),"\n";
print "Std. Deviation: ",&standard_deviation(@random_array),"\n";
exit(0);