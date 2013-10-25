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
        if ($line =~ /(\w+)\t(\w+)\t([\w ]+)\t(.*)/) {
            my $temp = {from      => $1,
                        to        => $2,
                        species   => $3,
                        gene_name => $4,};
            # push the new record onto the list if species matches 'Mus musculus'
            if ($temp->{species} =~ /\s*mus musculus\s*/i) {
                # If the key doesn't exist, create the entry with an empty list reference
                if(not exists($results->{$temp->{to}})) {
                    $results->{$temp->{to}} = [];
                }
                push(@{$results->{$temp->{to}}}, $temp);
            }
        }
    }
}

sub linkMatches {
    my ($goa_ref, $gene_ref) = @_;
    my %results;
    for my $gene_key (keys(%$gene_ref)) {
        for my $goa_entry (@$goa_ref) {
            if ($goa_entry->[1] eq $gene_key) {
                if (not exists($results{$gene_key})) {
                    $results{$gene_key} = [];
                }
                push(@{$results{$gene_key}}, $goa_entry);
            }
        }
    }
    return(%results);
}

my @goa_entries;
my $goafile = "59.M_musculus.goa";
&loadGOA($goafile, \@goa_entries);

my %gene_entries;
my $genefile = "geneIDs3_MouseToUniProtAccessions.txt";
&parseFile($genefile, \%gene_entries);

my %results = &linkMatches(\@goa_entries, \%gene_entries);
for my $gene_key (keys(%results)) {
    say "For accession $gene_key: ";
    for my $arrayref (@{$results{$gene_key}}) {
        say "@$arrayref";
    }
    say "";
}
