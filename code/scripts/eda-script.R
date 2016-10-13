advertising <- read.csv("http://www-bcf.usc.edu/%7Egareth/ISL/Advertising.csv")

advertising <- advertising[-1]

sink(file = "../data/eda-output.txt")
summary(advertising)
sink()

pdf(file = "../images/histogram-tv.pdf")
hist(advertising$TV, main="Histogram of TV Budgets",xlab= "TV",ylab="Frequency")
dev.off

png(filename = "../images/histogram-tv.png")
hist(advertising$TV, main="Histogram of TV Budgets",xlab= "TV",ylab="Frequency")
dev.off

pdf(file = "../images/histogram-sales.pdf")
hist(advertising$Sales, main="Histogram of Sales",xlab="Sales",ylab="Frequency")
dev.off

png(filename = "../images/histogram-sales.png")
hist(advertising$Sales, main="Histogram of Sales",xlab="Sales",ylab="Frequency")
dev.off