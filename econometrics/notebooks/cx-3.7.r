
data = read.csv("../datasets/raw/MEAP93.csv")

lmobj = lm(math10~log(expend)+lnchprg, data=data)
summary(lmobj)

lm_simple = lm(math10~log(expend), data=data)
summary(lm_simple)

cor(log(data$expend), data$lnchprg)