data = read.csv("../datasets/raw/MEAP93.csv")
summary(data)

lmobj = lm(math10~log(expend), data=data)
summary(lmobj)

#find x when y = 100
exp((100-lmobj$coefficient['(Intercept)'])/lmobj$coefficient['log(expend)'])