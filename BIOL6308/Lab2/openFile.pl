#!/usr/bin/env perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Methods I
################################################################################
# Author: Dan Shea
# Date: 2013-09-18
# Description: Write a program (name the program openFile.pl), that uses the
# fasta file from above and open the file and use a while loop to print out
# the entire file to STDOUT .
################################################################################

my $filename = "sequence.fasta";
open(my $FH, "<$filename") or die "Couldn't open $filename for reading.\n";
print "Displaying contents of $filename to STDOUT.\n";
while (<$FH>) {
    print $_;
}
print "\nEnd of file reached.\n";
close($FH) or die "Couldn't close file handle for $filename.\n";
exit(0);
