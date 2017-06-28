# install (if missing) and load library by name
loadLibrary <- function (lib_name) {
    if(!require(lib_name, character.only = TRUE)){
        install.packages(lib_name)
    }

    library(lib_name, character.only = TRUE)
}

# need fread from data.table
loadLibrary('data.table')

# data set directory path
DATA_DIR <- 'UCI'

# internal function for merging two data files
mergeDataFiles <- function (path1, path2) {
    # read data files into data tables
    dt1 <- fread(path1)
    dt2 <- fread(path2)

    # merge two data tables into one
    rbind(dt1, dt2)
}

# merge train and test feature data files
MergeFeatureDTs <- function () {
    mergeDataFiles(
                   file.path(DATA_DIR, 'test', 'X_test.txt'),
                   file.path(DATA_DIR, 'train', 'X_train.txt')
                   )
}

# merge train and test activity label data files
MergeActivityDTs <- function () {
    mergeDataFiles(
                   file.path(DATA_DIR, 'test', 'y_test.txt'),
                   file.path(DATA_DIR, 'train', 'y_train.txt')
                   )
}

# merge train and test activity label data files
MergeSubjectDTs <- function () {
    mergeDataFiles(
                   file.path(DATA_DIR, 'test', 'subject_test.txt'),
                   file.path(DATA_DIR, 'train', 'subject_train.txt')
                   )
}

# merge features, activity labels, subject data set into one
# and name them accordingly
MergeAllDTs <- function (featureDT, activityDT, subjectDT) {
    sourceDT <- featureDT

    # read features.txt to name featureDT variables
    featureFile <- file.path(DATA_DIR, 'features.txt')
    features <- fread(featureFile)

    names(sourceDT) <- features$V2

    # append activity and subject
    sourceDT[['activity_label']] <- activityDT$V1
    sourceDT[['subject']] <- subjectDT$V1

    sourceDT
}

# name activity using activity_labels.txt
NameActivities <- function (allDT) {
    sourceDT <- allDT

    labelFile <- file.path(DATA_DIR, 'activity_labels.txt')
    labels <- fread(labelFile)

    sourceDT[['activity_name']] <- labels[match(sourceDT$activity_label, labels$V1), 2][[1]]

    sourceDT
}

# aggregate report on subject & activity with mean on all others
AggregateReport <- function (dt) {
    dt[, lapply(.SD,mean), by=list(subject, activity_label, activity_name)]
}

# invoke functions and save results to global scope variables

# subject 1
featureDT <- MergeFeatureDTs()
activityDT <- MergeActivityDTs()
subjectDT <- MergeSubjectDTs()

allDT <- MergeAllDTs(featureDT, activityDT, subjectDT)

# subject 2
partialDT <- ExtractMeanStd(allDT)

# subject 3
actNamedAllDT <- NameActivities(allDT)

# subject 4
allNamedDT <- actNamedAllDT

# subject 5
reportDT <- AggregateReport(allNamedDT)
