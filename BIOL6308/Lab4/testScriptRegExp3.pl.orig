#! /usr/bin/perl
use strict;
use warnings;
use feature qw(say);

my $genbankFileData;
my $accession;
my $gene;
my $dna;
my $proteinSeq;
my $oraganism;


my $infile = 'sampleGenbank.gb';
unless (open(INFILE, "<", $infile) ){
	die "Can't open ", $infile , " for reading " , $!;
}
##get the entire file in the variable
$/ = ''; #what does this do?
$genbankFileData = <INFILE>;
$/ = "\n";  #always set this back once you are done
close INFILE;

$accession = getAccession($genbankFileData);
$gene = getGene($genbankFileData);
$dna = getDnaSequence($genbankFileData);
$proteinSeq = getProteinSequence($genbankFileData);
$oraganism = getOrganism($genbankFileData);

printResults($accession, "Accession");
printResults($gene, "Gene");
printResults($dna, "Dna");
printResults($proteinSeq, "Protein");
printResults($oraganism, "Organism");

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
sub printResults {
	my ($results, $type) = @_;
	say $type , ": ",  $results;
}
