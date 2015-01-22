run_analysis <- function()
{
  source("run_analysis_functions.R")
  #read files
  colNames <- read.table("UCI HAR Dataset\\features.txt");
  activityLabelMap <- read.table("UCI HAR Dataset\\activity_labels.txt");
  
  test_readings <- read.table("UCI HAR Dataset\\test\\X_test.txt");
  test_activity_id <- read.table("UCI HAR Dataset\\test\\y_test.txt");
  test_subjects <- read.table("UCI HAR Dataset\\test\\subject_test.txt");
  
  train_readings <- read.table("UCI HAR Dataset\\train\\X_train.txt");
  train_activity_id <- read.table("UCI HAR Dataset\\train\\y_train.txt");
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
  test_activity_vector <-as.vector(test_activity_id[[1]]);
  test_subjects_vector <- as.vector(test_subjects[[1]]);
  test_readings_mean_sd$act_id <-test_activity_vector;
  test_readings_mean_sd$sub_id <- test_subjects_vector;
  
  #merge all 3 data of training
  
  train_activity_vector <-as.vector(train_activity_id[[1]]);
  train_subjects_vector <- as.vector(train_subjects[[1]]);
  train_readings_mean_sd$act_id <-train_activity_vector;
  train_readings_mean_sd$sub_id <- train_subjects_vector;
  
  #merge test and training
  
  all_readings <- rbind(train_readings_mean_sd,test_readings_mean_sd);
  
  #remove unnecessary objects
  rm(test_activity_vector,test_subjects_vector,test_activity_id,test_subjects,test_readings_mean_sd);
  rm(train_activity_vector,train_subjects_vector,train_activity_id,train_subjects,train_readings_mean_sd);
  
  
  #apply activity labels
  
  names(activityLabelMap) <- c("act_id" , "activity_name")
  all_readings_with_actLabel <- merge(all_readings,activityLabelMap);
  applyPrettyNames(all_readings_with_actLabel);

  
  #Take averages
  
  tidy_data_averages <- aggregate(all_readings_with_actLabel,by=list(all_readings_with_actLabel$activity_name,all_readings_with_actLabel$sub_id),mean)
  print(dim(tidy_data_averages))
}