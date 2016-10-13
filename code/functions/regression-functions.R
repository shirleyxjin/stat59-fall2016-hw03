
# This function computes the residual sum of squares, the sum of the difference between observed value and predicted value squared. This function has input value of the linear regression model.
residual_sum_squares <- function(x) {
	return(sum(x$residuals^2))
}

#This function computes the tota sum of squares, which is the variance in the dependent variable. The input value of this function is the linear regression model.
total_sum_squares <- function(x) {
	return(sum((unlist(x$model[1])-mean(unlist(x$model[1])))^2))
}

# This function computes R^2 of the regression model, measuring the proportion of variability in the depedent variable that can be explained by the independent variable. This function is computed using residual_sum_squares and total_sum_squares functions, with input value of the linear regression model.
r_squared <- function(x) {
	return(1 - residual_sum_squares(x)/total_sum_squares(x))
}

# This function computes the F statistics which can be used to test the hypotehsis of relationships between the reponse and the predictors. The input value of this function is the linear regression model.
f_statistics <- function(x) {
	n <- length(x$residual)
	p <- length(x$coefficients) - 1
	return(((total_sum_squares(x)-residual_sum_squares(x))/p)/(residual_sum_squares(x)/(n-p-1)))
}

# This function computes the residual standard error, measuring the average amount that the response will deviate from the true regression line. The function's input value is the linear regression model.
residual_std_error <- function(x) {
	n <- length(x$residual)
	p <- length(x$coefficients) - 1
	return(sqrt((1/(n-p-1))*residual_sum_squares))
}