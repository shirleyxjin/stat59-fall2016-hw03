source("../functions/regression-functions.R")
context("Test for regression functions")

test_that("residual_sum_squares function works as expected"{
	reg = lm(mpg ~ disp + hp, data = mtcars)
	regsum = summary(reg)
	
	expect_equal(residual_sum_squares(reg),sum(reg$residuals^2))
	expect_length(residual_sum_squares(reg),1)
	expect_type(residual_sum_squares(reg),'double')
	expect_gte(residual_sum_squares(reg),0)
})

test_that("total_sum_squares function works as expected"{
	reg = lm(mpg ~ disp + hp, data = mtcars)
	regsum = summary(reg)
	
	expect_equal(total_sum_squares(reg),sum((mtcars$mpg - mean(mtcars$mpg))^2))
	expect_length(total_sum_squares(reg),1)
	expect_type(total_sum_squares(reg),'double')
	expect_gte(total_sum_squares(reg),0)
})

test_that("r_squared function works as expected"{
	reg = lm(mpg ~ disp + hp, data = mtcars)
	regsum = summary(reg)
	
	expect_equal(r_squared(reg),regsum$r.squared)
	expect_length(r_squared(reg),1)
	expect_type(r_squared(reg),'double')
	expect_gte(r_squared(reg),0)
})

test_that("f_statistics function works as expected"{
	reg = lm(mpg ~ disp + hp, data = mtcars)
	regsum = summary(reg)
	
	expect_equal(f_statistics(reg),regsum$fstatistic[1])
	expect_length(f_statistics(reg),1)
	expect_type(f_statistics(reg),'double')
	expect_gte(f_statistics(reg),0)
})

test_that("residual_std_error function works as expected"{
	reg = lm(mpg ~ disp + hp, data = mtcars)
	regsum = summary(reg)
	
	expect_equal(residual_std_error(reg),regsum$sigma)
	expect_length(residual_std_error(reg),1)
	expect_type(residual_std_error(reg),'double')
	expect_gte(residual_std_error(reg),0)
})