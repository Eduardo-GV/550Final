
#Running a logistic regression model for my data
logistic_model <- glm(Survived ~ Age + Speed_of_Impact, data = data, family = binomial)
summary(logistic_model)