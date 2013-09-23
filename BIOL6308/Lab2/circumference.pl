#!/usr/bin/env perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Methods I
################################################################################
# Author: Dan Shea
# Date: 2013-09-18
# Description:
# Write a program (name the program circumference.pl) that computes the
# circumference of a circle. The program should prompt the user for a radius of a
# circle, then returns the circumference of the circle. The formula to use is:
# circumference = 2 * pi * radius. Create a variable $pi and give it a value of
# 3.1416. The expected answer is about 78.5 for a circle who's radius is 12.5.
# Make sure if a user enters a value <=0 then the script dies, and tells the user
# that this type of value can not be calculated, b/c a circle can not have a
# negative or 0 radius. 
#
# Exit Status:
# 0 - program ran succesfully
# 1 - user did not enter a value
# 2 - user entered a value <= 0
################################################################################

# define subroutine that performs the computation
sub compute_circumference{
    my $pi = 3.1416;
    my $radius = $_[0];
    return(2*$pi*$radius);
}

# gather user input for computation
print "Please enter the radius of the circle: ";
my $input_radius = <STDIN>;
chomp $input_radius;

# Test input for validity
if ($input_radius eq "") {
    print "You did not enter a value!\n";
    print "Exiting...\n";
    exit(1);
}
elsif ($input_radius <= 0) {
    print "Your radius is equal to or less than 0. ";
    print "Please enter a value greater than 0.\n";
    print "This value can not be computed, exiting...\n";
    exit(2);
}

# If input was valid, perform computation and display results
print "Circumference of a circle with a radius of $input_radius is: ",&compute_circumference($input_radius),"\n";
exit(0);