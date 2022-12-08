
SLN_Final: SLN_Final.Rmd code/render_report.R Lymph_Drainage.png \
SLN_procedure.png david.png Location_freq_SLN.png output/uterine_data.rds \
output/uterine_table.rds output/uterine_table_2.rds output/uterine_table_3.rds output/scp_db.png
	Rscript code/render_report.R
	
output/uterine_data.rds output/uterine_table.rds: code/01_uterine_lnl.R
	Rscript code/01_uterine_lnl.R	

output/uterine_table_2.rds: output/uterine_data.rds code/02_fico_grade.R
	Rscript code/02_fico_grade.R

output/uterine_table_3.rds: output/uterine_data.rds code/03_patient_age.R
	Rscript code/03_patient_age.R

output/scp_db.png: output/uterine_data.rds code/uterine_db_scatter.R
	Rscript code/uterine_db_scatter.R

output/bin_curve.png: output/uterine_data.rds code/04_curve.R
	Rscript code/04_curve.R
	

.PHONY: clean
clean:
	rm -f output/*.* && rm -f SLN_Final.html
	
.PHONY: install
install: 
	Rscript -e "renv::restore(prompt = FALSE)"
	
#Docker Rules
	
PROJECTFILES = SLN_Final.Rmd code/01_uterine_lnl.R code/02_fico_grade.R code/03_patient_age.R code/04_curve.R code/decision_boundary.R code/render_report.R code/uterine_db_scatter.R Location_freq_SLN.png Lymph_Drainage.png david.png SLN_procedure.png Makefile

#how to build the image (image name = slnfp_next)

slnfp_again: Dockerfile $(PROJECTFILES)
	docker build -t slnfp_new .
	touch $@

#To mount image

to mount image:
	docker run -it -v "/$(pwd)/report":/project/report slnfp_new bash

#How to pull	
pull image:
	docker pull minmehar/slnfp_new
	
#Docker run command

report.html:
	docker run -v "/$$(pwd)/report":/project/report minmehar/slnfp_new
	
#full path
report.html: 
 docker run -it -v "/Users/sevenguccitearsgmail.com/final_project/report":/project/report minmehar/slnfp_new
	