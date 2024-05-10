# save as sort-array-elements.awk
# sorts an array by value of
# array elements
/[0-9]/ {data[$1]=$2; j=1}
END{
j=1
for (i in data) {ind[j]=i; j++}
n=asort(ind)
for (i=1; i<=n; i++) {print ind[i], data[ind[i]]}
}