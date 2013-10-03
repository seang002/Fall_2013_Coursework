#!/usr/bin/env perl
use warnings;
use strict;
use diagnostics;
use feature qw(say);

################################################################################
# BIOL6308 - Bioinformatics Computational Methods I
# Author: Dan Shea
# Date: 2013-10-03
# Description:
#
# Your next script (call it/ findHydrophobicRegionsInFastaFile.pl) should open
# this fasta file and scan the fasta file for hydrophobic motifs, which are
# located by the occurrence of a stretch of 8 or more amino acids from the
# following set of amino acids: VILMFWCA. So VILMFWCA would actually be a motif.
# The fasta file from above has a header line and then on the next line the
# entire sequence can be found. So each sequence entry takes up exactly two
# lines. Your code should produce the following output:
#
# Hydrophobic stretch found in: P30450 | Homo sapiens (Human). | NCBI_TaxID=9606; | 365 | Name=HLA-A; Synonyms=HLAA;
# AVVAAVMW
# The match was at position: 325
# Hydrophobic stretch found in: A7MBM2 | Homo sapiens (Human). | NCBI_TaxID=9606; | 1401 | Name=DISP2; Synonyms=DISPB, KIAA1742;
# VAVLMLCLAVIFLC The match was at position: 170
# LLALVAIFF
# The match was at position: 493
# IWICWFAALAA
# The match was at position: 705
# LALALAFA
# The match was at position: 970
#
# Hydrophobic region(s) found in 2 sequences out of 15 sequences
#
# So as you can see two of the sequences had a hydrophobic motif
# (by our definition), with one of the sequences actually containing 4 motifs! 
#
################################################################################

=cut
***** WARNING *****

This code does not run on fisher!
fisher is using an older version of perl that will not allow you to pass a hash
reference to the keys function.  If you want to run this code on fisher, please
use:
    findHydrophobicRegionsInFastaFile.pl

From perlref keys: http://perldoc.perl.org/functions/keys.html

Starting with Perl 5.14, keys can take a scalar EXPR, which must contain a
reference to an unblessed hash or array. The argument will be dereferenced
automatically. This aspect of keys is considered highly experimental.
The exact behaviour may change in a future version of Perl.

***** WARNING *****
=cut

sub usage {
    say "Usage: $0 inputfile";
    say "File should be in Fasta format.";
    exit(1);
}

sub read_file {
    my ($filename) = @_;
    my %input;
    open(my $FILEHANDLE, "<", $filename) or die "Couldn't open $filename for reading.",$!;
    my $key;
    my $value;
    while (my $line = <$FILEHANDLE>) {
        # newlines are delicious and nutritious!
        chomp($line);
        # is it a header line? Then it is a key into the hash.
        if ($line =~ /^>/) {
            $key = $line;
        }
        # else it is a sequence to be assigned as the value
        # if we had multiple sequences we would use an anonymous list reference
        # pushing/unshifting additional sequences onto the list, but since we
        # are expecting one entry per header, we will keep it simple
        else {
            $value = $line;
            $input{$key} = $value;
        }
    }
    # return the populated %input hash
    return(%input);
}

sub parse {
    my %input = @_;
    my $hydrophobic_region = '([VILMFWCA]{8})';
    my $total_sequences = keys(%input);
    my $matched_sequences = 0;
    # for my entries in the hash
    for my $key (keys(%input)){
        my @matches;
        # push any matches as anonymous hashes onto the matches array
        while ($input{$key} =~ /$hydrophobic_region/g) {
            my $hashref = {pos($input{$key})=>$1};
            push(@matches, $hashref);
        }
        # if I found hydrophobic regions in the sequence, display them
        if (@matches) {
            # increment the match counter
            $matched_sequences++;
            say "Hydrophobic stretch found in: ", $key;
            for my $hashref (@matches) {
                for my $position (keys($hashref)){
                    say $hashref->{$position};
                    say "The match was at position: (",$position-length($hashref->{$position})+1,"-",$position,")";
                }
            }
        }
    }
    say "Hydrophobic region(s) found in ",$matched_sequences," sequences out of ",$total_sequences," sequences."
}

# main
# Check for correct number of arguments
if (scalar @ARGV != 1) {
    &usage;
}

my $filename = $ARGV[0];

# Does the file exist?
if (! -e $filename) {
    say $filename," does not exist.";
    exit(2);
}

# Can it be read?
if (! -r $filename) {
    say $filename," is not readable.";
    exit(3);
}

# Open the file for reading and place the entire contents of the file into a hash
my %input = &read_file($filename);

# Parse out values and display output
# Note: range in the form of N-M that is given in output can be used via cut to
# verify location of substring match
&parse(%input);

# exit cleanly
exit(0);