#!/bin/bash
# save as text.sh
# printing text
cat <<%%
Here comes a lot of text.
My home directory is $HOME - cool.
Let us use some tabulators:
        tab1
        tab2
This looks like a nice list.
%%

cat <<\%%
Here comes more text, however, backslashed.
My home directory is $HOME - ui.
%%