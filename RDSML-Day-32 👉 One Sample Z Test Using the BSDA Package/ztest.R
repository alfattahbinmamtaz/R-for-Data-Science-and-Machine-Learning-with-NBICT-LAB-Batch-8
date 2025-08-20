# One sample Z test
# Installing the BSDA package
# install.packages("BSDA")
library(BSDA)

#Importing the dataset
data <- read.csv("perfume.CSV")
data <- read.csv("Perfume.CSV")
mean (dataset$Machine.1)

z.test(x = dataset$Machine.1, alternative = "greater", mu = 150, sigma.x = 2)
