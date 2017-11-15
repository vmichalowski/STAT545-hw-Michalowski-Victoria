##Fifth script: to rule them all, to run the others in sequence.

#Master Script

setwd("C:/Users/Victoria/Desktop/STAT 545A/STAT545 Homework/STAT545-hw-Michalowski-Victoria/hw07 - automating pipelines")


source("script1_download_data.R")
source("script2_read-data_analysis_write-to-csv")
source("script3_read-output_generate-output_save-to-file.R")
rmarkdown::render('script4_report.Rmd')
