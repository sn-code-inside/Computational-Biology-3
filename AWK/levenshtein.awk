# save as levenshtein.awk
# calculates Levenshtein distance between two text strings
# usage: awk -f levenshtein.awk STRING1 STRING2

BEGIN{
one = ARGV[1]; two = ARGV[2]
print one" <==> "two;
print "Levenshtein Distance: "distance(one, two)
}
function distance (a, b){
  la = length(a); lb = length(b)
  if(la==0){return lb}; if(lb==0){return la}
  for(row=1;row<=la;row++){m[row,0] = row}
  for(col=1;col<=lb;col++){m[0,col] = col}
  for(row=1;row<=la;row++){#print
    ai = substr(a,row,1)
    for(col=1;col<=lb;col++){
      bi = substr(b,col,1)
      if(ai == bi){cost = 0}
      else{cost = 1}
      m[row,col]=min(m[row-1,col]+1,m[row,col-1]+1,m[row-1,col-1]+cost)#; printf ("%3s", m[row,col])
      }
    }#print
  return m[la,lb]
}
function min (a, b, c){
  result = a; if(b < result){result = b}; if(c < result){result = c}
  return result
}