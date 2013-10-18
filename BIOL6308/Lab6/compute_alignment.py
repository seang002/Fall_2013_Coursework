#!/usr/bin/env python

from Bio import SeqIO

def parseFastaFile(filename):
    with open(filename, "r") as fh:
        return [record.seq.upper() for record in SeqIO.parse(fh, "fasta")]

def computeAlignmentScore(query_sequence, sequences):
    for sequence in sequences:
        overall_length = len(sequence) if (len(query_sequence) < len(sequence)) else len(query_sequence)
        score = 0
        for (i,j) in zip(query_sequence,sequence):
            if str(i) == str(j):
                score += 1
        print '{0:s}'.format(query_sequence if (len(query_sequence) < len(sequence)) else sequence)
        print '{0:s}'.format(sequence if (len(query_sequence) < len(sequence)) else query_sequence)
        print 'The alignment score is: {0:d} / {1:d} = {2:0.2f}'.format(score, overall_length, score/float(overall_length))

def main():
    query_sequence = parseFastaFile('cystic_fibrosis.fasta')
    sequence_collection = parseFastaFile('sequence_collection.fasta')
    computeAlignmentScore(query_sequence[0],sequence_collection)
    
if __name__ == '__main__':
    main()