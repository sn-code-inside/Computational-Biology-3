#!/bin/bash
# save as test-par.sh
# tests, whether the number of parameters is correct
if test $# -ne 1; then
  echo "Program needs exactly 1 parameter"
  echo "bye bye"
  exit 1
fi