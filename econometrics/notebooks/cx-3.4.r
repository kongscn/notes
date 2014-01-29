data = read.csv("../datasets/raw/ATTEND.csv")
summary(data)

lmobj = lm(atndrte~priGPA+ACT, data=data)
summary(lmobj)