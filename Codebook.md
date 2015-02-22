# Codebook

 Codebbok describes the variables, the data, and any transformations or work that you performed to clean up the data
 
## Source data

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Additional packages used
1. data.table
2. reshape

## Variables and process
X_train, X_test - data frames, where the data from train and test source data was read into. Information from features and activity_labels was used to give names to variables
y_train, y_test - data frames, where activity types are stored
activity_labels - types of activities
features - types of measured subject
subject_test - number of a subject/volunteer
ext_index - indexes for extracting information only about nean and standard deviations from test and train data frames
bind_test, bind_train - merged data for test and train
bind_data - merged data (test + train)
tidy - data, properly filtered and labeled
