data = read.csv("../datasets/raw/401K.csv")
summary(data)
lmobj = lm(prate~mrate, data=data)
summ = summary(lmobj)
summ

predict(lmobj, data.frame(mrate=3.5))