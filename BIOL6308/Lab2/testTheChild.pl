#!/usr/bin/env perl
use warnings;
use strict;

################################################################################
# BIOL6308 - Bioinformatics Methods I
################################################################################
# Author: Dan Shea
# Date: 2013-09-18
# Description:
# Write a program (name the program testTheChild.pl) which works out how old a
# child should be to know a certain word, you can hardcode the variable $word and
# $age in your script. The classification should be based on the length of the
# word, as follows:
#
# 5 years <= 3 letters
# 6 years <= 4 letters
# 8 years <= 6 letters
# 10 years <= 10 letters
# 12 years = any length
#
################################################################################

print "Mr. T says, \"Enter a word fool!\": ";
my $word = <STDIN>;
chomp $word;

# Did the user enter a word?
unless ($word =~ /^[a-zA-Z\-]+$/) {
    print "Mr. T says, \"Fool!  That ain't no word!\"\n";
    print "Exiting with a non-zero status fool!\n";
    exit(0);
}

# compute the length of the word by splitting it into individualk characters and
# passing the array in a scalar context, giving us the length
my $length = split(//, $word);

# Mr. T says the age subroutine
sub mr_t_says_the_age{
    my $mr_t_length = $_[0];
    my $mr_t_age = $_[1];
    print "Mr. T says, \"That child knows a word ",$mr_t_length," letters long.\"\n";
    print "Mr. T says, \"He's gotta be at least ",$mr_t_age," years old fool!\"\n";
    exit(0);
}

# Determine the age of the child
my $age;
if ($length > 10) {
    $age = 12;
}
elsif ($length > 6) {
    $age = 10;
}
elsif ($length > 4) {
    $age = 8;
}
elsif ($length > 3) {
    $age = 6;
}
else {
    $age =5;
}
&mr_t_says_the_age($length, $age);