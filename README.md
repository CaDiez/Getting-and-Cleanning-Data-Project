# Getting-and-Cleanning-Data-Project
Repo Made for submitting the Getting and Cleanning Data Project.

## Description of Project
The purpose of this project is to demonstrate the ability to collect, work with, and clean a given data set. The goal is to prepare tidy data that can be used for later analysis.

These files have been submitted to this Repo:
1. run_analysis.R file contains the script.
2. A tidy data set presented in LONG FORM named TidySet.md.
3. A Code Book file called called CodeBook.md that describes the variables, the data, and the transformations that have been performed to clean up the data, the description of the variables for the first WIDE FORM data set and the second independent LONG FORM exported data.
4.This ReadMe.md file that explains how the script works.

## run_analysis.R file

### The goal of this script : Cleaning the dataset (please refer to the next section that briefly explains the data set and provides the link to download it), creating a tidy first dataset presented in WIDE FORM, create a second and independent tidy dataset with the average of each variable for each activity and each subject and export it to the TidySet.txt file.

### This program consists of five main parts:
### I M P O R T A N T: You MUST run this Script AS YOUR WORKING DIRECTORY IN R SPECIFICALLY in THE "UCI HAR Dataset" folder of your computer where you downloaded the data locally (For dataset information and a link to download it please refer to the next section),OTHERWISE the script will NOT RUN as expected.
### Dependency packages:run_analysis.R file depends on data.table, dplyr and tidyr packages. This packages will be loaded for you when you run your script but first you need to install them in you R Environmment using install.packages() command, please refer to R help for details on this procedure.

1. Merges the training and the test sets to create one dataset.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the dataset.
4. Appropiately labels the dataset with descriptive variable names presented in WIDE FORM.
5. From the data set in step 4, creates a second, independent tidy data set presented in LONG FORM with the average of each variable for each activity and each subject.

### For more detailed information about the process of tidying please refer to the run_analysis.R and check the code documentation.

## Data Set Description

[Human Activity Recognition Using Smartphones Dataset]
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy.
activityrecognition '@' smartlab.ws
www.smartlab.ws

To download the file to your computer, please click the following link:
[Data Set File](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip)
