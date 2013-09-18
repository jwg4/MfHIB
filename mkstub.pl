#!/usr/bin/perl

use strict;
use warnings;

die "First argument needed" unless defined($ARGV[0]);

my $name = $ARGV[0];

my $chaptername;
if (defined($ARGV[1])) { $chaptername = $ARGV[1]; }
else { $chaptername = $name; $chaptername =~ s/(\w)(\w*)/\U$1\L$2/; }

if ($name =~ m/[\/.]/) { die "no slashes or dots in name"; }

my $texname = "chapters/$name.tex";

if (-e $texname) { die "file exists"; }

open my $FILE, "> $texname";

print $FILE "\\chapter{$chaptername}\n";
print $FILE "\\label{$name}\n";
print $FILE "\\depends{}\n";
print $FILE "\n\n";

print $FILE "\\begin{itemize}\n";
print $FILE "\\item\n";
print $FILE "\n";
print $FILE "\\end{itemize}\n";

close $FILE;
