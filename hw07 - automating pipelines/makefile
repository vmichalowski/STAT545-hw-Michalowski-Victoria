all:script4_report.md hw07_timeseries-CO2emissions-vs-year.png hw07_timeseries-CO2emissions-vs-year-Canada.png hw07_timeseries-CO2emissions-vs-year-Canada-Qatar.png hw07_scatterplot-CO2emissions-vs-year-Canada.png hw07_scatterplot-CO2emissions-vs-year-Qatar.png

CO2_emissions-CDIAC.csv: script1_download_data.R
	Rscript script1_download data.R

CO2_b.rds: CO2_emissions-CDIAC.csv script2_read-data_analysis_write-to-csv.R
	Rscript script2_read-data_analysis_write-to-csv.R CO2_emissions-CDIAC.csv

hw07_scatterplot-CO2emissions-vs-year-Canada.png hw07_scatterplot-CO2emissions-vs-year-Qatar.png: CO2_b.rds script3_read-output_generate-output_save-to-file.R
	Rscript script3_read-output_generate-output_save-to-file.R

script4_report.md: CO2_b.rds script4_report.Rmd
	Rscript -e "rmarkdown::render('script4_report.Rmd')" CO2_b.rds