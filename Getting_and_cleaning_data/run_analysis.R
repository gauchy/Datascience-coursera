run_analysis <- function()
{
  source("run_analysis_functions.R")
  #read files
  colNames <- read.table("UCI HAR Dataset\\features.txt");
  activityLabelMap <- read.table("UCI HAR Dataset\\activity_labels.txt");
  
  test_readings <- read.table("UCI HAR Dataset\\test\\X_test.txt");
  test_activity_labels <- read.table("UCI HAR Dataset\\test\\y_test.txt");
  test_subjects <- read.table("UCI HAR Dataset\\test\\subject_test.txt");
  
  train_readings <- read.table("UCI HAR Dataset\\train\\X_train.txt");
  train_activity_labels <- read.table("UCI HAR Dataset\\train\\y_train.txt");
  train_subjects <- read.table("UCI HAR Dataset\\train\\subject_train.txt");
  

  #apply colnames
  names(test_readings) <- as.vector(colNames[[2]]);
  names(train_readings) <- as.vector(colNames[[2]]);
  
  #Extract mean and sd
  test_readings_mean_sd <- extractMeanSD(test_readings);
  train_readings_mean_sd <- extractMeanSD(train_readings);
  
  #remove unnecessary objects
  rm(test_readings,train_readings,colNames)
  
  #merge all 3 data of test
  
  #merge all 3 data of training
  
  #merge test and training
  
  
  #apply labels
  
  #Take averages
}