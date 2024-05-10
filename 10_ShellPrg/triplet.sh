#!/bin/bash
# save as triplet.sh
# splits a sequence into triplets
x=0
while [ -n "${1:$x:3}" ]; do
  seq=$seq${1:$x:3}" "
  x=$(expr $x + 3)
done
echo "$seq"