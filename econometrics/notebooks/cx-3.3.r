data = read.csv("../datasets/raw/CEOSAL2.csv")
    
lmobj = lm(log(salary)~log(sales)+log(mktval), data=data)
summary(lmobj)

lmobj2 = lm(log(salary)~log(sales)+log(mktval)+profits, data=data)
summary(lmobj2)

lmobj3 = lm(log(salary)~log(sales)+log(mktval)+profits+ceoten, data=data)
summary(lmobj3)

cor(log(data$mktval), data$profits)