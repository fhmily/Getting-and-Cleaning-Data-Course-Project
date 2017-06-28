CodeBook for the project
========================

### Subject1

Merges the training and the test sets to create one data set

1. Merge test & train feature data sets from test/X_test.txt & train/X_train.txt.
    ```
    # 561 variables
    featureDT <- MergeFeatureDTs()
    ```
2. Merge test & train activity label data sets from test/y_test.txt & train/y_train.txt
    ```
    # 1 variable
    activityDT <- MergeActivityDTs()
    ```
3. Merge test & train subject data sets from test/subject_test.txt & train/subject_train.txt
    ```
    # 1 variable
    subjectDT <- MergeSubjectDTs()
    ```
4. Merge feature, activity label, subject data with order into one data table. And named accordingly.
    ```
    # variables 1-561: features data. Named after features.txt
    # variables   562: activity data. Named as 'activity_label'
    # variables   563: subject data. Named as 'subject'
    allDT <- MergeAllDTs(featureDT, activityDT, subjectDT)
    ```

### Subject2

Extracts only the measurements on the mean and standard deviation for each measurement.

1. As datas have already been named in step one, just do as requested.
    ```
    partialDT <- ExtractMeanStd(allDT)
    ```

### Subject3

Uses descriptive activity names to name the activities in the data set

1. Read activity label names from activity_labels.txt
2. Add a new variable 'activity_name' to allDT
    ```
    actNamedAllDT <- NameActivities(allDT)
    ```

### Subject4
Appropriately labels the data set with descriptive variable names.

1. Already Done in step 1, so just use actNamedAllDT
    ```
    allNamedDT <- actNamedAllDT
    ```

### Subject5
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

1. aggregate on (subject, activity_label, activity_name) with mean on all other variables
    ```
    reportDT <- AggregateReport(allNamedDT)
    ```
