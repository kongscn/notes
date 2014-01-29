data = read.csv("../datasets/raw/SLEEP75.csv")
summary(data)

lmobj=lm(sleep~totwrk, data=data)
summ=summary(lmobj)
summ

message('Number of obs: ', nobs(lmobj))
