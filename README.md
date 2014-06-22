## Coursera Data Science: Getting and Cleaning Data
### Course project
### Liam Roche June 20 2014

This directory contains an R script called "run_analysis.R" for the Getting and Cleaning Data course project.
The script requires these data files:

* X_train.txt
* X_test.txt
* y_train.txt
* y_test.txt
* subject_train.txt
* subject_test.txt
* activity_labels.txt
* features.txt

## Data processing

The script "run_analysis.R" first loads all the measurments and collates them in a single file.
Then it adds the target data - the activities, and the subject identifiers.

With this data it calculates means and standard deviations of each of the 561 
measured features and saves them in the file _means.and.sds.txt_.

The script finally calculates means and sds for every subject and for every 
activity separately and stores all of these means and sds in the file
_all.means.and.sds.txt_.

In _all.means.and.sds.txt_ , as well as the 561 named features, there are columns 
Class.Type which distinguishes between statistics for a subject and statistics 
for an activity, the identifier that identifies a subject or activity (Identifier) 
and the specific statistic (Statistic).

Numerical labels are used for subjects, the text labels from
activity_labels.txt for labelling the six activities, and the labels from
features.txt for labelling features. Note: the latter may need renaming for some types
of further processing.
