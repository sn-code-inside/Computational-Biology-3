# store as mutator.awk
# execute as: awk -f mutator.awk infile.tab
# infile.tab must be tab delimited: ID \t SEQ
BEGIN{srand(); FS="\t"; ORS=""}
{
split(tolower($2),dna,"")
for(i=1;i<=length(dna);i++){
  r=int((rand()*4)+1); f=int((rand()*10)+1)
  i=i+f
  if(r==1){r="A"}; if(r==2){r="T"}; if(r==3){r="G"}; if(r==4){r="C"}
  dna[i]=r
  }
print $1"\t"
for(i=1;i<=length(dna);i++) {print dna[i]}
print "\n"
}