# Steps for reproducing the data analysis 
## (Getting and Cleaning Data Project)

Based on the downloaded (from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzipped files in the current working directory, containing the relevant data sets used in this analysis, the executed steps in this data analysis, which are found in 'run_analysis.R', are as follows:

1. Loading the traing and test sets
2. Loading the feature and activity names of the original study
3. Merging the training and test sets to create one data set (including labeling variables correctly and adding activity names with the preset names of the original study)
4. Extracting only the measurements on the mean and standard deviation for each measurement
5. Creating a tidy data set with the average of each variable for each activity and each subject
6. Saving this tidy data set to the file 'tidyData.txt'