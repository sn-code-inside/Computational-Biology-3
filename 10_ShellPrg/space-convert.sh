#!/bin/sh
# save as space-convert.sh
chgname() {
   echo "$1" | sed -e 's/[ ][ ]*/ /g' -e 's/[ ]/_/g'
}
find . -name '* *' | sort | while read name; do
   file=`basename "$name"`
   stem=`dirname "$name"`
   nfile=`chgname "$file"`
   nstem=`chgname "$stem"`
   if [ "$file" != "$nfile" ]
   then
      mv "$stem/$file" $nstem/$nfile
   fi
done