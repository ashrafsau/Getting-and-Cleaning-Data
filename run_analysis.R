setwd("P:\\Coursera\\Getting and Cleaning Data")
options(stringsAsFactors = F)

X_test<-read.table(file=".\\UCI HAR Dataset\\test\\X_test.txt")
X_train<-read.table(file=".\\UCI HAR Dataset\\train\\X_train.txt")

y_test<-read.table(file=".\\UCI HAR Dataset\\test\\y_test.txt")
y_train<-read.table(file=".\\UCI HAR Dataset\\train\\y_train.txt")


#1 Merges the training and the test sets to create one data set.
X<-rbind(X_train,X_test)
y<-rbind(y_train,y_test)

rm(list=c("X_train","X_test","y_train","y_test"))

#2 Extracts only the measurements on the mean and standard deviation for each measurement. 
features<-read.table(".\\UCI HAR Dataset\\features.txt")
f<-which(grepl("mean\\(\\)|std\\(\\)",features$V2))

X<-X[f]

#3 Uses descriptive activity names to name the activities in the data set
activity_labels<-read.table(".\\UCI HAR Dataset\\activity_labels.txt")
y<-activity_labels$V2[y$V1]


#4 Appropriately labels the data set with descriptive variable names.
colnames(X)<-features$V2[f]


#5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject
subject_train<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
subject_test<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
subject<-c(subject_train$V1,subject_test$V1)

df<-cbind(X,y,subject)
tidy<-aggregate(x = df, by = list(y, subject), FUN = "mean")
tidy<-tidy[,1:68]
colnames(tidy)[c(1,2)]<-c("activity","subject")

write.table(x=tidy,file="tidy.txt",row.names=F)
