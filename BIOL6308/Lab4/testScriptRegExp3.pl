#!/usr/bin/env perl
use strict;
use warnings;
use diagnostics;
use feature qw(say);

my $genbankFileData;
my $accession;
my $gene;
my $dna;
my $proteinSeq;
my $oraganism;

sub getField{
	my ($field, $gbFile) = @_;
	my %patterns = (Accession => 'ACCESSION\s*(\w+)',
			Dna => 'ORIGIN\s*(.*)\/\/',
			Gene => 'gene="(.*?)"',
			Organism => 'organism="(.*?)"',
			Protein => 'translation="(.*?)"',
			);
	if ($gbFile =~ /$patterns{$field}/s) {
		if ($field eq "Dna") {
			my $seq = $1;
			$seq =~ s/[\s\d]//g;
			return uc($seq);
		}
		elsif ($field eq "Protein"){
			my $pro = $1;
			$pro =~ s/\s//g;
			return uc($pro);
		}
		else{
			return $1;
		}
	}
	else {
		return 'error';
	}
}

=cut
sub getAccession{
	my ($gbFile) = @_;
	if($gbFile=~/ACCESSION\s*(\w+)/){
		return $1;
	}else{
		return 'error';
	}
}
sub getDnaSequence{
	my ($gbFile) = @_;
	my $seq;
	if($gbFile=~/ORIGIN\s*(.*)\/\//s){
		$seq = $1;
	}
	else{
		return "error";
	}
	$seq =~ s/[\s\d]//g;
	return uc($seq);
}
sub getGene {
	my ($gbFile) = @_;
	if($gbFile=~/gene="(.*?)"/s){
		return $1;
	}
	else{
		return 'unknown';
	}
}
sub getOrganism {
	my ($gbFile) = @_;
	if($gbFile=~/organism="(.*?)"/s){
		return $1;
	}
	else{
		return 'unknown';
	}
}
sub getProteinSequence {
	my ($gbFile) = @_;
	my $pro;
	if($gbFile=~/translation="(.*?)"/s){
		$pro = $1;
	}
	else{
		return "unknown";
	}
	$pro =~ s/\s//g;
	return uc($pro);
}
=cut

sub printResults {
	my ($results, $type) = @_;
	say $type , ": ",  $results;
}

my $infile = 'sampleGenbank.gb';
unless (open(INFILE, "<", $infile) ){
	die "Can't open ", $infile , " for reading " , $!;
}
##get the entire file in the variable
$/ = ''; #what does this do?
$genbankFileData = <INFILE>;
$/ = "\n";  #always set this back once you are done
close INFILE;

=cut
$accession = getAccession($genbankFileData);
$gene = getGene($genbankFileData);
$dna = getDnaSequence($genbankFileData);
$proteinSeq = getProteinSequence($genbankFileData);
$oraganism = getOrganism($genbankFileData);
=cut

$accession = getField("Accession", $genbankFileData);
$gene = getField("Gene", $genbankFileData);
$dna = getField("Dna", $genbankFileData);
$proteinSeq = getField("Protein", $genbankFileData);
$oraganism = getField("Organism", $genbankFileData);

printResults($accession, "Accession");
printResults($gene, "Gene");
printResults($dna, "Dna");
printResults($proteinSeq, "Protein");
printResults($oraganism, "Organism");