# R code for example 2.3 on page 33

source('base/rhelper.r')

ceosal = read.csv("../datasets/raw/CEOSAL1.csv")
lrm = lm(salary~roe, data=ceosal)
summ = summary(lrm)
summ

# verify coefficients
assert.equal(lrm$coefficients['(Intercept)'], 963.191, precision=3)
assert.equal(lrm$coefficients['roe'], 18.501, precision=3)


# under the hood

# deriving estomators
xbar = mean(ceosal$roe)
ybar = mean(ceosal$salary)

beta1 = crossprod(ceosal$roe-xbar, ceosal$salary-ybar)/crossprod(ceosal$roe-xbar)
beta0 = ybar - beta1*xbar

assert.equal(beta0, lrm$coefficients[1])
assert.equal(beta1, lrm$coefficients['roe'])

# use cov and var
beta1_2 = cov(ceosal$salary, ceosal$roe)/var(ceosal$roe)
assert.equal(beta1_2, beta1)

message("beta1 = ", beta1)
message("beta0 = ", beta0)


# std error of extomators
# residuals and fitted values can be found in lm object,
# but let't get it from scratch now.

fitted = beta0 + beta1 * ceosal$roe
residuals = ceosal$salary - fitted
n = nobs(lrm)

SSR = crossprod(residuals)
SSE = crossprod(fitted - mean(fitted))
SST = crossprod(ceosal$salary - mean(ceosal$salary))

R_square = 1 - SSR/SST

assert.equal(SSE + SSR, SST)
assert.equal(R_square, summ$r.squared)

# R square can be interpreted as the square of correlation 
# coefficient of y and fitted value
R_square_cor = cor(ceosal$salary, fitted)**2
assert.equal(R_square, R_square_cor)


salary.var = SSR/(n-2)
assert.equal(sqrt(salary.var), summ$sigma)

SST_x = crossprod(ceosal$roe - mean(ceosal$roe))

beta1.var = salary.var / SST_x
beta0.var = beta1.var * crossprod(ceosal$roe) / n

beta1.se = sqrt(beta1.var)
beta0.se = sqrt(beta0.var)

assert.equal(sqrt(beta1.var), summ$coefficients['roe', 'Std. Error'])
assert.equal(sqrt(beta0.var), summ$coefficients['(Intercept)', 'Std. Error'])
message("se(beta1) = ", sqrt(beta1.var))
message("se(beta0) = ", sqrt(beta0.var))

