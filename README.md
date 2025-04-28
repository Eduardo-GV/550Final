
# Project Description 


## Building the Docker image

* Ensure your working directory is set to be this Final_project directory
* The Docker image can be built from a call to `make project_image`
* The publicly-available image for this project is called `eduardogon/project_image`
  * Link: https://hub.docker.com/repository/docker/eduardogon/project_image/general


## Synchronizing the package repository

* Ensure your working directory is set to be this Final_project directory
* Run `make install` from the command line to install all packages needed to generate the report


## Final report

The final report contains four major sections: 
* `Introduction`
* `Chi-squared Table`
* `Scatter Plot` 
* `Logistic Regression Model` 

### Options for building the final report

Set working directory to this `Final_project` folder.

The final report can be built from a call to `make report/Road_accidents_report.html`
at the command line, which will execute the following Docker run command on Mac based 
on the project image:
* `docker run -v "$(pwd)/report":/project/final_report eduardogon/project_image`
  * To get this command to work from a Windows system, an additional "\" is needed 
    at the start of the file path in the Makefile line 35
* The report should then appear in the `report` folder 

The report can also build from a single call to `make` from the command line.
For this method, the package environment should be synchronized first (see above).


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


 



