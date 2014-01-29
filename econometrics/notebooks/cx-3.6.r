source('base/rhelper.r')

data = read.csv("../datasets/raw/WAGE2.csv")

delta1 = lm(IQ~educ, data=data)$coefficients['educ']
beta1_hat = lm(log(wage)~educ, data=data)$coefficients['educ']
lmobj = lm(log(wage)~educ+IQ, data=data)

beta1 = lmobj$coefficients['educ']
beta2 = lmobj$coefficients['IQ']

assert.equal(beta1_hat, beta1+beta2*delta1)