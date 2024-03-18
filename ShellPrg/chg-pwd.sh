#!/bin/bash
# save as chg-pwd.sh
# changes the environmental variable PWD
echo
echo "--------------------------------"
echo "PWD is currently set as $PWD"
echo
echo "Enter a new path and press ENTER"
echo "or enter nothing and press ENTER"
echo "to leave \$PWD unchanged"
read new
PWD=${new:-$PWD}
echo "PWD is now set to $PWD"
echo "--------------------------------"
echo -e "\a"