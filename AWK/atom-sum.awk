# save as atom-sum.awk
# uses the file structure.pdb
# sums up the values in the ATOM line
/^ATOM/ {
for (i=1; i<=NF; i++){
  if ($i ~ /[0-9].[0-9]/){
    sum+=$i
  }
}
print "Line "NR, "  Sum= "sum
}