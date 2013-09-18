#!/usr/bin/perl

use strict;
use warnings;

my $name = $ARGV[0];
$name =~ s/.tex$//;
$name =~ s/chapters\///;

while (<>) {
    if (m/\\depends\{([[:alnum:],]*)/)
    {
	my @a = split /,/, $1;
	
	my $first = 0;
	foreach my $s (@a) 
	{
	    print ", " unless !$first++;
	    print "[$s] -> [$name]";
	}
    }
}
print "\n";
