# Reading data
advertising <- read.csv("../../data/Advertising.csv")
advertising <- advertising[-1]

# Computing summary statistics and correlation matrix
sink(file = "../../data/eda-output.txt")

cat("Summary statistics of TV\n")
summary(advertising$TV)

cat("Summary statistics of Radio\n")
summary(advertising$Radio)

cat("Summary statistics of Newspaper\n")
summary(advertising$Newspaper)

cat("Summary statistics of Sales\n")
summary(advertising$sales)

cat("Matrix of correlations amongst variables\n")
cor(advertising)

sink()

# Saving correlation matrix
corrmat <- cor(advertising)
save(corrmat, file = "../../data/correlation-matrix.RData")

# Histogram images
png(filename = "../../images/histogram-tv.png")
hist(advertising$TV, main="Histogram of TV Budgets",xlab= "TV",ylab="Frequency")
dev.off()

png(filename = "../../images/histogram-sales.png")
hist(advertising$Sales, main="Histogram of Sales",xlab="Sales",ylab="Frequency")
dev.off()

png(filename = "../../images/histogram-radio.png")
hist(advertising$Radio, main="Histogram of Radio Budgets",xlab= "Radio",ylab="Frequency")
dev.off()

png(filename = "../../images/histogram-newspaper.png")
hist(advertising$Newspaper, main="Histogram of Newspaper Budgets",xlab= "Newspaper",ylab="Frequency")
dev.off()

# Scatterplot image
png(filename = "../../images/scatterplot-matrix.png")
paris(advertising)
dev.off()