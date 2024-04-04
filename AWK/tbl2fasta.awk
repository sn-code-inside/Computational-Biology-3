# Save as tbl2fasta.awk
# Usage: awk -f tbl2fasta.awk inputfile.tbl
BEGIN{FS="\t"}
{
i=1
print ">"$1
while (i<=length($2)){
  print substr($2,i,80)
  i=i+80
  }
}