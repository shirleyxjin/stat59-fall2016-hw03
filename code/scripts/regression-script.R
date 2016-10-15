#Reading data
advertising <- read.csv("../../data/Advertising.csv")
advertising <- advertising[-1]

# Computing regression and saving regression statistics
regTV <- lm(advertising$Sales ~ advertising$TV)
sum_regTV <- summary(regTV)

regRadio <- lm(advertising$Sales ~ advertising$Radio)
sum_regRadio <- summary(regRadio)

regNewspaper <- lm(advertising$Sales ~ advertising$Newspaper)
sum_regNewspaper <- summary(regNewspaper)

regression <- lm(Sales ~ TV + Radio + Newspaper, data = advertising)
regressionstats <- summary(regression)

save(regTV,sum_regTV,regRadio,sum_regRadio,regNewspaper,sum_regNewspaper,regression,regressionstats, file="../../data/regression.RData")

# Scatterplot images
png(filename = "../../images/scatterplot-tv-sales.png")
plot(advertising$TV, advertising$Sales, main="Scatterplot of TV Budgets",xlab="TV",ylab="Sales",pch=19,col="brown3",cex=0.8)
abline(regTV,col="dodgerblue4",lwd=3)
dev.off()

png(filename = "../../images/scatterplot-radio-sales.png")
plot(advertising$Radio, advertising$Sales, main="Scatterplot of Radio Budgets",xlab="Radio",ylab="Sales",pch=19,col="brown3",cex=0.8)
abline(regRadio,col="dodgerblue4",lwd=3)
dev.off()

png(filename = "../../images/scatterplot-newspaper-sales.png")
plot(advertising$Newspaper, advertising$Sales, main="Scatterplot of Newspaper Budgets",xlab="TV",ylab="Sales",pch=19,col="brown3",cex=0.8)
abline(regNewspaper,col="dodgerblue4",lwd=3)
dev.off()

# Diagnostics plot images
png(filename = "../../images/residual-plot.png")
plot(regression, which = 1, caption="Residual Plot")
dev.off()

png(filename = "../../images/scale-location-plot.png")
plot(regression, which = 2, caption="Scale Location Plot")
dev.off()

png(filename = "../../images/normal-qq-plot.png")
plot(regression, which = 3, caption="Normal QQ Plot")
dev.off()
