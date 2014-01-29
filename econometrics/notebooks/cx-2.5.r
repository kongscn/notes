data = read.csv("../datasets/raw/RDCHEM.csv")
summary(data)

summary(lm(log(rd)~log(sales), data=data))