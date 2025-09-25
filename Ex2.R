library(sandwich)
################ 2.14 ###############
#Simulate data and fit a linear model 1000 times, printing the estimate, variance and confidence intervals each time

sim <- function(hetero=FALSE) {
  beta_est <- c()
  beta_var <- c()
  ci_lower <- c()
  ci_upper <- c()
  ci_sandwich_lower <- c()
  ci_sandwich_upper <- c()
  
  n <- 10000
  beta0 <- 4.5
  beta1 <- 1
  print("true value of beta is ")
  print(beta1)
  
  for (seed in 1:1000) {
    set.seed(seed)
    X <- rnorm(n)
    if(hetero) {
      Y <- rnorm(n, mean = beta0 + beta1*X, sd = abs(X))
    } else {
      Y <- rnorm(n, mean = beta0 + beta1*X, sd = 1)
    }
    
    data <- data.frame(X, Y)
    model <- lm(Y ~ X, data = data)
    #summary(model)
    beta_var <- c(beta_var, diag(vcov(model))[1])
    sandwich_var <- sandwich(model)[2,2]
    
    est <- model$coef[2]
    beta_est <- c(beta_est, est)
    var <- vcov(model)[2,2]
    ci <- cbind(est - 1.96 * sqrt(var), est + 1.96 * sqrt(var))
    ci_lower <- c(ci_lower, ci[1,1])
    ci_upper <- c(ci_upper, ci[1,2])
    #rownames(ci) <- names(est)
    #print(ci)
    
    ci_sandwich <- cbind(est - 1.96 * sqrt(sandwich_var), est + 1.96 * sqrt(sandwich_var))
    ci_sandwich_lower <- c(ci_sandwich_lower, ci_sandwich[1,1])
    ci_sandwich_upper <- c(ci_sandwich_upper, ci_sandwich[1,2])
  }
  
  print("Estimated beta is") 
  print(mean(beta_est))
  print("Beta estimator is ")
  if(abs(mean(beta_est) - beta1) > 0.1) {
    print("biased")
  } else {
    print("unbiased")
  }
  
  
  print("Variance of the beta estimator is")
  if(abs(var(beta_est) - mean(beta_var)) > 0.1) {
    print("biased")
  } else {
    print("unbiased")
  }
  
  print(var(beta_est))
  print(mean(beta_var))
  
  # Check how many confidence intervals contain the true value
  check <- 0
  for(i in 1:1000) {
    if(ci_lower[i] <= beta1 & ci_upper[i] >= beta1) {
      check <- check + 1
    }
  }
  
  print("Proportion of confidence intervals containing the true value: ")
  print(check / 1000)
  # Should be close to 0.95
  
  
  print("Proportion of sandwich confidence intervals containing the true value: ")
  check_sandwich <- 0
  for(i in 1:1000){
    if(ci_sandwich_lower[i] <= beta1 & ci_sandwich_upper[i] >= beta1) {
      check_sandwich <- check_sandwich + 1
    }
  }
  print(check_sandwich / 1000)
}

print("in the case of constant variance:")
sim(hetero = FALSE)

################ 2.15 ###############

# Simulate data with non-constant variance and fit a linear model 1000 times, printing the estimate, variance and confidence intervals each time

print("in the case of variable variance:")
sim(hetero = TRUE)




