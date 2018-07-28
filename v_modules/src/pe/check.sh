#!/bin/bash

res=0
for i in `seq 1 7 `;
do
	res=$(($res + $i*$i))
done
res=$(($res*(1024/8)))
echo "$res"

bit=0
while [ $res -gt 0 ]
do
	bit=$(($bit+1))	
	res=$(($res/2))
done
echo $bit
