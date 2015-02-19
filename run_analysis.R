## I M P O R T A N T: You MUST run this Script AS YOUR WORKING DIRECTORY IN R SPECIFICALLY in THE "UCI HAR Dataset" folder of your computer 
## where you downloaded the data locally (DataSet: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip),
## OTHERWISE the script will NOT RUN as expected.

## THIS IS SCRIPT FIRST CREATES THE DATA SET WITH ALL THE COLUMNS AND DESCRIPTIONS NEEDED FOR THE PROJECT PURPOSES, THEN EXTRACTS ONLY THE
## MEAN AND STD COLUMNS TO CREATE A FIRTS TIDY DATASET IN WIDE FORM AND FINALLY CREATES A SECOND NEW TIDY DATASET 
## WITH MEANS GROUPED IN LONG FORM AND EXPORTS TO A FILE NAMED "TidySet.txt" IN YOUR WORKING DIRECTORY.

## THE CODE IS INTENTIONALLY COMMENTED IN DETAIL TO MAKE EASIER TO READ TO MARKERS.

##Loads libraries needed for the script
library(data.table)
library(dplyr)
library(tidyr)

##STEP 1 Merges the training and the test sets to create one data set.
##Get the data from both TEST & TRAINNING files
train.x<-read.table("./train/X_train.txt")
test.x<-read.table("./test/x_test.txt")

##Merges TRAIN & TEST DATA SETS in one
MergedDSData <-rbind(train.x,test.x) 

##Get COLUMN DESCRIPTIONS to be used in DataSet 
colDescription<- fread("./features.txt")
names(MergedDSData) <- c(as.character(colDescription[,V2]))
##Clear Memory Resources
rm("train.x"); rm("test.x");rm("colDescription")

##Get subjects from both TEST & TRAINNING files
test.subject<-fread("./test/subject_test.txt")
train.subject<-fread("./train/subject_train.txt")
MergedDSSubject <-rbind(train.subject,test.subject) 
setnames (MergedDSSubject, 1, c("id_Subject"))
MergedDSSubject<-cbind(MergedDSSubject, MergedDSData)
##Clear Memory Resources
rm("test.subject"); rm("train.subject"); rm("MergedDSData")

## STEP 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
##Search in the DS all the columns that have SUBJECT, ACTIVITY, -mean or -std 
searchCriteria <- grep("-mean|-std", colnames(MergedDSSubject))
MergedDS.SM <- select(MergedDSSubject,c(1,searchCriteria))
##Clear Memory Resources
rm("MergedDSSubject")

##STEP 3 3.Uses descriptive activity names to name the activities in the data set
##Merges TRAIN & TEST ACTIVITY sets in one
##Get the ACTIVITY labels for all the data sets
##Get the Labels Data from both TEST & TRAINING
train.y<-fread("./train/y_train.txt")
test.y<-fread("./test/y_test.txt")

MergedDSActivity <-rbind(train.y,test.y) 
setnames (MergedDSActivity, 1, c("id_Activity"))
MergedDSActivity<-cbind(MergedDSActivity, MergedDS.SM)
##Clear Memory Resources
rm("train.y"); rm("test.y"); rm("MergedDS.SM")

##STEP 4 Appropriately labels the data set with descriptive variable names.  
##Get the ACTIVITY labels for all the data sets
rowDescription<-fread("./activity_labels.txt")
setnames (rowDescription, 1:2, c("id_Activity", "Activity"))
MergedDSAll<-merge(rowDescription, MergedDSActivity, by = c("id_Activity"))
##Clear Memory Resources
rm("MergedDSActivity"); rm("rowDescription")

##STEP 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidySet <- MergedDSAll %>% 
        gather(Variable, Value, -id_Subject,-Activity, -id_Activity) %>%  
        group_by(id_Subject, Activity, Variable) %>%
        summarise(Value=mean(Value)) %>% 
        arrange(Activity, id_Subject, Activity)

##Export THE NEW Tidy Set TO A CSV FILE LOCATED IN THE WORKING DIRECTORY
write.table(tidySet,file = "TidySet.txt", row.names=FALSE)
##END OF THE SCRIPT
