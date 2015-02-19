# Getting and Cleaning Data Project

# CodeBook Help File
This is a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data.

### Source of Data
Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The dataset has been unzipped as provided, please refer to README.md file or run_analysis.R inner code commentaries to see the way which you must unzip the data in order to make the code works, for more information please refer to the following link:

Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### All the Data
The Original Dataset includes the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

### Transformations:

The original dataset contains 10299 observations and 561 variables AFTER filtering any column name. For details about the original data and its variables please refer to the "Source of Data" section of this document.

The script have been made to decompose information of the original data set, select only the variables that containst the words "-mean" and "-std" in their names an create an initial NEW data set with that information. If you refer to the coursera project description this would be from Setp 1 to 4 of the assignment.

After the selecting process that only selects the "-mean" and "-std" column names the new initial data set is composed of 10299 observations and 82 variables named "MergedDSAll" in the run_analysis.R script, this initial tidy dataset is presented in WIDE FORM and it´s variables are the following:

 [1] "id_Activity"                     "Activity"                        "id_Subject"                     
 [4] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"               "tBodyAcc-mean()-Z"              
 [7] "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"               
[10] "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"           
[13] "tGravityAcc-std()-X"             "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
[16] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"           "tBodyAccJerk-mean()-Z"          
[19] "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
[22] "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"             
[25] "tBodyGyro-std()-X"               "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
[28] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"          "tBodyGyroJerk-mean()-Z"         
[31] "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
[34] "tBodyAccMag-mean()"              "tBodyAccMag-std()"               "tGravityAccMag-mean()"          
[37] "tGravityAccMag-std()"            "tBodyAccJerkMag-mean()"          "tBodyAccJerkMag-std()"          
[40] "tBodyGyroMag-mean()"             "tBodyGyroMag-std()"              "tBodyGyroJerkMag-mean()"        
[43] "tBodyGyroJerkMag-std()"          "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
[46] "fBodyAcc-mean()-Z"               "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"               
[49] "fBodyAcc-std()-Z"                "fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"          
[52] "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"          
[55] "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"           
[58] "fBodyAccJerk-std()-Z"            "fBodyAccJerk-meanFreq()-X"       "fBodyAccJerk-meanFreq()-Y"      
[61] "fBodyAccJerk-meanFreq()-Z"       "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
[64] "fBodyGyro-mean()-Z"              "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"              
[67] "fBodyGyro-std()-Z"               "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"         
[70] "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"              "fBodyAccMag-std()"              
[73] "fBodyAccMag-meanFreq()"          "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-std()"      
[76] "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-std()"         
[79] "fBodyBodyGyroMag-meanFreq()"     "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-std()"     
[82] "fBodyBodyGyroJerkMag-meanFreq()"

Once that the initial dataset have been done, the script proceed to generate the final dataset and export it to a file named TidySet.txt that is created in your working directory. For this final dataset named "tidySet" into the R script, I have apply the rules of tidying data and present the dataset in LONG form with the following variables and descriptions:

* "id_Subject": Id of the subject performing activities
* "Activity"  : Activity performed by the subject 
* "Variable"  : Selected Variable, this comes from the initial dataset and are all the columns EXCEPT "id_Activity", * * "Activity" and "id_Subject" 
* "Value"     :Mean of the Value grouped by "id_Subject", "Activity" and "Variable"

The final dataset have 14220 observations (The result of 30 subjects, performing 6 activities of 79 variables) and fulfill the tidy data rules.

For more information about the detailed process and each steps followed to achieve the results please refer to README.MD file and inner commentaries added in the run_analysis.R file.
