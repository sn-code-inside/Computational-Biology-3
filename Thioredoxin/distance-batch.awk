# save as distance-batch.awk / searches close cysteines in a structure
# requires a structure files (*.pdb)
# usage: for i in DIR/*.pdb; do awk -f distance-batch.awk $i; done

$1=="ATOM" && $4=="CYS" && $3=="SG" {cys_x[$6]=$7; cys_y[$6]=$8; cys_z[$6]=$9}

END{i=0
for (key1 in cys_x) {
  for (key2 in cys_x) {
      dx=cys_x[key1]-cys_x[key2]; dy=cys_y[key1]-cys_y[key2]; dz=cys_z[key1]-cys_z[key2]
      distance=sqrt(dx^2+dy^2+dz^2)
      if (distance < 3 && distance != 0 && key1 < key2) {
        i++; candidate[i]=key1"-"key2": "distance
        hit[key1]=key1; hit[key2]=key2
      }
  }
}
if(i!=0){
  print FILENAME " is a candidate:"
  for (keys in candidate) {print candidate[keys]}
  ORS=""; file = FILENAME".script"
  print "load "FILENAME"\n" > file
  print "hide water; spacefill off\n" >> file
  print "select cys.sg; spacefill 200\nselect " >> file
  for(keys in hit){cystein=cystein"cys"keys".sg,"}
  print substr(cystein,1,length(cystein)-1) >> file
  print "\nspacefill 400\n" >> file
  print "select cys.sg\n" >> file
  print "color surfacedistance\n" >> file
  print "\n" >> file
  ORS="\n"
  }
}