#!/bin/bash
# save as if-ls.sh
# tests if file is present in current dir
# needs 1 parameter
if ls $1 >/dev/null 2>&1; then
  echo "$1 exists"
else
  echo "$1 does not exist"
fi