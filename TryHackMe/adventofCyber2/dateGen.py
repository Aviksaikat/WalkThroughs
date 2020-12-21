#/usr/bin/python3

#date format YYYYMMDD
def dateGen(m1=1,m2=13,d1=1,d2=32):
	l = []
	for i in range(m1,m2):
		for j in range(d1,d2):
			if(i<=9 and j<=9):
				s = (f"20200{i}0{j}")
				l.append(s)
			elif(i<=9):
				s = (f"20200{i}{j}")
				l.append(s)
			elif(j<=9):
				s = (f"2020{i}0{j}")
				l.append(s)
			else:
				s = (f"2020{i}{j}")  
				l.append(s)
	#print(l)
	with open("dates.txt",'w') as f:
		for date in l:
			f.writelines(date+'\n')

dateGen()