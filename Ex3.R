library(mdmb)
library(mice)


nhanes2$hyp <- as.numeric(nhanes2$hyp=="yes")
nhanes2 <- nhanes2[, c("age", "hyp", "bmi", "chl")]

md.pattern(nhanes2)

complete_fit <- lm(chl ~ age + hyp + bmi, data=nhanes2)
summary(complete_fit)

# cholestrol is a dependent variable on age, hypertension and bmi
dep <- list(model="linreg", formula=chl~age+hyp+bmi)

ind_bmi <- list(model="linreg", formula=bmi~age+hyp)
ind_hyp <- list(model="logistic", formula=hyp~age)
ind <- list(ind_hyp, ind_bmi)

fit <- frm_em(dat=nhanes2, dep=dep, ind=ind, verbose=FALSE)
summary(fit)

nhanes2Big <- nhanes2[rep(1:nrow(nhanes2), 100), ]
start_time <- proc.time()

fit <- lm(chl ~ age + hyp + bmi, data=nhanes2Big)
proc.time() - start_time

start_time <- proc.time()
fit <- frm_em(dat=nhanes2Big, dep=dep, ind=ind, verbose=FALSE)
proc.time() - start_time

##############################################################

nhanes2.complete <- mice(data=nhanes2, printFlag = FALSE, seed = 1)
mice_fit <- with(data=nhanes2.complete, expr = lm(formula = chl ~ age + hyp + bmi))
pooled_mice_fit <- pool(object=mice_fit)
summary(pooled_mice_fit)


nhanes2.complete <- mice(data=nhanes2Big, printFlag = FALSE, seed = 1)
mice_fit <- with(data=nhanes2.complete, expr = lm(formula = chl ~ age + hyp + bmi))
pooled_mice_fit <- pool(object=mice_fit)
summary(pooled_mice_fit)



nhanes2.complete <- mice(data=nhanes2, printFlag = FALSE, seed = 1, m = 100, maxit = 100)
mice_fit <- with(data=nhanes2.complete, expr = lm(formula = chl ~ age + hyp + bmi))
pooled_mice_fit <- pool(object=mice_fit)
summary(pooled_mice_fit)

nhanes2.complete <- mice(data=nhanes2Big, printFlag = FALSE, seed = 1, m = 10, maxit = 10)
mice_fit <- with(data=nhanes2.complete, expr = lm(formula = chl ~ age + hyp + bmi))
pooled_mice_fit <- pool(object=mice_fit)
summary(pooled_mice_fit)
