FROM rocker/r-ubuntu

RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('labelled')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('gtsummary')"

RUN apt-get update && apt-get install -y pandoc

RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libfontconfig1-dev
RUN apt-get install -y libssl-dev

RUN mkdir project
workdir /project

COPY Makefile .
COPY SLN_Final.Rmd .
COPY Location_freq_SLN.png .
COPY Lymph_Drainage.png .
COPY SLN_procedure.png .
COPY david.png .

RUN mkdir code
RUN mkdir orig_data
RUN mkdir output
RUN mkdir report

COPY code/01_uterine_lnl.R code
COPY code/02_fico_grade.R code
COPY code/03_patient_age.R code
COPY code/04_curve.R code
COPY code/decision_boundary.R code
COPY code/render_report.R code
COPY code/uterine_db_scatter.R code

COPY orig_data/SNL_Harvard_1.csv orig_data

CMD make && mv SLN_Final.html report