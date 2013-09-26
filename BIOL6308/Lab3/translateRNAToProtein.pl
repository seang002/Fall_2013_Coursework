#!/usr/bin/perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Computational Methods I
# Author: Dan Shea
# Date: 2013-09-25
# Description:
# This program (name the program translateRNAToProtein.pl) should take an RNA or
# DNA sequence and provide the translation of the given sequence (here is the
# codon translation table). Given the codon translation table, write a script to
# translate the sequence below. Have the script ask the user for the input
#
# RNA
# AUGGCAUCGGCUAAAAAAUCCGUUGAUAUCAAAAAUAUUCGUAACUUCUCG
#
# DNA
# ATGGCATCGGCTAAAAAATCCGTTGATATCAAAAATATTCGTAACTTCTCG
#
################################################################################

# My codon hash, from http://en.wikipedia.org/wiki/Genetic_code
# For DNA, Uracil is substituted with Thymine 
my %codons = (  GCU => "Ala/A", GCC => "Ala/A", GCA => "Ala/A", GCG => "Ala/A",
                UUA => "Leu/L", UUG => "Leu/L", CUU => "Leu/L", CUC => "Leu/L", CUA => "Leu/L", CUG => "Leu/L",
                CGU => "Arg/R", CGC => "Arg/R", CGA => "Arg/R", CGG => "Arg/R", AGA => "Arg/R", AGG => "Arg/R",
                AAA => "Lys/K", AAG => "Lys/K",
                AAU => "Asn/N", AAC => "Asn/N",
                AUG => "Met/M",
                GAU => "Asp/D", GAC => "Asp/D",
                UUU => "Phe/F", UUC => "Phe/F",
                UGU => "Cys/C", UGC => "Cys/C",
                CCU => "Pro/P", CCC => "Pro/P", CCA => "Pro/P", CCG => "Pro/P",
                CAA => "Gln/Q", CAG => "Gln/Q",
                UCU => "Ser/S", UCC => "Ser/S", UCA => "Ser/S", UCG => "Ser/S", AGU => "Ser/S", AGC => "Ser/S",
                GAA => "Glu/E", GAG => "Glu/E",
                ACU => "Thr/T", ACC => "Thr/T", ACA => "Thr/T", ACG => "Thr/T",
                GGU => "Gly/G", GGC => "Gly/G", GGA => "Gly/G", GGG => "Gly/G",
                UGG => "Trp/W",
                CAU => "His/H", CAC => "His/H",
                UAU => "Tyr/Y", UAC => "Tyr/Y",
                AUU => "Ile/I", AUC => "Ile/I", AUA => "Ile/I",
                GUU => "Val/V", GUC => "Val/V", GUA => "Val/V", GUG => "Val/V", 	
                AUG => "START",
                UAA => "STOP", UGA => "STOP", UAG => "STOP",
);

print "Enter an DNA or RNA sequence followed by the enter key: ";
my $sequence = <STDIN>;
chomp $sequence;
$sequence = uc($sequence);
my $isDNA = 0;
my $dnasequence;

# Did we get a valid sequence?
if ($sequence =~ /^[A,T,G,C]+$/) {
    print "Valid DNA sequence found, translating...\n";
    # If we were given a DNA sequence, keep a copy of the original sequence
    $dnasequence = $sequence;
    # Translate the sequence to RNA for lookup in our %codons hash
    $sequence =~ s/T/U/g;
    # Flag that we were originally given a DNA sequence so we output the proper sequence
    $isDNA = 1;
}
elsif ($sequence =~ /^[A,U,G,C]+$/) {
    print "Valid RNA sequence found, translating...\n";
}
else {
    print "That is not a valid DNA or RNA sequence, terminating...\n";
    exit(1);
}

# If the sequence length is not divisible by 3 we have an incomplete codon
if (length($sequence)% 3 != 0){
    print "WARNING: This sequence contains incomplete codons.\n";
    print "WARNING: Incomplete codons will be ignored.\n";
}

# If we originally had a DNA sequence, break the original sequence into codons
# for display
my @dnasequence_codons;
if ($isDNA) {
    @dnasequence_codons = ($dnasequence =~ m/.{3}/g);
}

# Break up the sequencento codons for lookup
my @sequence_codons = ($sequence =~ m/.{3}/g);

# Push translations onto this array
my @translations;

# Perform a lookup on the codons
for my $codon (@sequence_codons){
    if (exists $codons{$codon}) {
        # Lookup suceeded, push matching amino acid onto @translations
        push(@translations, $codons{$codon});
    }
    else {
        # Lookup failed, warn user that sequence may be misaligned
        print "WARNING: Possible sequence misalignment. $codon can not be translated!\n";
        # Push the original codon as there is no valid translation
        push(@translations, $codon);
    } 
}

# Display output to the user, displaying relevant DNARNA sequene initially given
print "Given the sequence:\n";
if ($isDNA) {
    print "$dnasequence\n";
}
else {
    print "$sequence\n";
}
print "The following codons were found:\n";
if ($isDNA) {
    print "@dnasequence_codons\n";
}
else {
    print "@sequence_codons\n";
}
print "The translation of these codons is:\n";
print "@translations\n";
exit(0);