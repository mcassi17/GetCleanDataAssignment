#Read Me
To see the full script, please look at run_analysis.R.  To get a description of the variables in this data set, please look at CodeBook.rmd.  The final data set is contained in the summaryData.txt file.

#Script Explanation

The first steps for the script are installing the "tidyr" and "dplyr" packages. Then, library is used to load and attach the packages, in order to use their functions.

The first read.table (testsubject) is used to load in the test "subject" data which contains the list of subjects for each observation in the test data. The column header for this dataset is then changed from "V1" to "subject".

The second read.table (testactivity) is used to load in the test "activity" data which contains the list of activities for each observation in the test data. The column header for this dataset is then changed from "V1" to "activity_type".

The third read.table (testdata) is used to load in the actual observation data for the test set.  The 4th read.table (columnNames) is then used to load in the variable names for ALL data sets.

The next line (names(testdata) <- columnNames$V2) is used to change the column names of the oberservation data to the names loaded in from the 4th read.table.

The next two lines use the cbind function to append the testsubject and testactivity data to the test data to form the full table of observations, subjects, and activities.

The fifth read.table (trainsubject) is used to load in the test "subject" data which contains the list of subjects for each observation in the training data. The column header for this dataset is then changed from "V1" to "subject".

The second read.table (trainactivity) is used to load in the test "activity" data which contains the list of activities for each observation in the training data. The column header for this dataset is then changed from "V1" to "activity_type".

The third read.table (traindata) is used to load in the actual observation data for the train set.

The next line (names(traindata) <- columnNames$V2) is used to change the column names of the oberservation data to the names loaded in from the 4th read.table.

The next two lines use the cbind function to append the trainsubject and trainactivity data to the training data to form the full table of observations, subjects, and activities.

The next line [totaldata <- rbind(testdata, traindata)] uses rbind to combine the test and train data sets created in the steps above.

The following line removes the duplicated column names in the totaldata and stores the new data set in cleandata.

The next four lines use the select function to get the column names that have mean, std, subject, and activity_type.  From there the cbind function is used to combine the 4 sets of data to form finalfulldata.

The next 6 lines change the values 1, 2, 3, 4, 5, and 6 to Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying.

Select is used again to select the columns that do not contain "Freq" or "angle".

Next, the group_by function is used to group the data by subject and then by activity_type and this is stored in groupedData.

The last line of the script uses the summarize_each function to get the mean of each column in the groupedData data set.  This is the final data set and the set that is in this directory (summaryData.txt).









