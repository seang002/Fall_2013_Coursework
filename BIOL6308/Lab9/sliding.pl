#!/usr/bin/env perl
use strict;
use warnings;
use diagnostics;

# Implement a Perl program that will take two arguments in ARGV: The first argument is the window size, and the second arugment
# is the sequence. This program will slide over the sequence calculating the gc content at each window size. You should be able
# to run the Perl program like:
#
# perl sliding.pl 5 ACGATAGAAAATGCTAAG
#
# And the output should look like:
#
# 0	0.400
# 1	0.400
# 2	0.400
# 3	0.200
# 4	0.200
# 5	0.200
# 6	0.200
# 7	0.000
# 8	0.200
# 9	0.400
# 10	0.400
# 11	0.400
# 12	0.400
# 13	0.400
#
# HINT: Use a nested for loop, the substr function, and the printf function to get nicely rounded numbers

my $window_size = $ARGV[0];
my $sequence = $ARGV[1];

for (my $i=0; $i < length($sequence)-$window_size-1; $i++){
    my $count = () = substr($sequence, $i, $window_size) =~ /[GC]/gi;
    printf("%d\t%0.3f\n",$i, $count/$window_size);
}