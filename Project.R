library(ggplot2)

data(mtcars)
attach(mtcars)
# You work for Motor Trend, a magazine about the automobile industry. 
# Looking at a data set of a collection of cars, they are interested in exploring the relationship between a set of variables and miles per gallon (MPG) (outcome). 
# They are particularly interested in the following two questions:

# Is an automatic or manual transmission better for MPG
# Quantify the MPG difference between automatic and manual transmissions

lm <- lm(mpg ~ ., mtcars)

# According to the R squared measurement, variables in the model are able to explain 81% of the variance in MPG.
summary(lm)$r.squared

#None of the coefficients have a statistical significant relationship as p-values are over 0.05
summary(sm)$coef[-1, 4]

#Perform backward stepwise model selection for best fit
sm <- step(lm, k=log(nrow(mtcars)))

#The model built using the variables found by step can explain 85% of the variance in MPG.
summary(sm)$r.squared

#All coefficients show a statistical significant relationship as their p-values are less than 0.05
summary(sm)$coef[-1, 4]

# Boxplot of mpg by transmission type 
ggplot(mtcars, aes(x=factor(am), y=mpg)) + 
  geom_boxplot() +
  labs(title="Boxplot - MPG by transmission type", x="Transmission type (0=Automatic, 1=Manual)", y="MPG")
