#!/bin/bash
# save as archive-pwd-i.sh
# interactively archive files with tar
array=($(ls))
count=0
while test $count -lt ${#array[*]}; do
  echo "Archive ${array[count]}?"
  echo " press Enter = no"
  echo " press y & Enter = yes"
  read input
  case $input in
    y*) list="${list} ${array[count]}"
  esac
  count=$(expr $count + 1)
done
echo "Files: $list"
echo "have been added to the file archive"
tar -cf archive $list