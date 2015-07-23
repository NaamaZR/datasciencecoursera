# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names.
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of 
#    each variable for each activity and each subject.

## Working on Win7 64 bit, running R-3.2.1 32 bit, since Java on my computer is 32 bit

remove(list=ls())
# install.packages("xlsx")  
# install.packages("rJava") 
library(xlsx)
library(rJava)

##################################
##  step 0:  fetching  data     ##
##################################
# download and unzip only if not at wd
if(file.exists("./UCI HAR Dataset")){
      strWD <- getwd()
      dest <- gsub("/", "\\", strWD, fixed=TRUE)
      temp <- paste(dest, "\\", sep="")
      XTest = read.table( paste(temp,  "UCI HAR Dataset\\test\\x_test.txt"  , sep="") )
      YTest = read.table( paste(temp,  "UCI HAR Dataset\\test\\y_test.txt"  , sep="") )#1:6
      SubTest = read.table( paste(temp,  "UCI HAR Dataset\\test\\subject_test.txt"  , sep=""))
      XTrain = read.table( paste(temp,  "UCI HAR Dataset\\train\\x_train.txt"  , sep="") )
      YTrain = read.table( paste(temp,  "UCI HAR Dataset\\train\\y_train.txt"  , sep="") )#1:6
      SubTrain = read.table( paste(temp,  "UCI HAR Dataset\\train\\subject_train.txt"  , sep=""))
      Feat = read.table( paste(temp,  "UCI HAR Dataset\\features.txt"  , sep=""))

} else {

      fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      # dest should be wd
      temp <- tempfile()
      strWD <- getwd() #"F:/DataScientist/RWD"
      dest <- gsub("/", "\\", strWD, fixed=TRUE)
      download.file(fileUrl,temp)
      file.copy(temp, dest)
      oldtemp <- temp
      s2 <- unlist(strsplit(temp,"file"))[2]
      newtemp <- paste(dest, "\\file", s2, sep="")
      temp <-   newtemp  
      unlink(oldtemp)  
      
      XTest = read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt")) #561 measures
      YTest = read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt")) #1:6
      SubTest = read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt")) #1:30
      XTrain = read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt")) #561 measures
      YTrain = read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt")) #1:6
      SubTrain = read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt")) #1:30
      Feat = read.table(unz(temp, "UCI HAR Dataset/features.txt")) # 561 vars names
      unlink(temp)
}

##  short summary:
## 30 people, 6 activites, 561 vecotrs of measures
##  Variables: XTest, YTest, SubTest, XTrain, YTrain, SubTrain

#######################################
##  step 1: Mergeing sets            ##
#######################################
colnames(XTrain)
colnames(XTrain) <- t(Feat[2])
colnames(XTest)  <- t(Feat[2])

#paste columns to the right
XTest$Activity <- YTest[,1]
XTest$Subject <- SubTest[,1]
dim(XTest) 
class(XTest) #data.frame
XTrain$Activity <- YTrain[,1]
XTrain$Subject <- SubTrain[,1]
dim(XTrain) 
class(XTrain) #data.frame

#check  before combine sets.
setdiff(names(XTrain), names(XTest))
setdiff(names(XTest), names(XTrain))
all(names(XTrain) == names(XTest))

# one dataframe is glued under the other
X <- rbind(XTrain, XTest)
dim(X)  #10299 x 563


X <- X[, !duplicated(colnames(X) )]
dim(X) 


#############################################################################################################
##    step 2: Extracts only the measurements on the mean and standard deviation for each measurement.      ##
#############################################################################################################
sNames <- names(X)
class(sNames)
length(sNames)

text1 <- "mean"
test2 <- "std"
test3 <- "Mean"
vec = NULL

#scan col names and look if see "mean", "std", or "Mean", keep indecies at vec
for (ind in 1:length(sNames)) 
{
      myStr <- sNames[ind]
      if (grepl(text1, myStr) |  grepl(test2, myStr)  |  grepl(test3, myStr))
      {
           vec = c(vec, ind); 
      }                         
}


dim(X)
EData <- X[,vec]; #Extracted Data  mean, std on measurments
dim(EData) #10299 x 86


###########################################################################################
##  step 3: Uses descriptive activity names to name the activities in the data set       ##
###########################################################################################
# 
vecAct <- c("Walking", "Walking Upstaris", "Walking Downstairs", "Sitting", "Standing", "Laying")
# identify which are the "pointer" to each index 1..6, and replace by the explict name
for (ind in 1:6) #last two coloumns I know its not about mean or std
{
      X$Activity[X$Activity == ind]  <- vecAct[ind]                    
}
class(X$Activity)
length(unique(X$Activity))


#####################################################################################
##  step 4: Appropriately labels the data set with descriptive variable names      ##
#####################################################################################
sNames <-  names(X)
sNames
#get rid of parenthesis that souldn't be as part of a name, on my opinion
#also make some fixes e.g. mad for median is not clear , and more.
for (ind in 1:length(sNames)) 
{
      myStr <- sNames[ind]
      myStr1 <-  sub("\\)" ,"", myStr)
      myStr2 <-  sub("\\(" ,"", myStr1)  
      myStr21 <-  sub("-Z" ,"Z", myStr2)
      myStr22 <-  sub("-Y" ,"Y", myStr21)
      myStr3 <-  sub("-X" ,"X", myStr22)
      myStr31 <-  sub(",Z" ,"Z", myStr3)
      myStr32 <-  sub(",Y" ,"Y", myStr31)
      myStr3 <-  sub(",X" ,"X", myStr32)
      myStr4 <-  sub("-" ,"", myStr3)  
      myStr5 <-  sub("mean" ,"Mean", myStr4)  
      myStr6 <-  sub("max" ,"Max", myStr5)
      myStr7 <-  sub("kurto" ,"Kurto", myStr6) 
      myStr8 <-  sub("meanFreq" ,"Mean", myStr7)  
      myStr9 <-  sub("iqr" ,"IQR", myStr8)
      myStr10 <-  sub("min" ,"Min", myStr9) 
      myStr11 <-  sub("std" ,"STD", myStr10)  
      myStr12 <-  sub("mad" ,"Median", myStr11)
      myStr13 <-  sub("sma" ,"SMA", myStr12)
      myStr14 <-  sub("energy" ,"Energy", myStr13) 
      ## more parenthesis are there, uneven
      myStr15 <-  sub("\\)" ,"", myStr14)
      myStr16 <-  sub("\\(" ,"", myStr15)  
      myStrF <-  sub("\\,g" ,"g", myStr16)  
      sNames[ind] <-  myStrF
}
sNames
#####################################################################################
##  step 5: From the data set in step 4, creates a second, independent tidy data   ## 
##  set with the average of each variable for each activity and each subject.      ##                                                       ##
#####################################################################################
library(data.table)     
X.dt <- data.table(X)
class(X.dt)  
TidyData <- X.dt[, lapply(.SD, mean), by = 'Subject,Activity']
dim(TidyData)
#Check by claculating from X to compare with TidyData
ptrs <-  which(X[, 479]== 1 & X[, 478]== "Standing" )
var1 <-X[ptrs, 1]
mean(var1)
var2 <-X[ptrs, 2]
mean(var2)
var3 <-X[ptrs, 3]
mean(var3)


## get ready to upload
# write.table(TidyData, file = "TidyDataNRubin.txt", row.name=FALSE)
# help(write.table)
