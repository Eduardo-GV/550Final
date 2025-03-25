

here::i_am("code/01_chisqtest.R")

#Reading in the data
here::i_am("code/01_chisqtest.R")
data <- read.csv("data/accident.csv")

#Conducting chi-squared for seatbelt use and survival status

cross_tabulation <- table(data$Seatbelt_Used, data$Survived)
chi_squared_test <- chisq.test(cross_tabulation)

#Saving the chi-squared test as a dataframe with the relevant variables
chi_squared_summary <- data.frame(
  Statistic = chi_squared_test$statistic,
  p_value = chi_squared_test$p.value,
  Degrees_of_Freedom = chi_squared_test$parameter,
  Expected_Values = paste(chi_squared_test$expected, collapse = ", ")
)

