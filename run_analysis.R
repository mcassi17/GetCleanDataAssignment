install.packages("dplyr")
install.packages("tidy")
library(dplyr)
library(tidyr)

testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(testsubject)[names(testsubject)=="V1"] <- "subject"

testactivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
names(testactivity)[names(testactivity)=="V1"] <- "activity_type"

testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
columnNames <- read.table("./UCI HAR Dataset/features.txt")

names(testdata) <- columnNames$V2

testdata <- cbind(testactivity, testdata)
testdata <- cbind(testsubject, testdata)

trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(trainsubject)[names(trainsubject)=="V1"] <- "subject"

trainactivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
names(trainactivity)[names(trainactivity)=="V1"] <- "activity_type"

traindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(traindata) <- columnNames$V2

traindata <- cbind(trainactivity, traindata)
traindata <- cbind(trainsubject, traindata)

totaldata <- rbind(testdata, traindata)

cleantotaldata <- totaldata[, !duplicated(colnames(totaldata))]

stddata <- select(cleantotaldata, contains("std"))
meandata <- select(cleantotaldata, contains("mean"))
subject <- select(cleantotaldata, contains("subject"))
activity <- select(cleantotaldata, contains("activity_type"))

finalfulldata <- cbind(subject, activity)
finalfulldata <- cbind(finalfulldata, meandata)
finalfulldata <- cbind(finalfulldata, stddata)

finalfulldata$activity_type[finalfulldata$activity_type == 1] <- "Walking"
finalfulldata$activity_type[finalfulldata$activity_type == 2] <- "Walking Upstairs"
finalfulldata$activity_type[finalfulldata$activity_type == 3] <- "Walking Downstairs"
finalfulldata$activity_type[finalfulldata$activity_type == 4] <- "Sitting"
finalfulldata$activity_type[finalfulldata$activity_type == 5] <- "Standing"
finalfulldata$activity_type[finalfulldata$activity_type == 6] <- "Laying"

finalfulldata <- select(finalfulldata, -contains("angle"))
finalfulldata <- select(finalfulldata, -contains("Freq"))

groupedData <- group_by(finalfulldata, subject, activity_type)
summaryData <- summarise_each(groupedData, funs(mean))