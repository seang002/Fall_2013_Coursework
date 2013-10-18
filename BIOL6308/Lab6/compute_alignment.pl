#!/usr/bin/env perl
use warnings;
use strict;
use diagnostics;
use feature qw(say);
# Info on BioPerl and SeqIO may be found here:
# http://doc.bioperl.org/releases/bioperl-1.0.1/Bio/SeqIO.html
use Bio::SeqIO;

=cut
BIOL 6381 - Sec01
Author: Dan Shea
Date: 2013-10-18

Description:
You are given two FASTA files. One has a query sequence and the other one has
multiple sequences. You have to align the query sequence with each of the
sequences in collection. The alignment measure is calculated simply:

If the sequences match in corresponding character the alignment score is
incremented. (If they differ in length the comparison is made till the last
character of shorter sequence. the alignment score is divided by longer
sequence length For example consider these sequences:

AGGCT
ACGCTTTT 

The alignment score is: 4/8 = .5

A
ACTA 

The alignment score is : 1/4 = .25
=cut

sub parseFastaFile {
    my ($filename) = @_;
    # Open the file for reading using BioPerl parsing of the fasta format
    my @sequences;
    my $sequenceIO = Bio::SeqIO->new(-file => $filename, '-format' => 'Fasta');
    while (my $sequence = $sequenceIO->next_seq) {
        push(@sequences,$sequence->seq);
    }
    return(@sequences);
}

sub computeAlignmentScore {
    my @query_sequence = split(//,shift(@_));
    my @sequences = @_;
    # Compute the legnth of the query sequence
    my $query_length = @query_sequence;
    # Compare the query sequence to each sequence in the collection
    for my $sequence (@sequences){
        # Split the sequence into an array for characterwise comparison
        my @sequence = split(//,$sequence);
        # Depending on which sequence is longer, perform the character-wise comparison
        # counting any matches in the sequence
        my $sequence_length = length($sequence);
        if ( $sequence_length <= $query_length) {
            my $count = 0;
            for(my $i=0; $i<@sequence; $i++){
                if ($sequence[$i] eq $query_sequence[$i]) {
                    $count++;
                }
            }
            # Print results
            say $sequence;
            say @query_sequence;
            printf("The alignment score is: %d / %d = %0.2f\n", $count, $query_length, $count/$query_length);
        }
        else{
            my $count = 0;
            for(my $i=0; $i<@query_sequence; $i++){
                if ($sequence[$i] eq $query_sequence[$i]) {
                    $count++;
                }
            }
            # Print results
            say @query_sequence;
            say $sequence;
            printf("The alignment score is: %d / %d = %0.2f\n", $count, $sequence_length, $count/$sequence_length);
        }

    }
}

my $cystic_fibrosis_file = "cystic_fibrosis.fasta";
my $sequence_collection_file = "sequence_collection.fasta";

# Collect the query sequence for the comparison
my ($query_sequence) = parseFastaFile($cystic_fibrosis_file);
# Collect the sequences to be compared
my @sequences = parseFastaFile($sequence_collection_file);

# Perform the analysis
computeAlignmentScore($query_sequence, @sequences);