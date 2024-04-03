# save as for.awk
# demonstrates the for command
# calculates quadratic numbers
BEGIN{ORS=" "
for (i=1; i<=10; i++){
  print i**2}
print "\n"}