## Introduction

Following are the details for this submission of the Getting and Cleaning Data Course Project on the data available at 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Raw Data Description
### Raw Data Folders /Files
* <b>Train</b>: 
<ol>
<li>train/X_train.txt: Training set.</li>
<li>train/y_train.txt: Training labels. </li>
<li>Subject_train.txt : Index of Subjects per observation </li>
</ol>

* <b>Test</b>: 
<ol>
<li>test/X_test.txt: Test set.</li>
<li>test/y_test.txt: Test labels.</li></li>
<li>subject_test.txt : Index of Subjects per observation  </li>
</ol>

* <b>Features.txt</b>: List of features - some acronyms are used as follows alonf three 'X', 'Y', 'Z' axis:
<ol>
<li>Mag: Magnitude</li>
<li>Gyro: Gyroscope</li></li>
<li>t: time</li>
<li>f: frequency</li>
<li>Jerk: Jerk Signals</li>
<li>Std: Standard deviation</li>
<li>Mean: Mean of the measurement</li>
<li>Body: Body signals</li>
<li>Gravity: Gravity signals</li>
</ol>


## Transformations Performed
* <b>Subsets</b>: of each Test+Train sets, Test+Train Labels and Test+Train Subjects
* <b>Second Subset of Test+Train sets </b>:selecting only those features with mean and standard deviation values 
* <b>Merging all three subsets</b>: to create the input for tidy data set 
* <b>Final Tidy Data Set</b>: with the average of each variable for each activity and each subject

## Cleaned data specifications
* <b>Variables</b>: Total of 81 variables. variables The 79 following are mean and standard values of the features recorded by the sensors.
* First corresponds to <b>'Subjects'</b> with the range 1-30
* First corresponds to </b>'Activities'</b> within the set/levels {WALKING, WALKING_UPSTAIRS ,WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)}
* Remaining 79 correspond to the features with<b> mean and standard deviation data</b> : Set {tBodyAcc-mean()-X,tBodyAcc-mean()-Y,
tBodyAcc-mean()-Z,tBodyAcc-std()-X,tBodyAcc-std()-Y,tBodyAcc-std()-Z,tGravityAcc-mean()-X,tGravityAcc-mean()-Y,
tGravityAcc-mean()-Z,tGravityAcc-std()-X,tGravityAcc-std()-Y,tGravityAcc-std()-Z,tBodyAccJerk-mean()-X,tBodyAccJerk-mean()-Y,
tBodyAccJerk-mean()-Z,tBodyAccJerk-std()-X,tBodyAccJerk-std()-Y,tBodyAccJerk-std()-Z,tBodyGyro-mean()-X,tBodyGyro-mean()-Y,
tBodyGyro-mean()-Z,tBodyGyro-std()-X,tBodyGyro-std()-Y,tBodyGyro-std()-Z,tBodyGyroJerk-mean()-X,tBodyGyroJerk-mean()-Y,
tBodyGyroJerk-mean()-Z,tBodyGyroJerk-std()-X,tBodyGyroJerk-std()-Y,tBodyGyroJerk-std()-Z,tBodyAccMag-mean(),tBodyAccMag-std(),
tGravityAccMag-mean(),tGravityAccMag-std(),tBodyAccJerkMag-mean(),tBodyAccJerkMag-std(),tBodyGyroMag-mean(),tBodyGyroMag-std(),
tBodyGyroJerkMag-mean(),tBodyGyroJerkMag-std(),fBodyAcc-mean()-X,fBodyAcc-mean()-Y,fBodyAcc-mean()-Z,fBodyAcc-std()-X,
fBodyAcc-std()-Y,fBodyAcc-std()-Z,fBodyAcc-meanFreq()-X,fBodyAcc-meanFreq()-Y,fBodyAcc-meanFreq()-Z,fBodyAccJerk-mean()-X,
fBodyAccJerk-mean()-Y,fBodyAccJerk-mean()-Z,fBodyAccJerk-std()-X,fBodyAccJerk-std()-Y,fBodyAccJerk-std()-Z,fBodyAccJerk-meanFreq()-X,
fBodyAccJerk-meanFreq()-Y,fBodyAccJerk-meanFreq()-Z,fBodyGyro-mean()-X,fBodyGyro-mean()-Y,fBodyGyro-mean()-Z,fBodyGyro-std()-X,
fBodyGyro-std()-Y,fBodyGyro-std()-Z,fBodyGyro-meanFreq()-X,fBodyGyro-meanFreq()-Y,fBodyGyro-meanFreq()-Z,fBodyAccMag-mean(),
fBodyAccMag-std(),fBodyAccMag-meanFreq(),fBodyBodyAccJerkMag-mean(),fBodyBodyAccJerkMag-std(),fBodyBodyAccJerkMag-meanFreq(),
fBodyBodyGyroMag-mean(),fBodyBodyGyroMag-std(),fBodyBodyGyroMag-meanFreq(),fBodyBodyGyroJerkMag-mean(),fBodyBodyGyroJerkMag-std(),
fBodyBodyGyroJerkMag-meanFreq()} 
