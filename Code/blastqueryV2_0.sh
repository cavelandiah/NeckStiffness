#!/bin/bash

#Genomes
source "genomes.paths"

GENOME=$( eval echo \$$1 )
GENOMEM=$( echo "$GENOME" | sed -nE 's/(.*)(.fa|.fasta)/\1/p')

	echo "Working on $GENOMEM AND $1"
	SUBJECT="../Data/PGL_Genes.fasta"
	OUT="../Results/${1}_pgl.out"		
	blastall -p blastn -d $GENOMEM -i $SUBJECT -r 1 -q -1 -G 1 -E 2 -W 9 -F "m D" -U -m 8 -o $OUT 
