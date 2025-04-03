#Reading in the data
here::i_am("code/03_model.R")
data <- read.csv("data/accident.csv")

#Running a logistic regression model for my data
logistic_model <- glm(Survived ~ Age + Speed_of_Impact, data = data, family = binomial)
summary(logistic_model)

#Download and call the needed packages
required <- c("broom", "knitr", "kableExtra", "dplyr")
for (pkg in required) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
  }
  library(pkg, character.only = TRUE)  
}

logistic_results_table <- tidy(logistic_model) %>%
  mutate(
    estimate = round(estimate, 3),
    std.error = round(std.error, 3),
    statistic = round(statistic, 2),
    p.value = format.pval(p.value, digits = 3)
  ) %>%
  kable("html", caption = "Logistic Regression Results") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "responsive"))

# Printing the formatted table
logistic_results_table

saveRDS(
  logistic_results_table,
  file = here::here("output/table2.rds")
)