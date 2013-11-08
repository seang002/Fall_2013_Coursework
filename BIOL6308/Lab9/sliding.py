#!/usr/bin/env python
'''
Name: Dan Shea
Date: 2013-11-08
Description: Compute the GC content of a sequence for a given window size and sequence
'''

import sys

def compute_GC(window_size, sequence):
    '''compute_GC(window_size, sequence): Compute the GC content of a sequence for a given window size and sequence'''
    # Convert sequence to upper case if lower case
    sequence.upper()
    # Calculate the GC content for various windows and return a list with the GC content of that window
    return([(i,(sequence[i:window_size+i].count('G') + sequence[i:window_size+i].count('C'))/float(window_size)) for i in xrange(0,len(sequence)-window_size+1)])

def main():
    if (len(sys.argv) != 3):
        usage()
    else:
        results = compute_GC(int(sys.argv[1]), sys.argv[2])
        for (i,j) in results:
            print '{0:d}\t{1:0.3f}'.format(i,j)
        sys.exit(0)

def usage():
    print 'Usage: {0:s} window_size sequence'.format(sys.argv[0])
    sys.exit(1)

if (__name__ == '__main__'):
    main()
else:
    usage()