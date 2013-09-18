#!/usr/bin/perl
use warnings;
use strict;

# Create an array of hashes
# First we create an empty list
my @AoH = ();
# Now we can create our hash references in a loop, populating the array AoH
# with hash references of initial default values
for (0..9) {
    print "Adding entry $_\n";
    $AoH[$_] = {"Name" => "Default",
                "Age"  => -1,
    };
}

# Lets examine what we have initialized
for (0..@AoH-1) {
    print "Entry $_:\n";
    print "Name: ",$AoH[$_]->{"Name"},"\n";
    print "Age: ",$AoH[$_]->{"Age"},"\n\n";
}