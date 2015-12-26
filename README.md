#Scripts

The first steps for the script are installing the "tidyr" and "dplyr" packages. Then, library is used to load and attach the packages, in order to use their functions.

The first read.table is used to load in the test "subject" data which contains the list of subjects for each observation in the test data. The column header for this dataset is then changed from "V1" to "subject".

The second read.table is used to load in the test "activity" data which contains the list of activities for each observation in the test data. The column header for this dataset is then changed from "V1" to "activity_type".

The third read.table is used to load in the actual observation data for the test set.  The 4th read.table is then used to load in the variable names for ALL data sets.

The next line (names(testdata) <- columnNames$V2) is used to change the column names of the oberservation data to the names loaded in from the 4th read.table.




