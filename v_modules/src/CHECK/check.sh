#!/bin/bash

while read line
do
sign=${line:0:1}
num=${line:1}
x_dec=$(echo "$((2#$num))")
if [[ $sign == 1 ]]; then
	x_dec=$((x_dec-128))
fi
echo $x_dec >> tmp_check_data

done < data.mem

while read line
do
x_dec=$(echo "$((2#$line))")
echo $x_dec >> tmp_check_weigth

done < weigth.mem
