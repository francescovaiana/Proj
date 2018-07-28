#!/bin/bash

#################################################
###	Convert Fixed-Point to 8bit 2's       ###
###	complement binary numbers (trunc)     ###
#################################################
n=0
temp=0
zero=0
ones=255
resolution=$(echo "print (1/128)"  | python)
###get first line only
	line=$(head -n 1 binary_weigth.txt)
###
line=$(echo $line | sed 's/,/ /g')

for i in $line
do
	if [ 1 -eq $(echo "$i<$resolution" | bc -l) ]; then 
		if [ 1 -eq $(echo "a=$i;a*=-1;a<$resolution" | bc -l) ]; then 
			i=0
			n=$((n+1))
		fi
	fi 
	temp=$(expr $i*128 | bc)
	int_temp=${temp%.*}
	res=$(echo "obase=2;$int_temp" | bc)
	n_digits=${#res}
	if [[ $res == *[-]* ]]; then
		n_digits=$((n_digits-1))
		res_temp=$(echo $res | cut -d "-" -f 2)
		n_zero=$((7-n_digits))
		zeros=0
		if [[ $n_zero -gt 0 ]]; then 
			zeros=$(yes 0 | head -n $n_zero | tr -d '\n')
		fi
		sign="-"
		x=$(echo $zero$zeros$res_temp)
		x_dec=$(echo "$((2#$x))")
		temp=$(perl -e '$xored = (('"$x_dec"') ^ ('"$ones"')) +1; print "$xored\n";')
		res_temp=$(echo "obase=2;$temp" | bc)
		echo -e "$res_temp" >> dump
		fin_res=$res_temp
	else
		sign=""
		res_temp=$res
		n_zero=$((7-n_digits))
		zeros=$(yes 0 | head -n $n_zero | tr -d '\n')
		echo -e "$zero$zeros$res_temp" >> dump
		fin_res=$(echo -e "$zero$zeros$res_temp")
	fi
	echo -e "$i\t\t$fin_res" >> dump_verbose
	#echo -e "$i\t\t$res\t\t$n_digits\t\t$zeros" >> temp_bin_out
	#echo -e "$sign$zero.$zeros$res_temp" >> fin_out
done
echo $n small numbers:
