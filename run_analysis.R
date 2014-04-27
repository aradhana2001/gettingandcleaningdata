```r
## Assuming we are in the folder "get&cleanData/UCI HAR Dataset"
## Step1: Load the training set and the test set
parentDirectory<-getwd()
setwd("train")
Xtrain<-read.table("X_train.txt")
ytrain<-read.table("y_train.txt")
subjecttrain<-read.table("subject_train.txt")

setwd(parentDirectory)
setwd("test")
Xtest<-read.table("X_test.txt")
ytest<-read.table("y_test.txt")
subjecttest<-read.table("subject_test.txt")

## Step2: Merge the training and the test sets to create one data set
Xmerged<-rbind(Xtrain,Xtest)
ymerged<-rbind(ytrain,ytest)
subjectmerged<-rbind(subjecttrain,subjecttest)

## Step3:  Extract only the mean and standard deviation for each measurement. 
##         Rename the columns'names using descriptive measurements.
setwd(parentDirectory)
features<-read.table("features.txt")
# Get the string mean and std
toMatch<-c(".*mean\\(\\).*",".*std\\(\\).*") 
# Get the indices of those strings in features
indexMatch<-grep(paste(toMatch,collapse="|"), features$V2)
# Extract X's columns related to mean and std
Xextracted<-Xmerged[,indexMatch]
colnames(Xextracted)<-features$V2[indexMatch]

## Step4:  Uses descriptive activity names to name the activities in the data set
## In other words, renames y as "WALKING, WALKING_UPSTAIRS,..."
setwd(parentDirectory)
actlabel<-read.table("activity_labels.txt")
actlabel$V2 = factor(x=actlabel$V2, levels=actlabel$V2)
descriptivelabel<-actlabel$V2[ymerged[,]]


## Step5: Creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject. dim(newdata) = 10299*69, dim(tidydata) = 180*69
newdata<-cbind(subjectmerged,descriptivelabel,Xextracted)
colnames(newdata)<-c("subject","descriptiveactivity",colnames(Xextracted))

library(data.table)
myDT<-data.table(newdata)
tidydata<-myDT[,lapply(.SD,mean),by=paste(subject,"&" ,descriptiveactivity)]
setnames(tidydata,"paste","subject & activity")

```
