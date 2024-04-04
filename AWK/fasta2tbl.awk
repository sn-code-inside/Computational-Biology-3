# Save as fasta2tbl.awk
# Usage: awk -f fasta2tbl.awk inputfile.fasta
BEGIN{ORS=""}
{
if (substr($0,1,1)==">"){
  if (NR==1){print substr($0,2,length($0)-1)"\t"}
  else{print "\n"substr($0,2,length($0)-1)"\t"}
  }
else{print $0}
}
END{print "\n"}