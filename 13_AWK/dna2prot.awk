# save as dna2prot.awk
# translates DNA to protein
BEGIN{c["atg"]="MET"; c["ggc"]="THY"; c["ctg"]="CYS"}
{i=1; p=""}
{do {
  s=substr($0, i, 3)
  printf ("%s ", s)
  {if (c[s]==""){p=p"    "} else {p=p c[s]" "}}
  i=i+3}
while (s!="")}
{printf("\n%s\n", p)}