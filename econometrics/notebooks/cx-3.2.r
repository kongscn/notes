data = read.csv("../datasets/raw/hprice1.csv")

lmobj = lm(price~sqrft+bdrms, data=data)
summ = summary(lmobj)
summ