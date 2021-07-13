path = "./weighted_score.csv"

f=open(path,'r')
header = next(f)

for line in f:
    
    line = line.strip()
    line = line.split(',')
    
    part1 = line[2].strip("'")
    part2 = line[3].strip("'")

    print("First Part :",line[2])
    partM= int(part1) * float(part2)

    print(partM)

f.close