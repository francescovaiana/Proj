#!/usr/bin/sed -f

s/'//g
s/[0-9] tensor//g
s/tensor//g
s/\[//g
s/(//g
s/)//g
s/\]//g
s/\\n//g
s/,,/,/g
s/  \+/ /g
s/^ //g
