#!/bin/bash -x
# save as grep_file_seq.sh
# search for a pattern (par2) in *.(par1) files
# query home directory and all subdirectories
find $HOME -type f -name "*.$1" -exec grep "$2" {} \;