
data = read.csv("../datasets/raw/discrim.csv")
summary(data)

lmobj = lm(psoda~prpblck+income, data=data)
summary(lmobj)

summary(lm(psoda~prpblck, data=data))
summary(lm(log(psoda)~prpblck+log(income), data=data))
summary(lm(log(psoda)~prpblck+log(income)+prppov, data=data))

lincome=log(data$income)
cor(lincome, data$prppov, use="complete.obs")