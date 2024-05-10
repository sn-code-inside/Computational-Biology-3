#!/bin/bash
# save as case-cp.sh
# asks if files shall be backuped
# accepts file extension as $1
for i in $(ls  *$1); do
  echo "Backup $i?  yES/nO/qUIT"
  read answer
  case $answer in
    y*) echo "Backup $i"; cp $i $i.bak;;
    n*) echo "Skip $i";;
    q*) echo "Quited"; exit;;
     *) echo "Skip $i";;
  esac
done