# Getting and Cleaning Data Project
===================================
## Contents
This repository contains the following files
+ README.md
+ run_analysis.R: the main code to process the data
+ codebook.md: describe all variables, data and explain steps to clean the data 
+ tidydata.txt: the processed data

## Set up 
1. Unzip the source data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and save it into a folder on your local drive. For example, "/Users/yourname/Documents/get&cleandata".
2. Put run_analysis.R in the source data folder "/Users/yourname/Documents/get&cleandata/UCI HAR Dataset".
3. In RStudio, set the working directory to the folder UCI HAR Dataset:
```r
           setwd("/Users/yourname/Documents/get&cleandata/UCI HAR Dataset") 
```
## Run script
4. Run run_analysis.R to process the data.
5. Output: the tidy data with 180 rows and 67 columns. In details, there are
    * 66 measurements on the mean and standard deviation measurements from the source data.
    * 30 subjects, labelled from 1 to 30.
    * 6 activities, labelled as "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".
    * Each row represents the average of each variable for each  subject and each activity. 
    * The tidy data is saved as a text file, namely "tidydata.txt".
6. To read the output in R, type the command
```r
           read.table("tidydata.txt")
```

