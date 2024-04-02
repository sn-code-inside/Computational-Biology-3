# save as if-else.awk
# demonstrates if-else structure
# use with enzyme.txt
{if ($2 < 2) {
  sum_b+=$2}
else {
  sum_s+=$2}
}
END{
print "Sum of numbers greater than or equal 2: "sum_b
print "sum of numbers smaller than 2         : "sum_s
}