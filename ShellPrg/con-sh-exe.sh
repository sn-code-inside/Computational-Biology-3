#!/bin/bash
# save as con-sh-exe.sh
# This script converts .sh files to executables
echo "Search for *.sh files"
find ~ -name "*.sh"
echo "Perform task"
find ~ -name "*.sh" -exec chmod u+x {} \;
echo "Ready:"
find ~ -name "*.sh" -exec ls -l {} \;

