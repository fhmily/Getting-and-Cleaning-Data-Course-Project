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

## Data Manual

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
