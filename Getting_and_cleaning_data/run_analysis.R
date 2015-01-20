run_analysis <- function()
{
  #read files
  
  colNames <- read.table("UCI HAR Dataset\\features.txt");
  activityLableMap <- read.table("UCI HAR Dataset\\activity_labels.txt");
  
  test_readings <- read.table("UCI HAR Dataset\\test\\X_test.txt");
  test_activity_labels <- read.table("UCI HAR Dataset\\test\\y_test.txt");
  test_subjects <- read.table("UCI HAR Dataset\\test\\subject_test.txt");
  
  train_readings <- read.table("UCI HAR Dataset\\train\\X_train.txt");
  train_activity_labels <- read.table("UCI HAR Dataset\\train\\y_train.txt");
  train_subjects <- read.table("UCI HAR Dataset\\train\\subject_train.txt");
  
  #Extract mean and sd
  
  #merge all 3 data of test
  #merge all 3 data of training
  
  #merge test and training
  
  
  #apply labels
  
  #Take averages
}