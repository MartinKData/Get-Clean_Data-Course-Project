require(dplyr)

# Loading the traing and test sets

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)


# Loading the feature and activity names of the original study

features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
names(activityLabels) <- c("activity", "activityNames")


# Merging the training and test sets to create one data set
# Step 3 & 4 are basically performed as well labeling variables correctly
# and adding activity names with the preset names of the original study

xData <- rbind(x_test, x_train)
names(xData) <- features[,2]  ##Assigns the feature labels to the variable names of xData

yData <- rbind(y_test, y_train)
yData <- rename(yData, performedActivity = V1)
## Adding a column with the corresponding activity names
yData <- merge(yData, activityLabels, by.x = "performedActivity", by.y = "activity", sort = FALSE)

subjectData <- rbind(subject_test, subject_train)
subjectData <- rename(subjectData, subject = V1)

completeData <- cbind(subjectData, yData, xData)


# Extracting only the measurements on the mean and standard deviation for each measurement

avgData <- completeData[, grepl("mean\\(\\)|std\\(\\)", names(completeData))]
baseData <- completeData[, c(1,3)]
avgData <- cbind(baseData, avgData)


# Creating a tidy data set with the average of each variable for each activity and each subject

tidyData <- group_by(avgData, activityNames, subject)
tidyData <- summarise_each(tidyData, funs(mean))
write.table(tidyData, "tidyData.txt", row.name=FALSE)