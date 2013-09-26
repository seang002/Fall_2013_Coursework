#!/usr/bin/perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Computational Methods I
# Author: Dan Shea
# Date: 2013-09-25
# Description:
#
# This program (name the program findStats.pl) will generate the total, count,
# and average from a list of numbers. Create a subroutine which does this,
# use something like this:
#
# my @arr = (1,2,3,4,5,6);
# my ($total, $count, $average) = findStatsOfArray(@arr);
#
################################################################################

sub sum {
    my @ary = @_;
    my $sum = 0;
    for my $i (@ary){
        $sum += $i;
    }
    return $sum;
}

sub findStatsOfArray {
    my @ary = @_;
    my $count = @ary;
    my $total = &sum(@ary);
    my $average = $total / $count;
    return($total, $count, $average);
}

my @ary = (1,2,3,4,5,6);
print "Results of findStatsOfArray(@ary):\n";
my ($total, $count, $average) = &findStatsOfArray(@ary);
print "  total: $total\n";
print "  count: $count\n";
print "average: $average\n";
exit(0);