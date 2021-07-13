path = "./weighted_score.csv"

f=open(path,'r')

for line in f:

    line = line.strip()
    
    print(line)

f.close