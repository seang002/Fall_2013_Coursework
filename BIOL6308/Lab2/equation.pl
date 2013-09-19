#!/usr/bin/env perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Methods I
################################################################################
# Author: Dan Shea
# Date: 2013-09-18
# Description:
# Write a program (name the program equation.pl) to find the answer to the
# following equation:
#
#     x = sqrt((a+b)**2)/c
#
# For values:
#
#     a=2 b=3 c=4
#     a=-20 b=5 c=3
################################################################################

sub solve_for_x{
    my ($a, $b, $c) = @_;
    return sqrt(($a+$b)**2)/$c;
}

print "Given a=2, b=3 and c=4: x=",&solve_for_x(2,3,4),"\n";
print "Given a=-20, b=5 and c=3: x=",&solve_for_x(-20,5,3),"\n";
exit(0);