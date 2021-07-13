path = "./weighted_score.csv"

f=open(path,'r')

for line in f:
    
    line = line.strip()
    line = line.split(',')
    print(line)

f.close