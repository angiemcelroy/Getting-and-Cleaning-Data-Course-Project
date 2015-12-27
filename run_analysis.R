## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the 
##    average of each variable for each activity and each subject.

## Read in the data from the working directory. 
## Make sure all needed data is in current working directory. 

subjectTEST <- read.table("subject_test.txt")
subjectTRAIN <- read.table("subject_train.txt")
X_test <- read.table("X_test.txt")
X_train <- read.table("X_train.txt")
Y_test <- read.table("Y_test.txt")
Y_train <-read.table("Y_train.txt")

## 1. Merges the training and the test sets to create one data set.

## Merge test data

testdata <- cbind(cbind(X_test, subjectTEST), Y_test)

## Merge train data

traindata <- cbind(cbind(X_train, subjectTRAIN), Y_train)

## Merge both data into one

allDATA <- rbind(testdata, traindata)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

## Read in features to get the mean and standard deviation. 

features <- read.table("features.txt")
meanandstd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
meanandstd.names <- features[meanandstd, 2]
meanandstd.names <- gsub("\\(|\\)", "", meanandstd.names)
meanandstd.names <- tolower(meanandstd.names)

## 3. Uses descriptive activity names to name the activities in the data set

activitylabels <- read.table("activity_labels.txt")
activitylabels[,2] <- as.character(activitylabels[,2])
activitylabels[, 2] = gsub("_", "", tolower(as.character(activitylabels[, 2])))
activitylabels[,1] = activitylabels[activitylabels[,1], 2]
activity.names <- "activity"

## 4. Appropriately labels the data set with descriptive variable names.

colnames(activitylabels)  = c('activityId','activityType');
colnames(subjectTRAIN)  = "subjectId";
colnames(X_train)        = features[,2]; 
colnames(Y_train)        = "activityId";

colnames(subjectTEST) = "subjectId";
colnames(X_test)       = features[,2]; 
colnames(Y_test)       = "activityId";

colnames(allDATA) <- c("subject", "activity", meanandstd.names)

## 5. From the data set in step 4, creates a second, independent tidy data set with the 
##    average of each variable for each activity and each subject.

allData.melted <- melt(allDATA, id = c("subject", "activity"))
allData.averages <- dcast(allData.melted, subject + activity ~ variable, mean)

## expoert tidy data set as .txt

write.table(allData.averages, "tidydata.txt", row.names = FALSE, quote = FALSE)