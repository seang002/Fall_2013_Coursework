#!/usr/bin/env perl
use warnings;
use strict;
use POSIX;

################################################################################
# BIOL6308 - Bioinformatics Methods I
################################################################################
# Author: Dan Shea
# Date: 2013-09-18
# Description:
# Write a program (name the program isPalindrome.pl) which takes a string (you
# can hardcode this variable $string) and will test to see if it is palindromic
# (reads the same when written backwards). The test should be case insensitive.
#
# Here is a good test string:
#
# my $string = "Able was I ere I saw ELBA";
#
# Next add to this program (isPalindrome.pl) to test for a palindrome in a DNA
# sequence, which is slightly different.
#
# From Wikipedia
#
# "The meaning of palindrome sequence in the context of genetics is slightly
# different from the definition used for words and sentences. Since a double
# helix is formed by two paired strands of nucleotides that run in opposite
# directions in the 5'-to-3' sense, and the nucleotides always pair in the same
# way (Adenine (A) with Thymine (T) for DNA, with Uracil (U) for RNA;
# Cytosine (C) with Guanine (G)), a (single-stranded) nucleotide sequence is
# said to be a palindrome if it is equal to its reverse complement. For example,
# the DNA sequence ACCTAGGT is palindromic because its nucleotide-by-nucleotide
# complement is TGGATCCA, and reversing the order of the nucleotides in the
# complement gives the original sequence."
#
# Use this for the testing:
#
# my $dnaString = "ACCTAGGT";
#
################################################################################

print "Enter the string to be tested:";
my $input_string = <STDIN>;
chomp $input_string;

# We will first test the string's length to determine if it is of even or odd length.
my $length = split(//, $input_string);

# Let's throw it into an array for processing later as well
my @string_array = split(//, $input_string);

# If the string evenly divides by 2 it is even, else it is odd, let the null string
# of length 0 be considered even in this case.
my $even_or_odd = $length % 2;

sub is_Palindrome{
    # if the string is even, we split it into two equal portions and compare the
    # first half with the reversed half.
    if ($even_or_odd == 0) {
        my @left = @string_array[0..($length/2)-1];
        my @right = @string_array[$length/2..$length-1];
        my @right_reversed = reverse(@right);
        # compare if the two strings are equal to one another, if they are you have a palindrome
        my $left_string = join("", @left);
        my $right_string = join("", @right_reversed);
        if ($left_string =~ /$right_string/i) {
            print "The string $input_string is a plaindrome.\n";
        }
        else {
            print "The string $input_string is NOT a palindrome.\n";
        }
    }
    
    # if the string is odd we split the string into three, a left side and a right
    # side, and compare the left with the reversed right, the pivot will always match itself
    else {
        my @left = @string_array[0..floor($length/2)-1];
        my $pivot = $string_array[floor($length/2)];
        my @right = @string_array[floor($length/2)+1..$length-1];
        my @right_reversed = reverse(@right);
        # compare if the two strings are equal to one another, if they are you have a palindrome
        my $left_string = join("", @left);
        my $right_string = join("", @right_reversed);
        if ($left_string =~ /$right_string/i) {
            print "The string $input_string is a palindrome.\n";
        }
        else {
            print "The string $input_string is NOT a palindrome.\n";
        }    
    }
}

sub is_DNA_Palindrome{
    # define the complements for each nucleotide in a hash, both lower case and uppper case
    my %complements = (A => 'T',
                       C => 'G',
                       T => 'A',
                       G => 'C',
                       a => 't',
                       c => 'g',
                       t => 'a',
                       g => 'c');
    my @complement = ();
    # first compute the complement of the sequence
    for (@string_array){
        # Lookup the complement and toss it into a complement array
        push(@complement,$complements{$_});
    }
    # is the reversed original string equal to the complements string?
    my @string_array_reversed = reverse(@string_array);
    my $string_array_reversed = join("", @string_array_reversed);
    my $complement_string = join("", @complement);
    if ($complement_string =~ /$string_array_reversed/i) {
        print "The string $input_string is a DNA palindrome.\n";
    }
    else {
        print "The string $input_string is NOT a DNA palindrome.\n";
    }
}

# If the input string only contains nucleotides, check it for both, otherwise just check to
# see if the string is a palindrome
if ($input_string =~ /^[actgACTG]+$/) {
    &is_DNA_Palindrome;
}
&is_Palindrome;
