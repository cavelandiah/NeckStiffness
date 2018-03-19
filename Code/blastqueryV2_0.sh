#!/bin/sh

## Diciembre 29 de 2016 ## Cristian Velandia
## Ejecutar diferentes estrategias de blast

source "/scr/hercules1san/clara_apuertag/Proyecto_Tunicados/Code/ncRNAs/timer.sh"
begin_time

#Genomas
source "/scr/hercules1san/clara_apuertag/Proyecto_Tunicados/Code/ncRNAs/genomes_paths.cfg"
#Estrategias
source "/scr/hercules1san/clara_apuertag/Proyecto_Tunicados/Code/ncRNAs/Blast/strategies_blast.cfg"

STR=$( eval echo \$STR$1 )
GENOME=$( eval echo \$$2 )
GENOMEM=$( echo "$GENOME" | sed -nE 's/(.*)(.fa|.fasta)/\1/p')
while read file
do
	while read query_specie
	do
	#bfl1_misc_RNA.bfl.out 
	FILEM=$( echo "$file" | sed -nE 's/(.*)(.new.fasta)/\1/p')
	QUERYM=$( echo "$query_specie" | sed -nE 's/.*\/(Sequences_.*)\//\1/p')

	if [ "$QUERYM" == "Sequences_A_carolinensis" ];
	then
		SPE=$( echo "anca")
	elif [ "$QUERYM" == "Sequences_B_floridae" ]; then
		SPE=$( echo "brfl")
	elif [ "$QUERYM" == "Sequences_C_elegans" ]; then
                SPE=$( echo "cael")
	elif [ "$QUERYM" == "Sequences_C_intestinalis" ]; then
                SPE=$( echo "ciin")
	elif [ "$QUERYM" == "Sequences_C_savignyi" ]; then
                SPE=$( echo "cisa")
	elif [ "$QUERYM" == "Sequences_D_rerio" ]; then
                SPE=$( echo "dare")
	elif [ "$QUERYM" == "Sequences_O_dioica" ]; then
                SPE=$( echo "oidi")
	elif [ "$QUERYM" == "Sequences_L_chalumnae" ]; then
                SPE=$( echo "lach")
	elif [ "$QUERYM" == "Sequences_P_marinus" ]; then
                SPE=$( echo "pema")
	elif [ "$QUERYM" == "Sequences_S_cerevisiae" ]; then
                SPE=$( echo "sace")
	elif [ "$QUERYM" == "Sequences_X_tropicalis" ]; then
                SPE=$( echo "xetr")	
	else
		echo "Specie not included!"
	fi	
#	echo "Working on $query_specie$file AND $GENOMEM AND STR$1 $QUERYM $SPE"
	SUBJECT=$( echo "$2" | sed 's/\([A-Z]\)/\L\1/g')
	OUT=$( echo "$SUBJECT$1_$FILEM.$SPE.out")		
	echo "Working on $query_specie$file AND $GENOMEM AND STR$1  $SPE/$2/Str$1/$OUT"
		blastall -p blastn -d $GENOMEM -i $query_specie$file $STR /scr/hercules1san/clara_apuertag/Proyecto_Tunicados/Results/ncRNAs/Blast/$2/Str$1/$OUT 	
	done < /scr/hercules1san/clara_apuertag/Proyecto_Tunicados/Code/ncRNAs/Blast/query_paths.list
	sub_end_time
        print_sub_time $file
done < /scr/hercules1san/clara_apuertag/Proyecto_Tunicados/Code/ncRNAs/Blast/ncRNA.list
end_time        
print_total_time
