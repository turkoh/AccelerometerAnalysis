##Getting and Cleaning Data (Coursera): Code Book
The goal is to prepare tidy data that can be used for later analysis.
***
###Initial data:
Human Activity Recognition Using Smartphones Data Set A full description of data is available: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
***
###Description of the initial data's variables:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (*TimeDomainSignalsForBodyAcceleration-XYZ and TimeDomainSignalsForGravityAcceleration-XYZ*) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (*TimeJerkSignalsForBodyAcceleration-XYZ and TimeJerkSignalsForBodyGyroscopic-XYZ*). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (*TimeDomainSignalsForBodyAccelerationMag, MagnitudeOfTimeDomainSignalsForGravityAcceleration, MagnitudeOfTimeJerkSignalsForBodyAcceleration, MagnitudeOfTimeDomainSignalsForBodyGyroscopic, MagnitudeOfTimeJerkSignalsForBodyGyroscopic*).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing *FastFourierTransformDomainSignalsForBodyAcceleration-XYZ, FastFourierTransformJerkSignalsForBodyAcceleration-XYZ, FastFourierTransformDomainSignalsForBodyGyroscopic-XYZ, MagnitudeOfFastFourierTransformJerkSignalsForBodyAcceleration, MagnitudeOfFastFourierTransformDomainSignalsForBodyGyroscopic, MagnitudeOfFastFourierTransformJerkSignalsForBodyGyroscopic*. 

#####These signals were used to estimate variables of the feature vector for each pattern:
*'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

+ TimeDomainSignalsForBodyAcceleration-XYZ
+ TimeDomainSignalsForGravityAcceleration-XYZ
+ TimeJerkSignalsForBodyAcceleration-XYZ
+ TimeDomainSignalsForBodyGyroscopic-XYZ
+ TimeJerkSignalsForBodyGyroscopic-XYZ
+ TimeDomainSignalsForBodyAccelerationMag
+ MagnitudeOfTimeDomainSignalsForGravityAcceleration
+ MagnitudeOfTimeJerkSignalsForBodyAcceleration
+ MagnitudeOfTimeDomainSignalsForBodyGyroscopic
+ MagnitudeOfTimeJerkSignalsForBodyGyroscopic
+ FastFourierTransformDomainSignalsForBodyAcceleration-XYZ
+ FastFourierTransformJerkSignalsForBodyAcceleration-XYZ
+ FastFourierTransformDomainSignalsForBodyGyroscopic-XYZ
+ MagnitudeOfFastFourierTransformDomainSignalsForBodyAcceleration
+ MagnitudeOfFastFourierTransformJerkSignalsForBodyAcceleration
+ MagnitudeOfFastFourierTransformDomainSignalsForBodyGyroscopic
+ MagnitudeOfFastFourierTransformJerkSignalsForBodyGyroscopic

######The set of variables that were estimated from these signals are:
+ mean(): Mean value
+ std(): Standard deviation

###Description of the tidy data set's variables:
+ measurement - contains names of all measurements (*TimeDomainSignalsForBodyAcceleration-X, TimeDomainSignalsForGravityAcceleration-X etc*)
+ mean - contains values of measurements on the mean
+ sd - contains values of measurements on the standard deviation
+ X = Xaxis
+ Y = Yaxis
+ Z = Zaxis


