data = read.csv("../datasets/raw/charity.csv")
summary(data)

nrow(data[data[,'gift']==0,])/nrow(data)

lmobj = lm(gift~mailsyear, data=data)

summary(lmobj$fitted.values)