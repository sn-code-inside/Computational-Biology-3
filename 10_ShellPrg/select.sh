#!/bin/bash
# save as select.sh
# demonstrates select
PS3="Select item: "
select name in Protein DNA RNA ; do
  echo "You selected $name"
  break
done
echo "bye bye"