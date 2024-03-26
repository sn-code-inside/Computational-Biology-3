#!/bin/bash
# save as triplet-until.sh
# splits a sequence into triplets
x=0
until [ -z "${1:$x:3}" ]; do
  seq=$seq${1:$x:3}" "
  x=$(expr $x + 3)
done
echo "$seq"