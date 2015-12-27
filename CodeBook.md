## Getting Raw Data

The data used for this obtained from [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data used were [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Background Information on Data Set

30 volunteers between the ages of 19 and 48 performed six activities: 

* 'Walking'
* 'Walking upstairs'
* 'Walking Downstairs'
* 'Sitting'
* 'Standing'
* 'Laying'

while wearing a smartphone on thir waist. Using the acceloremotere and gyrosopce embedded in the smartphone, the volunteers were recorded and the data was labeled manually. The data collected was then used to created two data sets. 70% of the participants were used to create the "training" data and the remaining 30% were used to create the "test" data. 

## Working with the Data

##### Merge the training and the test sets to create one data set.
###### Data obtained from zip file above:
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

Test and training data (X_train.txt, X_test.txt), subject (subject_train.txt, subject_test.txt) and activity (y_train.txt, y_test.txt) are merged to obtain a single data set.

##### Extract only the measurements on the mean and standard deviation for each measurement. 

From the merged data set we to extracted new data set with only the values of estimated mean (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std").

##### Use descriptive activity names to name the activities in the data set.

A new column is added to data set created in step 2 with the activity description. This information can be found in the activity types file. 

##### Appropriately label the data set with descriptive activity names.

Use the gsub function to rename in R without parentheses, commas, or dashes; this is done to clean up the data labels.

##### Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

Unsing the data generated from the previous step, we know create a final tidy data set were numeric variables are averaged for each activity and each subject
