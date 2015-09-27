# Download the data from source

    filename <- "getdata-projectfiles-UCI HAR Dataset.zip"


    if (!file.exists(filename)){
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
      download.file(fileURL, filename, method="libcurl")
    }  
    if (!file.exists("getdata-projectfiles-UCI HAR Dataset")) { 
  
    # Extract to current environment
      unzip(filename) 
    }


## Solution for 1. Merge the training and the test sets in batches to create individual data sets on 'Subjects', 'Labels' and 'Features'. 

    ##Read individual files of each group from Train and Test sets

      TrainSet <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
      TestSet <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
      DataMergeOnFeat <- rbind(TestSet , TrainSet)

      TrainLabels <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", colClasses = c("factor"), col.names=c("ActivityName"))
      TestLabels <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", colClasses = c("factor"), col.names=c("ActivityName"))
      DataMergeonLabels <- rbind(TrainLabels, TestLabels)

      TrainSubject <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", col.names=c("Subject"))
      TestSubject <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", col.names=c("Subject"))
      DataMergeonSubject <- rbind(TrainSubject, TestSubject)


# Solution to 2. Extract only the measurements on the mean and standard deviation for each measurement.
      Feat <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt" )

      
    ## Two patterns are selected - 1. .*-mean (),*/.*-std ().* 2. .*-mean{Some other parameter name- E.g Freq} (),*/.*-stdmean{Some other parameter name- E.g Freq} ().*
      FeatSelect <- Feat[grep("-mean.*|-std.*", Feat[, 2]), ]


# Solution to 3. Use descriptive activity names to name the activities in the data set
    ## Performedon on the 'Label' merged set

      ActLabels <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", col.names=c("Id", "ActivityName"))
      levels(DataMergeonLabels$ActivityName) <- ActLabels$ActivityName

# Solution to 4. Appropriately label the data set with descriptive variable names. 
      
    ## Column Labels on 'Feature' Subset
      DataMergeFeature <- DataMergeOnFeat[, FeatSelect[, 1]]
      FeatLabels <- gsub("\\(", "",
                      gsub("\\)", "",
                        gsub("-", "",
                          gsub("mean", "Mean",
                            gsub("std", "Std",FeatSelect[, 2])))))

    ## Column Labels on 'Labels' Subset
      names(DataMergeFeature) <- FeatLabels
      
    ## Column Labels on 'Subject' Subset is taken care of while merging 
    ## the test and train sets in solution 1. itself

    ## Finally Merge all three subsets
      
      FinalDataMerge= cbind(DataMergeonSubject, DataMergeonLabels, DataMergeFeature)

      
# Solution to 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

    library(dplyr)
      TidySet <- FinalDataMerge %>%
          group_by(Subject, ActivityName) %>%
          arrange(Subject) %>%
          summarise_each(funs(mean))
      
# Creates the 'TidyDataSet.txt' file with final clean data set

    write.table(TidySet, file = "TidyDataSet.txt", row.names = FALSE)
