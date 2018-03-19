#!/usr/bin/env python3



blastout = open("../Results/ecoli_pgl.out", "r")
querylen = open("../Data/PGL_lengths.txt", "r")

len_seq = {}

for line in querylen:
	line = line.rstrip()
	linesplit = line.split("\t")
#	print(linesplit)
	len_seq[linesplit[0]] = linesplit[1]
#print(len_seq)

blast_filtered = []

for result in blastout:
	result = result.rstrip()
	split = result.split("\t")
	start = int(split[7])
	end = int(split[6])
	nm = split[0]
	len = int(len_seq[nm])
	coverage = abs((end - start)/len)
#	print(coverage)
#	print(split[10])
	if float(split[10]) < 0.1 and coverage > 0.65:
		blast_filtered.append(result)
for element in blast_filtered:
	print(element)
