
Road_accidents_report.html: code/04_render.R Road_accidents_report.Rmd \
  output/table1.rds output/scatterplot.png output/table2.rds
	Rscript code/04_render.R

output/table1.rds: code/01_summarytable.R  data/accident.csv 
	Rscript code/01_summarytable.R

output/scatterplot.png: code/02_scatterplot.R  data/accident.csv 
	Rscript code/02_scatterplot.R
	
output/table2.rds: code/03_model.R  data/accident.csv 
	Rscript code/03_model.R 

clean:
	rm output/* && rm *.html 
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
	
########## Make rules for docker ##########

PROJECTFILES = Road_accidents_report.Rmd code/01_summarytable.R code/02_scatterplot.R \
  code/03_model.R code/04_render.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

# rule to build the project image
project_image: $(PROJECTFILES) $(RENVFILES)
	docker build --platform=linux/amd64 -t eduardogon/project_image .

# rule to build the report automatically inside a container
report/Road_accidents_report.html:
	docker run -v "$$(pwd)/report":/project/final_report eduardogon/project_image


