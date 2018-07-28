#!/bin/bash

###########################################
###	Init rom.mem with progressive   ###
###	numbers. 			###
###	argv1 = output file;		###
###	argv2 = log2 number of rows 	###
###	argv3 = bit width		###
###	argv4 = left margin		###
###	argv5 = rigth margin		###
###	argv6 = sign [1]- [0]+		###
###########################################

out_file=$1
n_rows=$((2**$2-1))
bit_width=$3
zero=0
sign=$6
res_temp=0
ones=$((2**($3)-1))
for i in `seq $4 $5`;
do
	bin=$(echo "obase=2; $i" | bc)
	n_digits=${#bin}
	n_zero=$(($3-n_digits))
	if [[ $n_zero -gt 0 ]]; then
		zeros=$(yes 0 | head -n $n_zero | tr -d '\n')
		res_temp=$zeros$bin
	else
		res_temp=$bin
	fi
	if [[ $sign == 0 ]]; then
		res=$res_temp
	else
		temp=$(perl -e '$xored = (('"$i"') ^ ('"$ones"')) +1; print "$xored\n";')
		res=$(echo "obase=2; $temp" | bc)
	fi
	echo $res
done >> $1
