#!/bin/bash/

sed -i -f format.sed input_temp
sed -i -f format.sed bias_temp
sed -i -f format.sed weigth_temp
sed -i -f format.sed output_temp

rm new_alex_*
mv output_temp binary_out.txt
mv weigth_temp binary_weigth.txt
mv bias_temp binary_bias.txt
mv input_temp binary_in.txt
