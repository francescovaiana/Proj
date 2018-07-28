#!/bin/bash

acc=0
while read -r data && read -r weigth <&3; do
	acc=$((acc+ data*weigth))
	echo $((data*weigth)) >> tmp_check_tmp_res
	echo $acc >> tmp_check_result
done < tmp_check_data 3<tmp_check_weigth
