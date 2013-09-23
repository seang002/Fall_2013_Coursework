#!/usr/bin/perl
use warnings;
use strict;

#This is a quick run through of various perl-isms to refresh my memory.

# Scalars
my $variable;
$variable = 'foo';
print "\$variable = $variable\n";

# Arrays
my @array;
@array = qw(one two three four five six seven eight nine ten);

# scalar context - return the number of items in the list and place it into $scalar_context
my $scalar_context = @array;
print "number of elements in \@array: $scalar_context\n";

# list context - return the first element of the list and place it into $list_context
my ($list_context) = @array;
print "\$list_context holds the value: $list_context\n";

print "Remember, arrays are zero indexed! Therefore...\n";
print "\$array[5] = $array[5]\n";

print "push \@array, \"eleven\"\n"; 
push @array, "eleven";
print "\@array is now @array\n";

print "pop \@array\n"; 
pop @array;
print "\@array is now @array\n";

print "unshift \@array, \"zero\"\n";
unshift @array, "zero";
print "\@array is now @array\n";

print "shift \@array\n"; 
shift @array;
print "\@array is now @array\n";

# Hashes
my %hash;
%hash = ( 'banana' => 'ばなな',
          'apple'  => 'りんご',
          'man' => '男',
          'woman' => '女',
);

# returns a list of all the keys
my @keys = keys %hash;
print "\@keys = @keys\n";

# iterate over the list and print each key out
foreach my $key (keys %hash) {
    print "$key\n";
}

# since foreach is a synonym for the for keyword we can also do this
for my $key (keys %hash) {
    print "$key = $hash{$key}\n";
}

# returns the number of keys in the list
my $num_keys = keys %hash;
print "number of keys in \%hash: $num_keys\n";