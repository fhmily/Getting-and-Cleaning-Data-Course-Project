# Getting and Cleaning Data Course Project

This is a Coursera assignment project of Getting and Cleaning Data Course in week4.

### Project Goal
The Goal of this repo is to fullfill requirements of a Coursera [assignment](project-requirement.md).

### How to run the code

#### prepare the data
As the uncompressed data set for this project is over 200MB. I'll not include them in this repository. Please download them from [data set zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Please the uncompressed the downloaded zip file and rename its top level directory to 'UCI'. Then put it into the project folder.

The final working directory structure should look like below:

```
├── README.md
├── CodeBook.md
├── UCI
│   ├── README.txt
│   ├── activity_labels.txt
│   ├── features.txt
│   ├── features_info.txt
│   ├── test
│   │   ├── Inertial\ Signals
│   │   │   ├── body_acc_x_test.txt
│   │   │   ├── body_acc_y_test.txt
│   │   │   ├── body_acc_z_test.txt
│   │   │   ├── body_gyro_x_test.txt
│   │   │   ├── body_gyro_y_test.txt
│   │   │   ├── body_gyro_z_test.txt
│   │   │   ├── total_acc_x_test.txt
│   │   │   ├── total_acc_y_test.txt
│   │   │   └── total_acc_z_test.txt
│   │   ├── X_test.txt
│   │   ├── subject_test.txt
│   │   └── y_test.txt
│   └── train
│       ├── Inertial\ Signals
│       │   ├── body_acc_x_train.txt
│       │   ├── body_acc_y_train.txt
│       │   ├── body_acc_z_train.txt
│       │   ├── body_gyro_x_train.txt
│       │   ├── body_gyro_y_train.txt
│       │   ├── body_gyro_z_train.txt
│       │   ├── total_acc_x_train.txt
│       │   ├── total_acc_y_train.txt
│       │   └── total_acc_z_train.txt
│       ├── X_train.txt
│       ├── subject_train.txt
│       └── y_train.txt
├── project-requirement.md
└── run_analysis.R
```

#### Run the code
1. Set R's working directory to the project folder
2. Invoke the run_analysis.R script
    ```
    source('run_analysis.R')
    ```
3. The processed data sets will be left in global scope as described in [CodeBook](CodeBook.md)
