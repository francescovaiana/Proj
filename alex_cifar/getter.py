string = []
f = open("new_alex_inputs_fc.txt", "r")
for line in f:
	string.append(line)
	if ("]" in line):
		print(string, file=open("input_temp", "a"))
		string = []

string = []
f = open("new_alex_output_bias.txt", "r")
for line in f:
	string.append(line)
	if ("]" in line):
		print(string, file=open("bias_temp", "a"))
		string = []

string = []
f = open("new_alex_output_fc.txt", "r")
for line in f:
	string.append(line)
	if ("]" in line):
		print(string, file=open("output_temp", "a"))
		string = []

string = []
f = open("new_alex_output_weigths.txt", "r")
for line in f:
	string.append(line)
	if ("]" in line):
		print(string, file=open("weigth_temp", "a"))
		string = []


#print ("size is", string.size)
#print ("\nindex is", i)
