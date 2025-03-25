


#Loading the gt package, to be used for making my table
library(gt)

# Creating a table that summarizes seatbelt vs. survival status, including the chi-squared result 
results_table <- as.data.frame(cross_tabulation) %>%
  gt() %>%
  tab_header(
    title = "Chi-Squared for Seatbelt Wear vs. Survival Status"
  ) %>%
  cols_label(
    Var1 = "Seatbelt Used",
    Var2 = "Survived",
    Freq = "Count"
  ) %>%
  tab_spanner(
    label = "Chi-Squared Test Results",
    columns = c(Var1, Var2, Freq)
  ) %>%
  tab_footnote(
    footnote = paste("Chi-Squared Statistic: ", round(chi_squared_test$statistic, 2), 
                     "| p-value: ", round(chi_squared_test$p.value, 4))
  )

results_table

#Saving my table in the output folder of my project directory 
saveRDS(
  results_table,
  file = here::here("output/table.rds")
)