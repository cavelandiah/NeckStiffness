#!/bin/bash

source "./genomes.paths"

for specie in ecoli ngon nmem
do
GENOME=$( eval echo \$$specie )
# dmel-all-chromosome-r5.22.fasta
	NAME=$( basename $GENOME )
	DIR=$( dirname $GENOME )
	NAMEM=$(echo "$NAME" | sed -nE 's/(.*)(.fasta|.fa)/\1/p') #dmel-all-chromosome-r5.22
    	echo "$NAME AND $NAMEM AND $GENOME"
	makeblastdb -in $GENOME -dbtype nucl -out ${DIR}/$NAMEM
	#makeblastdb -in /scr/hercules1san/genomes/Tunicates/Didemnum_vexillum/NewAssembly2017/$NAME -dbtype nucl -out /scr/hercules1san/genomes/Tunicates/Didemnum_vexillum/NewAssembly2017/$NAMEM
done
#done < tunicate.species
