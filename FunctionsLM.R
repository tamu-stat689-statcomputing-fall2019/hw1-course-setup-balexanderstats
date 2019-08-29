# Generate n-dimensional response Y that follows linear regression model Y = Xbeta + epsilon, where epsilon is normal zero with variance sigma^2 independent across samples. Seed should be set at the beginning of the function
# X - design matrix
# beta - given parameter vector
# sigma - standard deviation of the noise
# seed  - starting seed value
generateY <- function(X, beta, sigma, seed = 5832652){
  #[ToDo] Set seed and generate Y following linear model
  set.seed(5832652) #fixes the random number generator for reproducible results
  N=nrow(X) #gets the number of observations in X
  epsilon=rnorm(n=N,sd=sigma) #generates error terms
  Y=X%*%beta+epsilon #adds the error to the fitted values
  # Return Y
  return(Y)
}

# Calculate beta_LS - least-squares solution, do not use lm function
# X - design matrix
# Y -response
calculateBeta <- function(X, Y){
  # Calculate beta_LS
  beta_LS=solve(crossprod(X, X)) %*% crossprod(X, Y) #calculates the least square solution (X'X)^(-1)(X'Y)
  # Return beta
  return(beta_LS)
}

# Calculate MSE
calculateMSE <- function(beta, beta_LS){
  diff=beta-beta_LS #stores difference between beta and beta_LS
  MSE=crossprod(diff,diff) #uses crossprod to get the MSE
  # Return MSE - error ||beta - beta_LS||_2^2
  return(MSE)
}