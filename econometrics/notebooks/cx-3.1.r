data = read.csv("../datasets/raw/BWGHT.csv")
cor(data$cigs, data$faminc)

lmobj = lm(bwght~cigs+faminc, data=data)
summ = summary(lmobj)
summ

lmobj = lm(bwght~cigs, data=data)
summary(lmobj)