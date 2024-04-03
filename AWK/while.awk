# save as while.awk
# demonstrates the while command
# reverses the order of fields
BEGIN{ORS=""}
{i=NF}
{while (i>0) {
  print $i"\t"; i--}
}
{print "\n"}