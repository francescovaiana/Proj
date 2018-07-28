#!/bin/bash

###########################################
### ONES COUNTER GENERIC INSTATIANTION 	###
### INPUT: LOG_BIT_WIDTH		###
### OUTPUT: CONNECTION.V FILE WITH 	###
###	WIRES AND ADDER INSTANTIATION	###
###########################################

log_n=$(($1))
n_bit=$((2**(log_n)))

for i in `seq 0 $log_n`;
do
#	echo $n_bit
	n_j=$(((${n_bit}/2**(${i}))-1))
	echo -n "wire [$i:0] "
	for j in `seq 0 $n_j`;
	do
		echo -n "net${i}_${j},"
	done
	echo
done > tmp
sed -i "s/,$/;/g" tmp
echo >> tmp

for i in `seq 0 $((${n_bit}-1))`;
do
	echo "assign net0_${i} = seq_in[${i}];" 
done >> tmp
echo >> tmp

for i in `seq 0 $((${log_n}-1))`;
do
	bit_width=$((i+1))
	j_index=$((2**(${log_n}-${i}-1)))
	for j in `seq 0 $((${j_index}-1))`;
	do
		even_index=$(($j*2))
		odd_index=$(($j*2+1))
		echo "rca #("
		echo -e "\t.bit_width($bit_width))"
		echo -e "adder_${i}_${j}("
		echo -e "\t.a(net${i}_${even_index}),"
		echo -e "\t.b(net${i}_${odd_index}),"
		echo -e "\t.carry_in(zero)",
		#downhere bit_width stands for i+1
		echo -e "\t.s(net${bit_width}_${j}[${i}:0]),"
		echo -e "\t.carry_out(net${bit_width}_${j}[${bit_width}])"
		echo ");"
	done
	echo
done >> tmp
