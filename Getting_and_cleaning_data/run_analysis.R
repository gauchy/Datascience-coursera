run_analysis <- function()
{
  source("run_analysis_functions.R")
  #read files
  print("Reading data set")
  colNames <- read.table("UCI HAR Dataset\\features.txt");
  activityLabelMap <- read.table("UCI HAR Dataset\\activity_labels.txt");
  
  test_readings <- read.table("UCI HAR Dataset\\test\\X_test.txt");
  test_activity_id <- read.table("UCI HAR Dataset\\test\\y_test.txt");
  test_subjects <- read.table("UCI HAR Dataset\\test\\subject_test.txt");
  
  train_readings <- read.table("UCI HAR Dataset\\train\\X_train.txt");
  train_activity_id <- read.table("UCI HAR Dataset\\train\\y_train.txt");
  train_subjects <- read.table("UCI HAR Dataset\\train\\subject_train.txt");
  

  #apply colnames
  print("applying column names")
  names(test_readings) <- as.vector(colNames[[2]]);
  names(train_readings) <- as.vector(colNames[[2]]);
  
  #Extract mean and sd
  print("extracting mean and sd columns")
  test_readings_mean_sd <- extractMeanSD(test_readings);
  train_readings_mean_sd <- extractMeanSD(train_readings);
  
  #remove unnecessary objects
  print("removing unnecessary objects")
  rm(test_readings,train_readings,colNames)
  
  #merge all 3 data of test
  print("merging test data");
  test_activity_vector <-as.vector(test_activity_id[[1]]);
  test_subjects_vector <- as.vector(test_subjects[[1]]);
  test_readings_mean_sd$act_id <-test_activity_vector;
  test_readings_mean_sd$sub_id <- test_subjects_vector;
  
  #merge all 3 data of training
  print("merging training data");
  train_activity_vector <-as.vector(train_activity_id[[1]]);
  train_subjects_vector <- as.vector(train_subjects[[1]]);
  train_readings_mean_sd$act_id <-train_activity_vector;
  train_readings_mean_sd$sub_id <- train_subjects_vector;
  
  #merge test and training
  print("merging test and training data");
  all_readings <- rbind(train_readings_mean_sd,test_readings_mean_sd);
  
  #remove unnecessary objects
  print("removing unnecessary objects");
  rm(test_activity_vector,test_subjects_vector,test_activity_id,test_subjects,test_readings_mean_sd);
  rm(train_activity_vector,train_subjects_vector,train_activity_id,train_subjects,train_readings_mean_sd);
  
  
  #apply activity labels
  print("applying acitivity labels");
  names(activityLabelMap) <- c("act_id" , "activity_name")
  all_readings_with_actLabel <- merge(all_readings,activityLabelMap);
  
  #pretty names
  print("Apply descriptive names");
  names(all_readings_with_actLabel) <- applyPrettyNames(all_readings_with_actLabel);

  
  #Take averages
  print("taking averages");
  tidy_data_averages <- aggregate(all_readings_with_actLabel[,c(2:67)],by=list(activity_name=all_readings_with_actLabel$activity_name,subject=all_readings_with_actLabel$sub_id),mean)
  
  #Write to file
  print("writing to file");
  write.table(tidy_data_averages,file="tidy_data.txt",row.names=FALSE);
  
}