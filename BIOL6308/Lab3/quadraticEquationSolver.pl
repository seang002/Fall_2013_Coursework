#!/usr/bin/perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Computational Methods I
# Author: Dan Shea
# Date: 2013-09-25
# Description:
# This program (name the program quadraticEquationSolver.pl) sould solve a
# quadratic equation of the form:
#
# ax**2+bx+c
#
# The program asks for three coefficients in order. Quadratic coefficient cannot
# be zero (a != 0.) The key to solve this equation is to calculate delta:
#
# delta = b**2 - 4ac
#
# Based on the sign of delta, three cases are possible:
#
# If delta is greater than zero then it has two separate roots:
#
# x1,x2 = (-b +/- delta) / 2a
#
# If delta is zero then it has a repeated root.
#
# If delta is less than zero, it doesn’t have real roots, and you have to show
# an appropriate message.
#
################################################################################

sub calculate_delta {
    my ($a, $b, $c) = @_;
    return($b**2 - 4*$a*$c);
}

my @coefficients;
for my $prompt (qw(a b c)){
    print "Please enter the $prompt coefficient: ";
    my $input = <STDIN>;
    chomp $input;
    push(@coefficients, $input);
}

# Did the user give us a 0 as the a coefficient?
if ($coefficients[0] == 0) {
    print "The quadratic coefficient cannot be zero.\n";
    exit(1);
}


my $delta = &calculate_delta(@coefficients);
print "The delta is $delta\n";
if ($delta < 0) {
    print "The roots of this equation are imaginary.\n";
}
elsif ($delta == 0) {
    printf("The root is %f\n", -$coefficients[1]/(2*$coefficients[0]));
}
else {
    printf("The first root is %f\n", (-$coefficients[1]+$delta)/(2*$coefficients[0]));
    printf("The second root is %f\n", (-$coefficients[1]-$delta)/(2*$coefficients[0]));
}
exit(0);
