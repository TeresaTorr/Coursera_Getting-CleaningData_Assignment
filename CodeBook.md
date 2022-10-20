---
title: "CodeBook"
author: "T Torr"
date: "2022-10-20"
output: html_document
---

#Codebook assignmet Getting and Cleaning Data.

#Given instructions:

#Merges the training and the test sets to create one data set.

#Extracts only the measurements on the mean and standard deviation for each measurement. 

#Uses descriptive activity names to name the activities in the data set

#Appropriately labels the data set with descriptive variable names. 

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#Objects used:

#activity_labels: df (6x2) with 6 variables used in the other tables.
#completeSet: df (10299x81) merged data we need to work with extracted from the original tables. Afterwards updated with selected columns.
#complete Set1 and completeSet2: middle steps to update completeSet.
#features: df(561x2) to read original table.
#meltedSet: df(813621x4) that transforms completeSet creating an observationc for each activity and each subject.
#meltedSetMean: df(180x81) that calculates the mean per obs per activity and subject from meltedSet.
#subject_train: df(7352x1) read from original table.
#subject_test: df(2947x1) read from original table.
#testdata: df(2947x563) read from original table.
#traindata: df(7352x563) read from original table.
#x_test: df(2947x561) read from original table.
#x_train: df(7352x561) read from original table.
#y_test: df(2947x1) read from original table.
#y_train: df(7352x1) read from original table.

