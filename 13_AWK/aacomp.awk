# save as aacomp.awk
# calculates atomic composition of proteins
# usage: awk -f aacomp.awk protein.fasta

# ASSIGN DATA ARRAY
BEGIN {
 while (getline < "aa_atoms.txt" > 0) {
   # read number of S,N,O,C,H:
   data[$2]=$4" " $7" " $8" " $9" " $10" " $11
   }
}
# DECLARE FUNCTION to calculate fraction
  function f(a,b){
    if (a != 0 && b != 0){
      return a/b*100
    }
  }
# PROGRAM BODY
{
  if ($0 ~ /^>/) {
    print L, MW, S, N, O, C, H, "-",
          f(S,t), f(N,t), f(O,t), f(C,t), f(H,t)
    print $0
    t=0; L=0; MW=0; S=0; N=0; O=0; C=0; H=0
  }
  else {
    i=1; L=L+length($0); tL=tL+length($0)
       do {
        aa=substr($0,i,1)
          i++
          # begin main
          split(data[aa],comp) # comp[1]=mass...
          MW=MW+comp[1]; S=S+comp[2]; N=N+comp[3]
          O=O+comp[4]; C=C+comp[5]; H=H+comp[6]
          tMW=tMW+comp[1]; tS=tS+comp[2]; tN=tN+comp[3]
          tO=tO+comp[4]; tC=tC+comp[5]; tH=tH+comp[6]
          T=tS+tN+tO+tC+tH; t=S+N+O+C+H
          # end main
          }
       while (aa != "")
  }
}
END {
 print L, MW, S, N, O, C, H, "-",
       f(S,t), f(N,t), f(O,t), f(C,t), f(H,t)
 print "\n>SUMMARY"
 print tL, tMW, tS, tN, tO, tC, tH, "-",
       f(tS,T), f(tN,T), f(tO,T), f(tC,T), f(tH,T)
}