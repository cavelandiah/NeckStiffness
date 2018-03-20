#!/usr/bin/perl

#The usage is:
#./mapper.pl [fileIn] [abbreviation]

use warnings;
use strict;
use Bio::SeqIO;


my %NR;
my %NRori;
my $in = shift || die "Usage: ./mapper.pl [fileIn] [abbreviation]\nmissing fileIn...exiting\n";
my $short = shift || die "Usage: ./mapper.pl [fileIn] [abbreviation]\nmissing abbreviation...exiting\n";
my $file = Bio::SeqIO->new(-file => $in, -format => "fasta");
my $num = 1;

while (my $fasta = $file->next_seq) {
        my $def = $num;
            $NR{$def} = $fasta->seq;
                $NRori{$num} = $fasta->id ." " .$fasta->desc;;
                    $num++;
}
foreach my $defs(keys %NR) {
        print ">".$short.$defs."\n".$NR{$defs}."\n";
}

open(OUT, ">$in.map");
foreach my $defs(keys %NRori) {
        print OUT $short.$defs."\t".$NRori{$defs}."\n";
}
close(OUT);
