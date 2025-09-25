library(mdmb)

# cholestrol is a dependent variable on age, hypertension and bmi
dep <- list(model="linreg", formula=chl~age+hyp+bmi)

ind_bmi <- list(model="linreg", formula=bmi~age+hyp)
ind_hyp <- list(model="logistic", formula=hyp~age)
ind <- list(ind_hyp, ind_bmi)

fit <- frm_em(dat=nhanes2, dep=dep, ind=ind, verbose=FALSE)
summary(fit)
