data = read.csv("../datasets/raw/WAGE2.csv")
summary(data)
sd(data$IQ)

lmobj = lm(wage~IQ, data=data)
summary(lmobj)

lmobj = lm(log(wage)~IQ, data=data)
summary(lmobj)