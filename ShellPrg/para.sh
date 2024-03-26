#!/bin/bash
# save as para.sh
# prints command line parameters
while [ -n "$1" ]; do
  echo "\$#=$# - \$0= $0 - \$1=$1"
  shift
done