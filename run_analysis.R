###############################################################################################
# This R script process data from the UCI HAR Dataset that containing in three text files:    #
# - features.txt                                                                              #
# - train/X_train.txt (training data)                                                         #
# - test/X-test.txt (test data)                                                               #
# The aim of the script is to merge training and test data and extract only the measurements  #
# on the mean and standard deviation for each measurement. The obtained tidy dataset saved as #
# a separate text file.                                                                       #
# The script was writen by Matt Turk as a project of the Coursera's Getting and               #
# Cleaning Data Course.                                                                       #
###############################################################################################

## Read Data files with specified column names
activities <- read.table("activity_labels.txt", col.names = c("activitycode","activityLabel"))
features <- read.table("features.txt", col.names = c("featurecode","feature"))
subjecttest <- read.table("subject_test.txt", col.names = "subjectId")
subjecttrain <- read.table("subject_train.txt", col.names = "subjectId")

## Read Activity Code Data file and merged with Activities Data file to create descriptive activity names
## Set "sort = FALSE" to NOT reorder data to allow for future column binding
traininglabels <- read.table("y_train.txt", col.names = "activitycode")
  traininglabels <- merge(traininglabels, activities, sort = FALSE)

## Read Activity Code Data file and merged with Activities Data file to create descriptive activity names
## Set "sort = FALSE" to NOT reorder data to allow for future column binding
testinglabels <- read.table("y_test.txt", col.names = "activitycode")
  testinglabels <- merge(testinglabels, activities, sort = FALSE)

## Read Data file and merged by column binding
trainingset <- read.table("X_train.txt", col.names = features[,2])
  trainingset <- cbind(traininglabels, trainingset)
    trainingset <- cbind(subjecttrain, trainingset)

## Read Data file and merged by column binding
testingset <- read.table("X_test.txt", col.names = features[,2])
  testingset <- cbind(testinglabels, testingset)
    testingset <- cbind(subjecttest, testingset)

## Total merged Dataset by row binding
totaldataset <- rbind(trainingset, testingset)

## Romoved objects from workspace environment that are no longer needed
remove(activities, features, subjecttest, subjecttrain, testinglabels,
       testingset, traininglabels, trainingset)

## Cleaning Dataset
colnames(totaldataset) <- gsub("\\.", "", names(totaldataset))
colnames(totaldataset) <- gsub("meanFreq", "MeanFreq", names(totaldataset))

## Extracting only the measurements on the mean and standard deviation for each measurement
meanstddataset <- totaldataset[,c("subjectId","activityLabel",
                                  grep("mean|std", names(totaldataset), value = TRUE))]

## Appropriately labeling the dataset with descriptive variable names as requested in the assignment.
## Using long name format as recommended during lectures
## Using camel case format due to length of new descriptive variable names
colnames(meanstddataset) <- sub("tBodyAccJerkMag", "MagnitudeOfTimeJerkSignalsForBodyAcceleration", names(meanstddataset))
colnames(meanstddataset) <- sub("tBodyAccJerk", "TimeJerkSignalsForBodyAcceleration", names(meanstddataset))
colnames(meanstddataset) <- sub("tBodyAccMag", "MagnitudeOfTimeDomainSignalsForBodyAcceleration", names(meanstddataset))
colnames(meanstddataset) <- sub("tBodyAcc", "TimeDomainSignalsForBodyAcceleration", names(meanstddataset))
colnames(meanstddataset) <- sub("tGravityAccMag", "MagnitudeOfTimeDomainSignalsForGravityAcceleration", names(meanstddataset))
colnames(meanstddataset) <- sub("tGravityAcc", "TimeDomainSignalsForGravityAcceleration", names(meanstddataset))
colnames(meanstddataset) <- sub("tBodyGyroJerkMag", "MagnitudeOfTimeJerkSignalsForBodyGyroscopic", names(meanstddataset))
colnames(meanstddataset) <- sub("tBodyGyroJerk", "TimeJerkSignalsForBodyGyroscopic", names(meanstddataset))
colnames(meanstddataset) <- sub("tBodyGyroMag", "MagnitudeOfTimeDomainSignalsForBodyGyroscopic", names(meanstddataset))
colnames(meanstddataset) <- sub("tBodyGyro", "TimeDomainSignalsForBodyGyroscopic", names(meanstddataset))

colnames(meanstddataset) <- sub("fBodyAccJerkMag", "MagnitudeOfFastFourierTransformJerkSignalsForBodyAcceleration", names(meanstddataset))
colnames(meanstddataset) <- sub("fBodyAccJerk", "FastFourierTransformJerkSignalsForBodyAcceleration", names(meanstddataset))
colnames(meanstddataset) <- sub("fBodyAccMag", "MagnitudeOfFastFourierTransformDomainSignalsForBodyAcceleration", names(meanstddataset))
colnames(meanstddataset) <- sub("fBodyAcc", "FastFourierTransformDomainSignalsForBodyAcceleration", names(meanstddataset))
colnames(meanstddataset) <- sub("fBodyGyroJerkMag", "MagnitudeOfFastFourierTransformJerkSignalsForBodyGyroscopic", names(meanstddataset))
colnames(meanstddataset) <- sub("fBodyGyroMag", "MagnitudeOfFastFourierTransformDomainSignalsForBodyGyroscopic", names(meanstddataset))
colnames(meanstddataset) <- sub("fBodyGyro", "FastFourierTransformDomainSignalsForBodyGyroscopic", names(meanstddataset))

colnames(meanstddataset) <- sub("fBodyBodyAccJerkMag", "MagnitudeOfFastFourierTransformJerkSignalsForBBodyAcceleration", names(meanstddataset))
colnames(meanstddataset) <- sub("fBodyBodyGyroJerkMag", "MagnitudeOfFastFourierTransformJerkSignalsForBBodyGyroscopic", names(meanstddataset))
colnames(meanstddataset) <- sub("fBodyBodyGyroMag", "MagnitudeOfFastFourierTransformDomainSignalsForBBodyGyroscopic", names(meanstddataset))

colnames(meanstddataset) <- sub("X", "Xaxis", names(meanstddataset))
colnames(meanstddataset) <- sub("Y", "Yaxis", names(meanstddataset))
colnames(meanstddataset) <- sub("Z", "Zaxis", names(meanstddataset))

colnames(meanstddataset) <- sub("mean", "Mean", names(meanstddataset))
colnames(meanstddataset) <- sub("std", "StdDev", names(meanstddataset))


require(reshape2)

## Dataset melt to reshape variable calculations into each activity for each subject
meanstddatasetmelt <- melt(meanstddataset, id=c("subjectId", "activityLabel"),
                           measure.vars=c(3:68))

## Creat final tidy dataset reshape with dcast format to display average of each variable for each activity and each subject
tidyDataSet <- dcast(meanstddatasetmelt, activityLabel + subjectId ~ variable,mean)

## Write dataset to text file
write.table(tidyDataSet, file = "tidyDataSet.txt")

