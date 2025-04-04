
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