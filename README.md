
                          Contents of this Project

Code:

code/01_uterine_lnl.R

    This modifies the data, creates our first table comparing lymph node location and           tumor size  

    This saves the modified data as "uterine_data.rds"" in the output folder

    This saves our first table as "uterine_table.rds"" in the output folder 


code/02_fico_grade.R

    This creates our second table comparing cancer grade status and tumor size  

    This creates our second table as "uterine_table_2.rds"" in the output folder

code/03_patient_age.R

    This creates our third table comparing patient age and tumor size

    This creates our third table as "uterine_table_3.rds"" in the output folder
    
code/04_curve.R

    This creates our binomial logistic regression curve comparing risk and tumor size.

code/decision_boundary.R

    This calculates our Theta 0, Theta 1, and Theta 2 values, develops a cost function, and     creates parameters for our decision boundary to be used and visualized in the               scatterplot

code/uterine_db_scatter.R

    This generates the scatterplot and decsion boundary using our data 
    
    This saves our graph as .png object in output folder
    

code/render_report.R

    This generates our final project, SLN_Final.Rmd.


SLN_Final.Rmd

    This is our project that codes in everything from the code folder, the graphics folder,     the orig_data folder, and the output folder.


Graphics:


Lymph_Drainage.png

    This is our first figure and depicts the complex lymph drainage of the uteri.
    

SLN_procedure.png

    This is our second figure and depicts the SLN and lymphatic vessel excision and             ultrastaging procedure of the uteri.

Location_freq_SLN.png

    This is our third figure and depicts the location and frequency of sentinel lymph nodes     in Grade 1 endometrial cancer.
    

 david.png   
 
    This is my thanks to David.
    
Orig_data:


SNL_Harvard_1.csv


    This is our original dataset.

    

To sync the package repository:

1.) Use `source("renv/activate.R")` -> `renv::restore()`

2.) Use `make install`

To create the final report:

    In the command line of the terminal, use "Make" to render the report.
    
To build the image:

1.) docker build -t slnfp_new .

2.) Link: https://hub.docker.com/repository/docker/minmehar/slnfp_new

3.) docker pull minmehar/slnfp_new `#this will pull from DockerHub`

To use Docker to run this report:

In command line, use `make report.html`
