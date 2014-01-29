# R code for example 2.3 on page 33

source('base/rhelper.r')

data = read.csv("../datasets/raw/CRIME1.csv")
lrm = lm(narr86~pcnv+avgsen+ptime86+qemp86, data=data)
summ = summary(lrm)
summ


# verify coefficients
assert.equal(lrm$coefficients['(Intercept)'], 0.707, precision=3)
assert.equal(lrm$coefficients['pcnv'], -0.151, precision=3)
assert.equal(lrm$coefficients['avgsen'], 0.0074, precision=4)
assert.equal(lrm$coefficients['ptime86'], -0.037, precision=3)
assert.equal(lrm$coefficients['qemp86'], -0.103, precision=3)


# under the hood

# deriving estomators
slr_mrate = lm(pcnv~avgsen+ptime86+qemp86, data=data)
residual_1 = slr_mrate$residuals
beta_pcnv = sum(residual_1 * data$narr86)/sum(residual_1**2)
assert.equal(beta_pcnv, lrm$coefficients['pcnv'])


# comparison of simple and multiple
# narr86~pcnv+avgsen+ptime86+qemp86   V.S.
# narr86~pcnv+avgsen
rlm = lm(narr86~pcnv+avgsen, data=data)
beta_1_tilde = rlm$coefficients['pcnv']
beta_2_tilde = rlm$coefficients['avgsen']

rlm_3 = lm(ptime86~pcnv+avgsen, data=data)
rlm_4 = lm(qemp86~pcnv+avgsen, data=data)

delta_31 = rlm_3$coefficients['pcnv']
delta_32 = rlm_3$coefficients['avgsen']

delta_41 = rlm_4$coefficients['pcnv']
delta_42 = rlm_4$coefficients['avgsen']

beta_1_sum = lrm$coefficients['pcnv']
beta_1_sum = beta_1_sum + delta_31 * lrm$coefficients['ptime86']
beta_1_sum = beta_1_sum + delta_41 * lrm$coefficients['qemp86']

beta_2_sum = lrm$coefficients['avgsen']
beta_2_sum = beta_2_sum + delta_32 * lrm$coefficients['ptime86']
beta_2_sum = beta_2_sum + delta_42 * lrm$coefficients['qemp86']

assert.equal(beta_1_tilde, beta_1_sum)
assert.equal(beta_2_tilde, beta_2_sum)


# matrix form
# deriving estimators

X = as.matrix(cbind(rep(1,nrow(data)), data$pcnv, data$avgsen, data$ptime86, data$qemp86))
Y = data$narr86

# Estimate
Estimates=solve(t(X) %*% X) %*% t(X) %*% Y
assert.equal(Estimates, summ$coefficients[, 'Estimate'], precision=10)

# Std. Error
Residuals = Y - X %*% Estimates
Sigma2 = t(Residuals) %*% Residuals / (nrow(data) - ncol(X))
Stds = sqrt(diag(Sigma2[1,1] * solve(t(X) %*% X)))
assert.equal(Stds, summ$coefficients[, 'Std. Error'], precision=10)

# t value
tStatics = Estimates / Stds
assert.equal(tStatics, summ$coefficients[, 't value'], precision=10)

# p-value
pVales = 2*pt(abs(tStatics), (nrow(data) - ncol(X)), lower.tail=FALSE)
assert.equal(pVales, summ$coefficients[, 'Pr(>|t|)'], precision=10)