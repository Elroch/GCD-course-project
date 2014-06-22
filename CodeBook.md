---
title: "Codebook"
author: "Liam Patrick Roche"
date: "Sunday, June 22, 2014"
output: html_document
---
Files in this project (github repository Elroch/GCD-course-project) comprise provided data files:

* X_train.txt
* X_test.txt
* y_train.txt
* y_test.txt
* subject_train.txt
* subject_test.txt
* activity_labels.txt
* features.txt

a single analysis file:

* run_analysis.R

and two output files:

* means.and.sds.txt
* all.means.and.sds.txt

There are in addition a README.md file giving a brief description of the operation of the analysis script and this file, 
documenting the input and output data.

Labels for all 561 features obtained from features.txt are used for columns in X_train.txt and X_test.txt as provided. 
The same labels are used for columns in the output file from run_analysis.R "all.means.and.sds.txt". 
They are also all used as row labels in the file "means.and.sds.txt". (The reason for the change of orientation is that 
in the former, the output is a set of features for each subject and each activity, whereas in the latter, the output is 
two features for each of the original 561 features.)

Mew column names in "means.and.sds.txt" are:

* Mean - means of each of the 561 features in rows
* SD -  standard deviation of each of the 561 features in rows

Each row of "all.means.and.sds.txt" provides a specific statistic for each of the 561 features on a defined subgroup of
the data.
The last 561 column names indicate which feature is used to generate the statistic. The other columns are:

* Class.Type - indicates if the subgroup is a single subject (value "Subject") or a single activity (value "Activity")
* Identifier - a single integer indicating which subject or activity the row is associated with
* Statistic - either "Mean" or "SD" indicating whether the 561 numbers in later columns of the row are the means or the
standard deviations of a group of feature values.

