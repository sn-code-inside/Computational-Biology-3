# save as distance.awk
# searches close cysteine sulfur atoms in a structure
# requires a structure file (*.pdb)
# usage: awk -f distance.awk structure.pdb

BEGIN{print "Cysteines in the Structure..."; ORS=""}

$1=="ATOM" && $4=="CYS" && $3=="SG" {
print $4$6", "
cys_x[$6]=$7; cys_y[$6]=$8; cys_z[$6]=$9
}

END{ ORS="\n"
for (key1 in cys_x) {
  for (key2 in cys_x) { 
      dx=cys_x[key1]-cys_x[key2]
      dy=cys_y[key1]-cys_y[key2]
      dz=cys_z[key1]-cys_z[key2]
      distance=sqrt(dx^2+dy^2+dz^2)
      if (distance < 3 && distance != 0) {
        i++
        candidate[i]=key1"-"key2": "distance
      }
  }
}
print "\nCandidates ..."
for (keys in candidate) {print candidate[keys]}
}