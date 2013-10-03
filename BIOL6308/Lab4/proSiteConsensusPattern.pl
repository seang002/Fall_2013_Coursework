#!/usr/bin/env perl
use warnings;
use strict;
use diagnostics;
use feature qw(say);

################################################################################
# BIOL6308 - Bioinformatics Computational Methods I
# Author: Dan Shea
# Date: 2013-10-02
# Description:
#
# The Prosite database is a database of protein domains, families and
# functional sites. Go to the database and do a search for "antennapedia-type
# protein signature" (cut and paste this domain into the search in the upper
# left on the homepage of Prosite). Look for the Consensus pattern:
# (you will turn this into the regular expression in the program).
# Write a program (called proSiteConsensusPattern.pl) which will check the
# following protein for the existence of this homeobox dna binding motif,
# if it does contain the motif, print out the position where this motif
# begins
#
# Consensus pattern: 	[LIVMFE]-[FY]-P-W-M-[KRQTA]
#
# my $protein1 = 
# 'MTMSTNNCESMTSYFTNSYMGADMHHGHYPGNGVTDLDAQQMHHYSQNANHQGNMPYPRF
# PPYDRMPYYNGQGMDQQQQHQVYSRPDSPSSQVGGVMPQAQTNGQLGVPQQQQQQQQQPS
# QNQQQQQAQQAPQQLQQQLPQVTQQVTHPQQQQQQPVVYASCKLQAAVGGLGMVPEGGSP
# PLVDQMSGHHMNAQMTLPHHMGHPQAQLGYTDVGVPDVTEVHQNHHNMGMYQQQSGVPPV
# GAPPQGMMHQGQGPPQMHQGHPGQHTPPSQNPNSQSSGMPSPLYPWMRSQFGKCQGK';
################################################################################

# Define $protein1
my $protein1 = 
'MTMSTNNCESMTSYFTNSYMGADMHHGHYPGNGVTDLDAQQMHHYSQNANHQGNMPYPRF
PPYDRMPYYNGQGMDQQQQHQVYSRPDSPSSQVGGVMPQAQTNGQLGVPQQQQQQQQQPS
QNQQQQQAQQAPQQLQQQLPQVTQQVTHPQQQQQQPVVYASCKLQAAVGGLGMVPEGGSP
PLVDQMSGHHMNAQMTLPHHMGHPQAQLGYTDVGVPDVTEVHQNHHNMGMYQQQSGVPPV
GAPPQGMMHQGQGPPQMHQGHPGQHTPPSQNPNSQSSGMPSPLYPWMRSQFGKCQGK';

# Strip off the whitespace
$protein1 =~ s/\s//g;

my $motif = "([LIVMFE][FY]PWM[KRQTA])";

# Note: output range an be verified in cut
#zeon:Lab4(1138)$ cut -c283-288
# MTMSTNNCESMTSYFTNSYMGADMHHGHYPGNGVTDLDAQQMHHYSQNANHQGNMPYPRFPPYDRMPYYNGQGMDQQQQ
# HQVYSRPDSPSSQVGGVMPQAQTNGQLGVPQQQQQQQQQPSQNQQQQQAQQAPQQLQQQLPQVTQQVTHPQQQQQQPVV
# YASCKLQAAVGGLGMVPEGGSPPLVDQMSGHHMNAQMTLPHHMGHPQAQLGYTDVGVPDVTEVHQNHHNMGMYQQQSGV
# PPVGAPPQGMMHQGQGPPQMHQGHPGQHTPPSQNPNSQSSGMPSPLYPWMRSQFGKCQGK
# LYPWMR

say "For protein sequence: ",$protein1;
while($protein1 =~ m/$motif/g) {
    say $motif," motif found at positions (",pos($protein1)-length($1)+1,"-",pos($protein1),")";
    say $motif," motif value: ",$1;
}