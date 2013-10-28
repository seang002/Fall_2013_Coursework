#!/usr/bin/perl
use warnings;
use strict;
use diagnostics;
use feature qw(say);
use Data::Dumper;

# BIOL6308 - Bioinformatics Methods I
# Dan Shea
# Lab#7
#
# Description:
# Your boss wants to know which UNIPROT_ACCESSION codes in the
# geneIDs3_MouseToUniProtAccessions.txt file have GO annotations with an IDA as a
# Evidence code. An example of this would be Q01341 from the
# geneIDs3_MouseToUniProtAccessions.txt file. To get started, Download the current
# Mus musculus GO Annotations at EBI
# (http://www.ebi.ac.uk/GOA/mouse_release.html), or use this older file (right
# click - Save Link As). Then think how you could address this problem with Perl.

sub loadGOA {
    my ($filename, $goa_ref) = @_;
    open(my $fh, "<", $filename) or die "Couldn't open $filename: $!";
    while (my $line = <$fh>) {
        chomp($line);
        if ($line =~ /.*?\t+IDA\t+.*?/) {
            my $entry = [split(/\t+/, $line)];
            push(@$goa_ref, $entry);
        }
    }
}

sub parseFile {
    my ($filename, $results) = @_;
    open(my $fh, "<", $filename) or die "Couldn't open $filename: $!";
    # for each entry in the file, create a hash and return a list of these hashes
    while (my $line = <$fh>) {
        chomp($line);
        # parse the line and create a new record
        my @fields = split(/\t/, $line);
        my $temp = {from      => $fields[0],
                    to        => $fields[1],
                    species   => $fields[2],
                    gene_name => $fields[3],};
        # push the new record onto the list if species matches 'Mus musculus'
        if ($temp->{species} =~ /\s*mus musculus\s*/i) {
            push(@$results, $temp);
        }
    }
}

sub linkMatches {
    my ($goa_ref, $gene_ref) = @_;
    for my $gene_entry (@$gene_ref) {
        for my $goa_entry (@$goa_ref) {
            if ($goa_entry->[1] eq $gene_entry->{to}) {
                say "@$goa_entry";
                print "$gene_entry->{$_} " for keys(%$gene_entry);
                say "";
            }
        }
    }
}

my @goa_entries;
my $goafile = "59.M_musculus.goa";
&loadGOA($goafile, \@goa_entries);

my @gene_entries;
my $genefile = "geneIDs3_MouseToUniProtAccessions.txt";
&parseFile($genefile, \@gene_entries);

&linkMatches(\@goa_entries, \@gene_entries);