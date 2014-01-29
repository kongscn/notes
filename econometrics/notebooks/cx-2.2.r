data = read.csv("../datasets/raw/CEOSAL2.csv")
summary(data)

length(data[data$ceoten==0,])
lmobj = lm(log(salary)~ceoten, data=data)
summary(lmobj)