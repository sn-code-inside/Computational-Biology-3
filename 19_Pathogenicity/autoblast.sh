#!/bin/bash
# save as autoblast.sh
# loops through E-value
for i in 1 0.001 0.00001
do
echo "Working on h7vsk12-$i.txt"
blastp -db ecolik12 -query ec-h7.fasta -out h7vsk12-$i.txt -evalue $i
done
