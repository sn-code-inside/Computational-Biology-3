#!/bin/bash
# save as date-set.sh
# demonstrates debugging
date
lss
set -vx
now=$(date)
set +vx
echo "bye bye"