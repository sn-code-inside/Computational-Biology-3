#!/bin/bash
# save as tree.sed
# requires path as command line parameter
if [ $# -ne 1 ]; then
  echo "Provide one directory name next time!"
  echo
else
  find $1 -print 2>/dev/null |
  sed -e 's/[^\/]*\//|--- /g' -e 's/--- |/     |/g'
fi