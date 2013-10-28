#!/usr/bin/perl
use warnings;
use strict;
use diagnostics;
use feature qw(say);

# BIOL6308 - Bioinformatics Methods I
# Dan Shea
# Lab#7
#
# Description:
# For this part of the assignment, imagine you work for a company that stores
# sequence data with affymetrix identifiers but you want to compare this data with
# another company that uses UNIPROT_ACCESSION. Use DAVID to convert your
# affymetrix file (right click - Save Link As) to UNIPROT_ACCESSION identifiers
# (call this file affymetrixIDs_MouseToUniProtAccessions.txt - or you can use this
# file (righ click - Save Link As)). Here you need to upload the affymetrix list,
# and not do clustering, but just get the list uploaded to the DAVID server. Once
# uploaded go back to the "Gene ID Conversion Tool", and covert to
# "UNIPROT_ACCESSION", then highlight the affymetrix list in the "List Manager" on
# the left. During lab you will have multiple list there, so make sure to
# highlight the correct one. Finally Run the "Submit to Conversion Tool"
#
# Then, using Perl, compare the two data files
# (affymetrixIDs_MouseToUniProtAccessions.txt &
# geneIDs3_MouseToUniProtAccessions.txt) to find common mus musculus
# UNIPROT_ACCESSIONs of interest.

my $affymetrixfile = "affymetrixIDs_MouseToUniProtAccessions.txt";
my $geneidfile = "geneIDs3_MouseToUniProtAccessions.txt";

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

# Read in the two files we are concerned about
my @affymetrix_records;
my @geneid_records;
&parseFile($affymetrixfile, \@affymetrix_records);
&parseFile($geneidfile, \@geneid_records);

# If the key exists in both hashes, there is a correspondence between the two files
# for that record.
for my $affymetrix_record (@affymetrix_records) {
    for my $geneID_record (@geneid_records) {
        if ($affymetrix_record->{to} eq $geneID_record->{to}) {
            printf("Uniprot: %s, Affymetrix: %s, GeneID: %s\n",$affymetrix_record->{to},$affymetrix_record->{from},$geneID_record->{from});
            last;
        }
    }
}
