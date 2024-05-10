# save as enzyme-class.awk
# assigns a class to an enzyme
# requires enzyme.txt and class.txt
BEGIN{FS=" = "
  while ((getline < "class.txt") > 0){
    class[$1]=$2}
FS=" "
}
{if (class[$1]==""){
  print $0 "\tClass"}
else{
  print $0 "\t" class[$1]}
}