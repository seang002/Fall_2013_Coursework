#!/usr/bin/env perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Methods I
################################################################################
# Author: Dan Shea
# Date: 2013-09-18
# Description: Write a program (name the program openFileStoreInArray.pl) to
# open the file and slurp the entire file into an array: Use the following
# syntax:
#
#     my @arr = <INFILE>; #this will slurp the entire file into an array
#
# Have the program print out different indexes, such as 2, 1, 0
#
# Remember, INFILE is the filehandle you created in your script. Then open an
# OUTFILE to print data to. Finally use a for loop to add a line number to each
# line, and print this number in front of each line, to the OUTFILE you opened.
# Remember how we open an OUTFILE for writing? To open an outfile, you use code
# almost identical to opening an INFILE:
#
#     unless ( open (OUTFILE, ">", $DnaOutfileName) ){
#         die "can't open " , $DnaOutfileName , " for writing: " ,  $!;
#     }
################################################################################

# place filename in a variable
my $infilename = "sequence.fasta";
# open the file for reading
open(my $INFILE, "<$infilename") or die "Couldn't open $infilename for reading. $!\n";
# slurp the file contents into an array
my @arr = <$INFILE>;
# close the file handle
close($INFILE) or die "Couldn't close file handle for $infilename. $!\n";

# place the name of the output file into a variable
my $outfilename = "sequence.fasta.with_line_numbers.out";
# open up the output file for writing
open(my $OUTFILE, ">$outfilename") or die "Couldn't open $outfilename for writing. $!\n";
my $line_number = 1;
for my $line (@arr) {
    print $OUTFILE "$line_number $line";
    $line_number++;
}
# close the file handle
close($OUTFILE) or die "Couldn't close file handle for $outfilename. $!\n";
exit(0);
