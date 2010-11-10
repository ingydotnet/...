# This library contains useful functions for viewing and manipulating your
# PATH environment variable:

# List each directory in your PATH, one per line
path-list() {
    for d in `echo $PATH | sed -e 's/:/ /g'`; do
        echo $d
    done
}

# Remove a directory from your PATH
path-remove() {
    p=""
    for d in `echo $PATH | sed -e 's/:/ /g'`; do
        if [ $d != $1 ]; then
            if [ "$p" == "" ]; then
                p=$d
            else
                p="$p:$d";
            fi
        fi
    done
    PATH=$p
}

# Add a directory to the start of your PATH while removing old references.
path-prefix() {
    path-remove $1
    PATH="$1:$PATH"
}

# Add a directory to the end of your PATH while removing old references.
path-suffix() {
    path-remove $1
    PATH="$PATH:$1"
}

# Copyright 2010 Ingy dot Net
# 
# This is free software.
