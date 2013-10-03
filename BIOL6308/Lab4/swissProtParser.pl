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
# The program (name the program swissProtParser.pl) takes in a file in SwissProt
# format, which is a file format quite common in bioinformatics (it comes from
# the Swiss Institute of Bioinformatics). You were given a file which is in
# SwissProt format, the only problem is your program analyzes protein sequences
# in Fasta format, which looks like this:
#
# >gi|5524211|gb|AAD44166.1| cytochrome b [Elephas maximus maximus]
# LCLYTHIGRNIYYGSYLYSETWNTGIMLLLITMATAFMGYVLPWGQMSFWGATVITNLFSAIPYIGTNLV
# EWIWGGFSVDKATLNRFFAFHFILPFTMVALAGVHLTFLHETGSNNPLGLTSDSDKIPFHPYYTIKDFLG
# LLILILLLLLLALLSPDMLGDPDNHMPADPLNTPLHIKPEWYFLFAYAILRSVPNKLGGVLALFLSIVIL
# GLMPFLHTSKHRSMMLRPLSQALFWTLTMDLLTLTWIGSQPVEYPYTIIGQMASILYFSIILAFLPIAGX
# IENY
#
# The header line can be anything you would like to have define your sequence.
# Here is what I would like to see after you have parsed the file:
# The things to parse are:
#
# The AC "line" which stores the Accession id
# The OS "line" which stores the organism
# The OX "line" which stores the NCBI taxid
# The GN "line" which stores various types of gene names for the protein
# The SQ "lines" which store the sequence data
#
# Focus on writing subroutines for parsing this data, just like I did in the
# GenBank parsing lecture: After parsing produce the following format:
#
# >P00450 | Homo sapiens (Human) | NCBI_TaxID=9606 | 1065 AA. | CP.
# MKILILGIFLFLCSTPAWAKEKHYYIGIIETTWDYASDHGEKKLISVDTEHSNIYLQNGP
# DRIGRLYKKALYLQYTDETFRTTIEKPVWLGFLGPIIKAETGDKVYVHLKNLASRPYTFH
# SHGITYYKEHEGAIYPDNTTDFQRADDKVYPGEQYTYMLLATEEQSPGEGDGNCVTRIYH
# SHIDAPKDIASGLIGPLIICKKDSLDKEKEKHIDREFVVMFSVVDENFSWYLEDNIKTYC
# SEPEKVDKDNEDFQESNRMYSVNGYTFGSLPGLSMCAEDRVKWYLFGMGNEVDVHAAFFH
# GQALTNKNYRIDTINLFPATLFDAYMVAQNPGEWMLSCQNLNHLKAGLQAFFQVQECNKS
# SSKDNIRGKHVRHYYIAAEEIIWNYAPSGIDIFTKENLTAPGSDSAVFFEQGTTRIGGSY
# KKLVYREYTDASFTNRKERGPEEEHLGILGPVIWAEVGDTIRVTFHNKGAYPLSIEPIGV
# RFNKNNEGTYYSPNYNPQSRSVPPSASHVAPTETFTYEWTVPKEVGPTNADPVCLAKMYY
# SAVDPTKDIFTGLIGPMKICKKGSLHANGRQKDVDKEFYLFPTVFDENESLLLEDNIRMF
# TTAPDQVDKEDEDFQESNKMHSMNGFMYGNQPGLTMCKGDSVVWYLFSAGNEADVHGIYF
# SGNTYLWRGERRDTANLFPQTSLTLHMWPDTEGTFNVECLTTDHYTGGMKQKYTVNQCRR
# QSEDSTFYLGERTYYIAAVEVEWDYSPQREWEKELHHLQEQNVSNAFLDKGEFYIGSKYK
# KVVYRQYTDSTFRVPVERKAEEEHLGILGPQLHADVGDKVKIIFKNMATRPYSIHAHGVQ
# TESSTVTPTLPGETLTYVWKIPERSGAGTEDSACIPWAYYSTVDQVKDLYSGLIGPLIVC
# RRPYLKVFNPRRKLEFALLFLVFDENESWYLDDNIKTYSDHPEKVNKDDEEFIESNKMHA
# INGRMFGNLQGLTMHVGDEVNWYLMGMGNEIDLHTVHFHGHSFQYKHRGVYSSDVFDIFP
# GTYQTLEMFPRTPGIWLLHCHVTDHIHAGMETTYTVLQNEDTKSG
#
################################################################################

sub usage {
    say "Usage: $0 inputfile";
    say "File should be in SwissProt format.";
    exit(1);
}

sub parse {
    my ($type, $input) = @_;

    my %patterns = (AC => '^AC\s+(\w+);',
                    OS => '^OS\s+(.*)$',
                    OX => '^OX\s+(.*);$',
                    GN => '^GN\s+(.*)$',
                    SQ => 'SQ\s+\w+\s+(\w+\s*\w+);.*;(.*)\/\/',
                    );

    if ($type eq "SQ") {
        if (my ($sqval1, $sqval2) = ($input =~ /$patterns{$type}/s)) {
            chomp($sqval1);
            chomp($sqval2);
            return($sqval1,$sqval2);
        }
        else {
            return("UNDEFINED","UNDEFINED");
        }
    }
    else{
        if (my ($val) = ($input =~ /$patterns{$type}/m)) {
            chomp($val);
            return($val);
        }
        else {
            return("UNDEFINED");
        }
    }
}

sub display_output {
    my ($AC_val,$OS_val,$OX_val,$GN_val,$SQ_val1, $SQ_val2) = @_;
    my $sep = " | ";
    say ">",$AC_val,$sep,$OS_val,$sep,$OX_val,$sep,$SQ_val1,$sep,$GN_val;
    # strip out preceeding newline
    $SQ_val2 =~ s/\n//;
    # strip out whitespace, but not newlines
    $SQ_val2 =~ s/[ \t]+//g;
    say $SQ_val2;
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

# Open the file for reading and slurp the entire contents of the file into a scalar
my $input = do {
    local $/ = undef;
    open(my $INPUTFILE, "<", $filename) or die "Failed to open $filename.",$!;
    <$INPUTFILE>;
};

# Parse out values

my $AC_val = &parse("AC", $input);
my $OS_val = &parse("OS", $input);
my $OX_val = &parse("OX", $input);
my $GN_val = &parse("GN", $input);
my ($SQ_val1, $SQ_val2) = &parse("SQ", $input);

# display the output and exit cleanly
&display_output($AC_val, $OS_val, $OX_val, $GN_val, $SQ_val1, $SQ_val2);
exit(0);