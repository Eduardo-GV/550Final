#! TO DO: LEAVE UNTIL END
Road_accidents_report.html: render_combined_report.R combined_report.Rmd \
	data/data_clean.rds subproject1/code/01_make_table1.R subproject1/code/02_make_scatter.R \
	subproject2/code/01_models.R
	Rscript render_combined_report.R
#! add a rule for rendering the combined report

#! TO DO:
output/table.rds: code/02_summarytable.R  data/accident.csv 
	Rscript code/02_summarytable.R
#! add a rule for building the output of 
#! subproject1/code/01_make_table1.R

#! TO DO:
subproject1/output/scatter_plot.png: subproject1/code/02_make_scatter.R data/data_clean.rds
	Rscript subproject1/code/02_make_scatter.R
#! add a rule for building the output of 
#! subproject1/code/02_make_scatter.R

#! TO DO:
subproject2/output/01_models.rds: subproject2/code/01_models.R data/data_clean.rds
	Rscript subproject2/code/01_models.R
#! add a rule for building the output of 
#! subproject2/code/01_models.R
