#!/usr/bin/env perl
use warnings;
use strict;

# Here is an example of writing output to a file
my $filename = "example.out";
open(my $FH, '>', $filename) or die "Could not open $filename for writing.\n";
print "Writing output to $filename\n";
for my $i (1..10) {
    print $FH "line: $i\n";
}
print "Done writing output to $filename\n";
close $FH or die "Could not close the file handle for $filename\n";
print "File handle for $filename closed.\n";

open($FH, '<', $filename) or die "Could not open $filename for reading.\n";
print "Reading lines from $filename\n";
while (<$FH>){
    chomp;
    print "Read from $filename: $_\n";
}
print "Done reading lines from $filename\n";
close $FH or die "Could not close the file handle for $filename\n";
print "File handle for $filename closed.\n";
print "Exiting.\n";

print "Does file handle need a sigil?\n";
open(INFILE, "<$filename") or die "Could not open $filename for reading.\n";
close INFILE or die "Could not close the file handle for $filename\n";
print "It works!\n";
exit(0);
