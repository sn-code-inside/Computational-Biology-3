echo -e "Size\tReads\tContigs"
for s in 550 700 850 1000 5000 10000; do
  for n in 1 6 12 24 48 72 96 120 240 500 750 1000; do
    mason_simulator --ir mtDNAneander.fasta --out sanger.fastq --fragment-mean-size $s -n $n --seq-technology sanger 2> /dev/null
    velveth Assembly 19 -long -fastq sanger.fastq > /dev/null
    velvetg Assembly > /dev/null
    CONTIGS=$(egrep -c ">" Assembly/contigs.fa)
    echo -e "$s\t$n\t$CONTIGS"
  done
done