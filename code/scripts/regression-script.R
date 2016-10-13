advertising <- read.csv("http://www-bcf.usc.edu/%7Egareth/ISL/Advertising.csv")

advertising <- advertising[-1]

regression <- lm(advertising$Sales ~ advertising$TV)
sum_regression <- summary(regression)
save(regression,sum_regression, file="../data/regression.RData")

pdf(file = "../images/scatterplot-tv-sales.pdf")
plot(advertising$TV, advertising$Sales, main="Histogram of TV Budgets",xlab="TV",ylab="Sales",pch=19,col="brown3",cex=0.8)
abline(regression,col="dodgerblue4",lwd=3)
dev.off

png(filename = "../images/scatterplot-tv-sales.png")
plot(advertising$TV, advertising$Sales, main="Histogram of TV Budgets",xlab="TV",ylab="Sales",pch=19,col="brown3",cex=0.8)
abline(regression,col="dodgerblue4",lwd=3)
dev.off