#!/usr/bin/env python

def parseFile(filename):
    '''parseFile(filename) - parse the file and return a list of dicts'''
    with open(filename, 'r') as fh:
        return([dict(zip(['from','to','species','gene_name'],line.split('\t'))) for line in fh])

def filterSpecies(records, value):
    '''filterSpecies(value) - filter records for species that match value'''
    return([record for record in records if record['species'] == value])

def findCorrespondents(A, B):
    '''findCorrespondents(A, B) - determine the corresponding uniprot accessions and return a list of them'''
    return([(a['to'],a['from'],b['from']) for a in A for b in B if a['to'] == b['to']])

def main():
    affymetrixfile = 'affymetrixIDs_MouseToUniProtAccessions.txt'
    geneIDfile = 'geneIDs3_MouseToUniProtAccessions.txt'
    # Parse and filter affymetrix records
    affymetrix_records = parseFile(affymetrixfile)
    affymetrix_records = filterSpecies(affymetrix_records, 'Mus musculus')
    # Parse and filter geneID records
    geneID_records = parseFile(geneIDfile)
    geneID_records = filterSpecies(geneID_records, 'Mus musculus')
    # Find all corresponding Uniprot Accession IDs
    correspondents = findCorrespondents(affymetrix_records, geneID_records)
    # print the results
    for (i, j, k) in correspondents:
        print 'Uniprot: {0:s}, Affymetrix: {1:s}, GeneID: {2:s}'.format(i, j, k)

if __name__ == '__main__':
    main()