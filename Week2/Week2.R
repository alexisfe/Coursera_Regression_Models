library(datasets)
data(mtcars)

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
lire <- lm(y ~ x)



lire <- lm(mpg ~ I(wt/2), data=mtcars)

coef(lire)

newdata = data.frame(wt=1)

predict(lire, newdata, interval="confidence
