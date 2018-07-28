#!/bin/python
import re
i = 0
with open('./report.txt') as f_in:
	with open('./pyout.txt','w') as f_out:
		#row = f.read()
		#row = f.readline()
		for row in f_in:		
			if (i == 2):
				period = row.rstrip()
				print('Period: {}ns'.format(period))
			i = i+1
			if ("DUT" in row):
				line_no_space = re.sub(r'\s+', " ", row)
				line_list = line_no_space.split()
				tc = line_list[1]
				sp = line_list[3]
				signal = re.sub(r'^.*/DUT/', "", line_list[0])
				sp_perc = float(sp)/float(period)
				f_out.write('{} {} {} {}\n'.format(signal,sp_perc,tc, period ))
	f_in.closed
f_out.closed

