#!/bin/bash

ll=0
ul=31
for i in `seq 0 32`;
do
  el=$(($ll+$i))
  ed=$(($ul+$i))
  if [[ $(($i%2)) == 0 ]]; then
	./init_rom.sh data.mem 5 8 $el $ed 0
  else 
	./init_rom.sh data.mem 5 8 $el $ed 1
  fi
  ./init_rom.sh weigth.mem 5 8 $el $ed 0

done
