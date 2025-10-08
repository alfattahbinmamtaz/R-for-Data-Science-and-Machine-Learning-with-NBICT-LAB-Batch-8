housetasks <- read.delim("housetasks.txt", row.names = 1)
install.packages("gplots")

chisq <- chisq.test(housetasks)
chisq

# Standardized (Pearson) residuals calculation
round(chisq$residuals, 3)
# Adjusted Standardized Residuals calculation
chisq$stdres

corrplot
install.packages("corrplot")
library(corrplot)
corrplot(chisq$residuals, is.cor = FALSE)

contrib <- 100 * chisq$residuals^2 / chisq$statistic
round(contrib, 3)
corrplot(contrib, is.cor = FALSE)
