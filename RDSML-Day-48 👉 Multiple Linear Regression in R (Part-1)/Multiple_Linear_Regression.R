# Multiple_Linear_Regression 

# Import the dataset
dataset <- read.csv("50_Startups.csv")

# Encoding the categorial data
dataset$State <- factor (dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))

# Splitting the dataset into the Traing set and Test set
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset,split == FALSE)

# Fitting the Multiple Linear Regression Model to the Training Set
regressor <- lm(formula = Profit ~ R.D.Spend + Admistration + Marketing.Spend + State,
                data = training_set)
