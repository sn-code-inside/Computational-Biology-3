#!/bin/bash
# save as dna-test.sh
# test if file contains dna sequence
# file in $1
if test -z $(head -1 $1) && test -f $1; then
  echo "File $1 is empty"
  exit
fi
grep -sq '[^acgt]' $1
result=$?
if test $result -eq 0 ; then
  echo "File $1 does not contain pure DNA sequence"
elif test $result -eq 1; then
  echo "File $1 does contain pure DNA sequence"
elif [ $result -eq 2 ]; then
  echo "File $1 does not exist"
else
  echo "Some error occured!"
fi