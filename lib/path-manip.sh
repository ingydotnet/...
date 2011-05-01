# This bash library contains useful functions for viewing and manipulating
# your PATH environment variable, and other similar environment variables.

# List each directory in your PATH, one per line
path-list() {
    local path
    local d
    if [ "$#" -eq 1 ]; then eval path=\$$1; else path="$PATH"; fi
    for d in `echo $path | sed -e 's/:/ /g'`; do
        echo "$d"
    done
}

# Remove a directory from your PATH
path-remove() {
    local path
    local d
    local p=""
    if [ "$#" -eq 2 ]; then eval path=\$$2; else path="$PATH"; fi
    for d in `echo $path | sed -e 's/:/ /g'`; do
        if [ "$d" != "$1" ]; then
            if [ "$p" = "" ]; then
                p="$d"
            else
                p="$p:$d"
            fi
        fi
    done
    if [ "$#" -eq 2 ]; then eval $2=\$p; else PATH="$p"; fi
}

# Add a directory to the start of your PATH while removing old references.
path-prepend() {
    local path
    path-remove $*
    if [ "$#" -eq 2 ]; then eval path=\$$2; else path="$PATH"; fi
    path="$1:$path"
    if [ "$#" -eq 2 ]; then eval "$2=$path"; else PATH="$path"; fi
}

# Add a directory to the end of your PATH while removing old references.
path-append() {
    local path
    path-remove $*
    if [ "$#" -eq 2 ]; then eval path=\$$2; else path="$PATH"; fi
    path="$path:$1"
    if [ "$#" -eq 2 ]; then eval $2=\$path; else PATH="$path"; fi
}

# Copyright © 2011 Ingy dot Net <ingy@ingy.net>
# 
# This library is free software, distributed under the ISC License.
# See the LICENSE file distributed with this library.
