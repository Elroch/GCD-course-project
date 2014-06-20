setwd("c://users/liam/documents/r/datascience/uci har dataset")

## Load descriptive information about activity labels and features
i("activity_labels.txt")) {
    activity.labels = read.csv("activity_labels.txt", sep=" ", header=F)
} else {
    stop("You need the file \"activity_labels.txt\" in your working directory!")
}

if (file.exists("features.txt") {
    features = read.csv("features.txt", sep=" ", header=F)
} else {
    stop("You need the file \"features.txt\" in your working directory!")
}

## Load the two feature data files
if (file.exists("X_train.txt")) {
    X.train = read.fwf("X_train.txt", widths=rep(16,561), header=F)
} else {
    stop("You need the file \"X_train.txt\" in your working directory!")
}

if (file.exists("X_test.txt")) {
    X.test  = read.fwf("X_test.txt", widths=rep(16,561), header=F)
} else {
    stop("You need the file \"X_test.txt\" in your working directory!")
}

## Load the identifiers for the subjects associated with the measured data

if (file.exists("subject_train.txt")) {
    subject.train  = read.csv("subject_train.txt", header=F)
} else {
    stop("You need the file \"subject_train.txt\" in your working directory!")
}

if (file.exists("subject_test.txt")) {
    subject.test  = read.csv("subject_test.txt", header=F)
} else {
    stop("You need the file \"subject_test.txt\" in your working directory!")
}

## combine all activity class labels and convert to a convenient numeric format
y.all = c(as.numeric(y.train[[1]]), as.numeric(y.test[[1]]))

## combine all measurements in a single data frame
X.all = rbind(X.train, X.test)

## add the features descriptions as column names
feature.names = features[, 2]
colnames(X.all) = feature.names


## extract means and sds of all 561 features
means.and.sds = cbind(Mean=colMeans(all.data), SD = apply(all.data, 2, sd))
write.csv(means.and.sds, file="means.and.sds.txt")

## combine all of the data including activity descriptions and subjects 
## in a single data frame and save as a file
all.data = cbind(Activity=descriptive.activity, Subject=subject.all, X.all)
write.csv(all.data, file="all.data.txt")

## combine subject information and convert to numeric format for next step
subject.all = c(as.numeric(subject.train[[1]]), as.numeric(subject.test[[1]]))

## create a sorted list of unique subjects
subject.unique = unique(subject.all)

## create descriptive activity labels from the file provided
descriptive.activity <- sapply(y.all, function(n) activity.labels[n, 2])

## calculate averages of each feature for each activity
activity.means = sapply(feature.names, function(name) {tapply(X.all[, name], y.all, mean)})
n.activities = nrow(activity.means)
colnames(activity.means) = feature.names
activity.means = data.frame(cbind(Class.Type=rep("Activity", n.activities), Identifier=activity.labels[, 2], Statistic="Mean", activity.means))

## calculate averages of each feature for each subject
subject.means = sapply(feature.names, function(name) {tapply(X.all[, name], subject.all, mean)})
colnames(subject.means) = feature.names
n.subjects = nrow(subject.means)
subject.means = data.frame(cbind(Class.Type=rep("Subject", n.subjects), Identifier=subject.unique, Statistic="Mean", subject.means))

## calculate standard deviation of each feature for each activity
activity.sds = sapply(feature.names, function(name) {tapply(X.all[, name], y.all, sd)})
colnames(activity.sds) = feature.names
activity.sds = data.frame(cbind(Class.Type=rep("Activity", n.activities), Identifier=activity.labels[, 2], Statistic="SD", activity.sds))

## calculate standard deviation of each feature for each subject
subject.sds = sapply(feature.names, function(name) {tapply(X.all[, name], subject.all, sd)})
colnames(subject.sds) = feature.names
subject.sds = data.frame(cbind(Class.Type=rep("Subject", n.subjects), Identifier=subject.unique, Statistic="SD", subject.sds))

## finally combine all the means and SDs into a single file
all.means.and.sds = merge(activity.means, merge(subject.means, merge(activity.sds, subject.sds, all=T), all=T), all=T)
all.means.and.sds = all.means.and.sds[order(all.means.and.sds$Class.Type, all.means.and.sds$Identifier),]
write.table(all.means.and.sds, file="all.means.and.sds.txt")
