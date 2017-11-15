PROCESS REPORT

To hopefully ease interpretation of where all of the files in my folder came from and what they each mean, I'll outline what steps I took in this assignment.

1. Before I really understood how to put scripts together, I took the old approach of writing all of my code in an R markdown file, which is why I have a file called ["hw07.Rmd"](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw07%20-%20automating%20pipelines/hw07.Rmd), for which the rendered md file can be found [here](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw07%20-%20automating%20pipelines/hw07.md), in case that's helpful.
2. I used this hw07.Rmd file to make sure that all of my code was working as I intended. This is the point where I started figuring out how to automate the pipeline.
3. I took apart my hw07.Rmd file and put each seperate part into it's own R script file:
- [script1_download_data.R](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw07%20-%20automating%20pipelines/script1_download_data.R): downloaded data for the assignment.
- [script2_read-data_analysis_write-to-csv.R](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw07%20-%20automating%20pipelines/script2_read-data_analysis_write-to-csv.R): read the data, performed exploratory analysis, and wrote numerical data to file in CSV format.
- [script3_read-output_generate-output_save-to-file.R](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw07%20-%20automating%20pipelines/script3_read-output_generate-output_save-to-file.R): read the output of the second script, generated figures the visualize linear regressions, and saved them to png files.
4. And then I created a Rmd for my report:
- [script4_report.Rmd](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw07%20-%20automating%20pipelines/script4_report.Rmd)
5. And finally, I created a fifth script to bring these all together. I created one that only used R, and another that used make.
- [script5_automated-using-R.R](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw07%20-%20automating%20pipelines/script5_automated-using-R.R)
- [script5_automated-using-make](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw07%20-%20automating%20pipelines/script5_automated-using-make)

These steps led to the final report, which you can find [here](https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/blob/master/hw07%20-%20automating%20pipelines/script4_report.md).

I guess my biggest challenge with this was putting together what we learned in class about pipelines and putting them together. The error messages that make gave me when trying to build were not always easy to understand, but luckily concerned small things that were relatively easy to address. For example, one error message I got was becauase one of my scripts had a space in the name rather than an underscore.

Beyond the challenge of automating the pipeline, there were some usual problems that come up with working with a new data set, such as formatting the data from wide to long (solved with gather()), and changing variables from character to numeric (as.numeric), which weren't hard to solve, especially since I took STAT 545A and the past homework was a good refresher to remember how to deal with these issues.

