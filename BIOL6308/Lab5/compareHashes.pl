#!/usr/bin/env perl
use warnings;
use strict;
use diagnostics;
use feature qw(say);
use List::MoreUtils qw(each_array);

###########################################################################
# BIOL 6308 - Bioinformatics Methods I
# Lab #5 - Question 6
# In this question you are asked to write a subroutine (compareHashes)
# that will take two simple hash references as arguments and to check
# whether these two hashes are equal or not.
# 
# Use the following four hashes
# 
# my %hash1 = ( ITALY => "ROME",
#               FRANCE => "PARIS"
#             );
# my %hash2 = ( ITALY => "MILAN",
#               FRANCE => "PARIS"
#             );
# my %hash3 = ( ITALY => "ROME" );
# 
# my %hash4 = ( SPAIN => "ROME",
#               FRANCE => "PARIS" 
#             );
# 
# Two hashes are equal if and only equal if:
# 
#     The numbers of keys for two hashes are equal.
#     The lists of keys for the two hashes are equal.
#     The values corresponding to identical keys are equal. 
# 
# 
# Compare %hash1 and %hash1
# Compare %hash1 and %hash2
# Compare %hash1 and %hash3
# Compare %hash1 and %hash4
# 
# The output of your program should look like this:
# 
# the first hash:
# ITALY ROME
# FRANCE PARIS
# the second hash:
# ITALY ROME
# FRANCE PARIS
# Two above hashes are equal
# 
# the first hash:
# ITALY ROME
# FRANCE PARIS
# the second hash:
# ITALY MILAN
# FRANCE PARIS
# Two above hashes are not equal
# 
# the first hash:
# ITALY ROME
# FRANCE PARIS
# the second hash:
# ITALY ROME
# Two above hashes are not equal
# 
# the first hash:
# ITALY ROME
# FRANCE PARIS
# the second hash:
# SPAIN ROME
# FRANCE PARIS
# Two above hashes are not equal
###########################################################################

my %hash1 = ( ITALY => "ROME",
              FRANCE => "PARIS",
            );
my %hash2 = ( ITALY => "MILAN",
              FRANCE => "PARIS",
            );
my %hash3 = ( ITALY => "ROME" );

my %hash4 = ( SPAIN => "ROME",
              FRANCE => "PARIS",
            );

sub compare_hashes {
    my ($hashref1, $hashref2) = @_;
    my %hash1 = %$hashref1;
    my %hash2 = %$hashref2;
    my @keys1 = sort(keys(%hash1));
    my @keys2 = sort(keys(%hash2));
    if (scalar(@keys1) != scalar(@keys2)){
        say "Two above hashes are not equal";
        return(0);
    }
    for (my $i=0; $i<(scalar @keys1); $i++){
        if ($keys1[$i] ne $keys2[$i]){
            say "Two above hashes are not equal";
            return(0);
        }
    }
    my $iterator = each_array(@keys1, @keys2);
    while(my ($a,$b) = $iterator->()){
        if($hash1{$a} ne $hash2{$b}){
            say "Two above hashes are not equal";
            return(0);
        }
    }
    say "Two above hashes are equal";
    return(1);
}

sub display_hash {
    my ($hashref) = @_;
    my %hash = %$hashref;
    for my $key (keys(%hash)){
        say $key," ",$hash{$key};
    }
}

my @hashrefs = (\%hash1, \%hash2, \%hash3, \%hash4);
for my $hashref (@hashrefs){
    say "the first hash:";
    display_hash(\%hash1);
    say "the second hash:";
    display_hash($hashref);
    compare_hashes(\%hash1, $hashref);
    say "";
}
