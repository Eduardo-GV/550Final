
# Project Description 


## Synchronizing the package repository

* Ensure your working directory is set to be this Final_project directory
* Run `make install` from the command line to install all packages needed to generate the report


## Final report

The final report contains four major sections: 
* `Introduction`
* `Chi-squared Table`
* `Scatter Plot` 
* `Logistic Regression Model` 

The final report should build from a single call to `make` from the command line. 


## Folder structure 

**Final_project folder**
* Contains the project's `Makefile`
* Contains the `Road_accidents_report.Rmd` that helps build the final report

**Data sub-folder**
* Contains the full dataset used for analysis 

**Code sub-folder**
* `01_summarytable.R` has the code for generating the chi-squared table
* `02_scatterplot.R` has the code for the scatterplot of Age vs. Impact Speed
* `03_model.R` has the code for the table of the logistic regression model
* `04_render.R` has the code to build the final report

**Output sub-folder**
* Stores the chi-squared table as `table1.rds`
* Stores the scatter plot as `scatterplot.png`
* Stores the logistic regression table as `table2.rds`


 



