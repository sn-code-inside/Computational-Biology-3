BEGIN{
if(id2=="" || seq=="" || ref==""){
  print "  Run as:"
  print "  awk -f compare-cov2.awk -v seq=seqs.tab -v ref=ref.fasta -v id1=ID1 -v id2=ID2"
  print "  where seqs.tab is the sequence file in tab format and"
  print "  ref.tab is the reference genome in tab format."
  print "  If -v id1=... is omitted, the reference genome ID NC_045512 will be used." 
  exit}

if(id1==""){id1="NC_045512"}

while(getline < ref > 0){
    num=gensub(/\..*/,"","g",$1); # remove accession version (.2)
    id[num]=$1; place[num]="Wuhan"; date[num]="12/2019"; sequence[num]=$NF
}

FS="\t"

while(getline < seq > 0){
    num=gensub(/\..*/,"","g",$1); # remove accession version (.2)
    id[num]=$1; place[num]=$2; date[num]=$3; sequence[num]=$4}

if(id[id1] != "" && id[id2] != ""){
  print "# Compared: "id[id1]" vs "id[id2]" | "date[id1]" vs "date[id2]" | "place[id1]" vs "place[id2]
  }
  else{print "ID not found!"; exit}

spike="MFVFLVLLPLVSSQCVNLTTRTQLPPAYTNSFTRGVYYPDKVFRSSVLHSTQDLFLPFFSNVTWFHAIHVSGTNGTKRFDNPVLPFNDGVYFASTEKSNIIRGWIFGTTLDSKTQSLLIVNNATNVVIKVCEFQFCNDPFLGVYYHKNNKSWMESEFRVYSSANNCTFEYVSQPFLMDLEGKQGNFKNLREFVFKNIDGYFKIYSKHTPINLVRDLPQGFSALEPLVDLPIGINITRFQTLLALHRSYLTPGDSSSGWTAGAAAYYVGYLQPRTFLLKYNENGTITDAVDCALDPLSETKCTLKSFTVEKGIYQTSNFRVQPTESIVRFPNITNLCPFGEVFNATRFASVYAWNRKRISNCVADYSVLYNSASFSTFKCYGVSPTKLNDLCFTNVYADSFVIRGDEVRQIAPGQTGKIADYNYKLPDDFTGCVIAWNSNNLDSKVGGNYNYLYRLFRKSNLKPFERDISTEIYQAGSTPCNGVEGFNCYFPLQSYGFQPTNGVGYQPYRVVVLSFELLHAPATVCGPKKSTNLVKNKCVNFNFNGLTGTGVLTESNKKFLPFQQFGRDIADTTDAVRDPQTLEILDITPCSFGGVSVITPGTNTSNQVAVLYQDVNCTEVPVAIHADQLTPTWRVYSTGSNVFQTRAGCLIGAEHVNNSYECDIPIGAGICASYQTQTNSPRRARSVASQSIIAYTMSLGAENSVAYSNNSIAIPTNFTISVTTEILPVSMTKTSVDCTMYICGDSTECSNLLLQYGSFCTQLNRALTGIAVEQDKNTQEVFAQVKQIYKTPPIKDFGGFNFSQILPDPSKPSKRSFIEDLLFNKVTLADAGFIKQYGDCLGDIAARDLICAQKFNGLTVLPPLLTDEMIAQYTSALLAGTITSGWTFGAGAALQIPFAMQMAYRFNGIGVTQNVLYENQKLIANQFNSAIGKIQDSLSSTASALGKLQDVVNQNAQALNTLVKQLSSNFGAISSVLNDILSRLDKVEAEVQIDRLITGRLQSLQTYVTQQLIRAAEIRASANLAATKMSECVLGQSKRVDFCGKGYHLMSFPQSAPHGVVFLHVTYVPAQEKNFTTAPAICHDGKAHFPREGVFVSNGTHWFVTQRNFYEPQIITTDNTFVSGNCDVVIGIVNNTVYDPLQPELDSFKEELDKYFKNHTSPDVDLGDISGINASVVNIQKEIDRLNEVAKNLNESLIDLQELGKYEQYIKWPWYIWLGFIAGLIAIVMVTIMLCCMTSCCSCLKGCCSCGSCCKFDEDDSEPVLKGVKLHYT"

split(spike,spikearray,"")

split(sequence[id1],seq1,""); split(sequence[id2],seq2,"")

for(i=1; i<=length(sequence[id1]); i++){
  if(seq1[i] == "N" || seq2[i] == "N"){n++}
  if(seq1[i] != seq2[i] && seq1[i] != "N" && seq2[i] != "N"){
	if(i >=21563 && i<= 25383){name="SPIKE NT:"i-21563+1" AA:"1+int((i-21563+1)/3)" -> "spikearray[1+int((i-21563+1)/3)]}
	if(i >=22517 && i<= 23183){name=name" RBDomain"}
	if(i >=22871 && i<= 23084){name=name" RBMotif"}
	print id[id2]" "i": "seq1[i]">"seq2[i]" "name; 
	name=""
	ex++}
  }
if(n==""){n=0}; if(ex==""){ex=0}
print "# of N's: "n" of "length(sequence[id1])
print "# of exchanges: "ex" of "length(sequence[id1])
}
