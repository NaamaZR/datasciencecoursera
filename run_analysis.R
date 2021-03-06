# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names.
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of 
#    each variable for each activity and each subject.

## Working on Win7 64 bit, running R-3.2.1 32 bit, since Java on my computer is 32 bit
## This code check if folder "UCI HAR Dataset" is at wd, if not it will download data.

############################
###    by  Naama Rubin   ###
############################

remove(list=ls())
# install.packages("xlsx")  
# install.packages("rJava") 
# install.packages("data.table")
library(xlsx)
library(rJava)
library(data.table)

##################################
##  step 0:  fetching  data     ##
##################################
# download & unzip only if not at wd
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

#Collect indecis for columns with name that contain either of  the next 3 texts
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
vecAct <- c("Walk", "WalkUpS", "WakDn", "Sit", "Stand", "Lay")
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
  myStr9 <-  sub("iqr" ,"Iqr", myStr8)
  myStr10 <-  sub("min" ,"Min", myStr9) 
  myStr11 <-  sub("std" ,"Std", myStr10)  
  myStr12 <-  sub("mad" ,"Med", myStr11)
  myStr13 <-  sub("sma" ,"Sma", myStr12)
  myStr14 <-  sub("energy" ,"Er", myStr13) 
  ## more parenthesis are there, uneven
  myStr15 <-  sub("\\)" ,"", myStr14)
  myStr16 <-  sub("\\(" ,"", myStr15)  
  myStr17 <-  sub("\\,g" ,"g", myStr16) 
  
  myStr18 <-  sub("Body" ,"Bd", myStr17) 
  myStr19 <-  sub("Body" ,"Bd", myStr18) 
  myStr20 <-  sub("Gravity" ,"Grv", myStr19)
  myStr21 <-  sub("gravity" ,"Grv", myStr20)
  myStr22 <-  sub("angle" ,"Ang", myStr21)
  myStr23 <-  sub("correlation" ,"Cor", myStr22)
  myStrF <-  sub("entropy" ,"Entropy", myStr23)

  
  sNames[ind] <-  myStrF
}

names(X) <- sNames
#####################################################################################
##  step 5: From the data set in step 4, creates a second, independent tidy data   ## 
##  set with the average of each variable for each activity and each subject.      ##                                                       ##
##################################################################################### 
dim(X) 
X.dt <- data.table(X)
class(X.dt)  
dim(X.dt)

TidyData <- X.dt[, lapply(.SD, mean), by = 'Subject,Activity']
setkey(TidyData,Subject)  #sort by subject

dim(TidyData)
#Check by claculating from X to compare with TidyData
# ptrs <-  which(X[, 479]== 1 & X[, 478]== "Stand" ) #first subject, first ativity
# var1 <-X[ptrs, 1]
# (mean(var1) == TidyData[1][[3]])


write.table(TidyData, file = "TidyDataNRubin4.txt", sep=" ", quote=F, eol = "\n", row.name=FALSE)


#RB <- read.table("TidyDataNRubin4.txt",header=TRUE) 
#RB




# ## cols names
# [1] "Subject"                     "Activity"                    "tBdAccMeanX"                
# [4] "tBdAccMeanY"                 "tBdAccMeanZ"                 "tBdAccStdX"                 
# [7] "tBdAccStdY"                  "tBdAccStdZ"                  "tBdAccMedX"                 
# [10] "tBdAccMedY"                  "tBdAccMedZ"                  "tBdAccMaxX"                 
# [13] "tBdAccMaxY"                  "tBdAccMaxZ"                  "tBdAccMinX"                 
# [16] "tBdAccMinY"                  "tBdAccMinZ"                  "tBdAccSma"                  
# [19] "tBdAccErX"                   "tBdAccErY"                   "tBdAccErZ"                  
# [22] "tBdAccIqrX"                  "tBdAccIqrY"                  "tBdAccIqrZ"                 
# [25] "tBdAccEntropyX"              "tBdAccEntropyY"              "tBdAccEntropyZ"             
# [28] "tBdAccarCoeffX,1"            "tBdAccarCoeffX,2"            "tBdAccarCoeffX,3"           
# [31] "tBdAccarCoeffX,4"            "tBdAccarCoeffY,1"            "tBdAccarCoeffY,2"           
# [34] "tBdAccarCoeffY,3"            "tBdAccarCoeffY,4"            "tBdAccarCoeffZ,1"           
# [37] "tBdAccarCoeffZ,2"            "tBdAccarCoeffZ,3"            "tBdAccarCoeffZ,4"           
# [40] "tBdAccCorXY"                 "tBdAccCorXZ"                 "tBdAccCorYZ"                
# [43] "tGrvAccMeanX"                "tGrvAccMeanY"                "tGrvAccMeanZ"               
# [46] "tGrvAccStdX"                 "tGrvAccStdY"                 "tGrvAccStdZ"                
# [49] "tGrvAccMedX"                 "tGrvAccMedY"                 "tGrvAccMedZ"                
# [52] "tGrvAccMaxX"                 "tGrvAccMaxY"                 "tGrvAccMaxZ"                
# [55] "tGrvAccMinX"                 "tGrvAccMinY"                 "tGrvAccMinZ"                
# [58] "tGrvAccSma"                  "tGrvAccErX"                  "tGrvAccErY"                 
# [61] "tGrvAccErZ"                  "tGrvAccIqrX"                 "tGrvAccIqrY"                
# [64] "tGrvAccIqrZ"                 "tGrvAccEntropyX"             "tGrvAccEntropyY"            
# [67] "tGrvAccEntropyZ"             "tGrvAccarCoeffX,1"           "tGrvAccarCoeffX,2"          
# [70] "tGrvAccarCoeffX,3"           "tGrvAccarCoeffX,4"           "tGrvAccarCoeffY,1"          
# [73] "tGrvAccarCoeffY,2"           "tGrvAccarCoeffY,3"           "tGrvAccarCoeffY,4"          
# [76] "tGrvAccarCoeffZ,1"           "tGrvAccarCoeffZ,2"           "tGrvAccarCoeffZ,3"          
# [79] "tGrvAccarCoeffZ,4"           "tGrvAccCorXY"                "tGrvAccCorXZ"               
# [82] "tGrvAccCorYZ"                "tBdAccJerkMeanX"             "tBdAccJerkMeanY"            
# [85] "tBdAccJerkMeanZ"             "tBdAccJerkStdX"              "tBdAccJerkStdY"             
# [88] "tBdAccJerkStdZ"              "tBdAccJerkMedX"              "tBdAccJerkMedY"             
# [91] "tBdAccJerkMedZ"              "tBdAccJerkMaxX"              "tBdAccJerkMaxY"             
# [94] "tBdAccJerkMaxZ"              "tBdAccJerkMinX"              "tBdAccJerkMinY"             
# [97] "tBdAccJerkMinZ"              "tBdAccJerkSma"               "tBdAccJerkErX"              
# [100] "tBdAccJerkErY"               "tBdAccJerkErZ"               "tBdAccJerkIqrX"             
# [103] "tBdAccJerkIqrY"              "tBdAccJerkIqrZ"              "tBdAccJerkEntropyX"         
# [106] "tBdAccJerkEntropyY"          "tBdAccJerkEntropyZ"          "tBdAccJerkarCoeffX,1"       
# [109] "tBdAccJerkarCoeffX,2"        "tBdAccJerkarCoeffX,3"        "tBdAccJerkarCoeffX,4"       
# [112] "tBdAccJerkarCoeffY,1"        "tBdAccJerkarCoeffY,2"        "tBdAccJerkarCoeffY,3"       
# [115] "tBdAccJerkarCoeffY,4"        "tBdAccJerkarCoeffZ,1"        "tBdAccJerkarCoeffZ,2"       
# [118] "tBdAccJerkarCoeffZ,3"        "tBdAccJerkarCoeffZ,4"        "tBdAccJerkCorXY"            
# [121] "tBdAccJerkCorXZ"             "tBdAccJerkCorYZ"             "tBdGyroMeanX"               
# [124] "tBdGyroMeanY"                "tBdGyroMeanZ"                "tBdGyroStdX"                
# [127] "tBdGyroStdY"                 "tBdGyroStdZ"                 "tBdGyroMedX"                
# [130] "tBdGyroMedY"                 "tBdGyroMedZ"                 "tBdGyroMaxX"                
# [133] "tBdGyroMaxY"                 "tBdGyroMaxZ"                 "tBdGyroMinX"                
# [136] "tBdGyroMinY"                 "tBdGyroMinZ"                 "tBdGyroSma"                 
# [139] "tBdGyroErX"                  "tBdGyroErY"                  "tBdGyroErZ"                 
# [142] "tBdGyroIqrX"                 "tBdGyroIqrY"                 "tBdGyroIqrZ"                
# [145] "tBdGyroEntropyX"             "tBdGyroEntropyY"             "tBdGyroEntropyZ"            
# [148] "tBdGyroarCoeffX,1"           "tBdGyroarCoeffX,2"           "tBdGyroarCoeffX,3"          
# [151] "tBdGyroarCoeffX,4"           "tBdGyroarCoeffY,1"           "tBdGyroarCoeffY,2"          
# [154] "tBdGyroarCoeffY,3"           "tBdGyroarCoeffY,4"           "tBdGyroarCoeffZ,1"          
# [157] "tBdGyroarCoeffZ,2"           "tBdGyroarCoeffZ,3"           "tBdGyroarCoeffZ,4"          
# [160] "tBdGyroCorXY"                "tBdGyroCorXZ"                "tBdGyroCorYZ"               
# [163] "tBdGyroJerkMeanX"            "tBdGyroJerkMeanY"            "tBdGyroJerkMeanZ"           
# [166] "tBdGyroJerkStdX"             "tBdGyroJerkStdY"             "tBdGyroJerkStdZ"            
# [169] "tBdGyroJerkMedX"             "tBdGyroJerkMedY"             "tBdGyroJerkMedZ"            
# [172] "tBdGyroJerkMaxX"             "tBdGyroJerkMaxY"             "tBdGyroJerkMaxZ"            
# [175] "tBdGyroJerkMinX"             "tBdGyroJerkMinY"             "tBdGyroJerkMinZ"            
# [178] "tBdGyroJerkSma"              "tBdGyroJerkErX"              "tBdGyroJerkErY"             
# [181] "tBdGyroJerkErZ"              "tBdGyroJerkIqrX"             "tBdGyroJerkIqrY"            
# [184] "tBdGyroJerkIqrZ"             "tBdGyroJerkEntropyX"         "tBdGyroJerkEntropyY"        
# [187] "tBdGyroJerkEntropyZ"         "tBdGyroJerkarCoeffX,1"       "tBdGyroJerkarCoeffX,2"      
# [190] "tBdGyroJerkarCoeffX,3"       "tBdGyroJerkarCoeffX,4"       "tBdGyroJerkarCoeffY,1"      
# [193] "tBdGyroJerkarCoeffY,2"       "tBdGyroJerkarCoeffY,3"       "tBdGyroJerkarCoeffY,4"      
# [196] "tBdGyroJerkarCoeffZ,1"       "tBdGyroJerkarCoeffZ,2"       "tBdGyroJerkarCoeffZ,3"      
# [199] "tBdGyroJerkarCoeffZ,4"       "tBdGyroJerkCorXY"            "tBdGyroJerkCorXZ"           
# [202] "tBdGyroJerkCorYZ"            "tBdAccMagMean"               "tBdAccMagStd"               
# [205] "tBdAccMagMed"                "tBdAccMagMax"                "tBdAccMagMin"               
# [208] "tBdAccMagSma"                "tBdAccMagEr"                 "tBdAccMagIqr"               
# [211] "tBdAccMagEntropy"            "tBdAccMagarCoeff1"           "tBdAccMagarCoeff2"          
# [214] "tBdAccMagarCoeff3"           "tBdAccMagarCoeff4"           "tGrvAccMagMean"             
# [217] "tGrvAccMagStd"               "tGrvAccMagMed"               "tGrvAccMagMax"              
# [220] "tGrvAccMagMin"               "tGrvAccMagSma"               "tGrvAccMagEr"               
# [223] "tGrvAccMagIqr"               "tGrvAccMagEntropy"           "tGrvAccMagarCoeff1"         
# [226] "tGrvAccMagarCoeff2"          "tGrvAccMagarCoeff3"          "tGrvAccMagarCoeff4"         
# [229] "tBdAccJerkMagMean"           "tBdAccJerkMagStd"            "tBdAccJerkMagMed"           
# [232] "tBdAccJerkMagMax"            "tBdAccJerkMagMin"            "tBdAccJerkMagSma"           
# [235] "tBdAccJerkMagEr"             "tBdAccJerkMagIqr"            "tBdAccJerkMagEntropy"       
# [238] "tBdAccJerkMagarCoeff1"       "tBdAccJerkMagarCoeff2"       "tBdAccJerkMagarCoeff3"      
# [241] "tBdAccJerkMagarCoeff4"       "tBdGyroMagMean"              "tBdGyroMagStd"              
# [244] "tBdGyroMagMed"               "tBdGyroMagMax"               "tBdGyroMagMin"              
# [247] "tBdGyroMagSma"               "tBdGyroMagEr"                "tBdGyroMagIqr"              
# [250] "tBdGyroMagEntropy"           "tBdGyroMagarCoeff1"          "tBdGyroMagarCoeff2"         
# [253] "tBdGyroMagarCoeff3"          "tBdGyroMagarCoeff4"          "tBdGyroJerkMagMean"         
# [256] "tBdGyroJerkMagStd"           "tBdGyroJerkMagMed"           "tBdGyroJerkMagMax"          
# [259] "tBdGyroJerkMagMin"           "tBdGyroJerkMagSma"           "tBdGyroJerkMagEr"           
# [262] "tBdGyroJerkMagIqr"           "tBdGyroJerkMagEntropy"       "tBdGyroJerkMagarCoeff1"     
# [265] "tBdGyroJerkMagarCoeff2"      "tBdGyroJerkMagarCoeff3"      "tBdGyroJerkMagarCoeff4"     
# [268] "fBdAccMeanX"                 "fBdAccMeanY"                 "fBdAccMeanZ"                
# [271] "fBdAccStdX"                  "fBdAccStdY"                  "fBdAccStdZ"                 
# [274] "fBdAccMedX"                  "fBdAccMedY"                  "fBdAccMedZ"                 
# [277] "fBdAccMaxX"                  "fBdAccMaxY"                  "fBdAccMaxZ"                 
# [280] "fBdAccMinX"                  "fBdAccMinY"                  "fBdAccMinZ"                 
# [283] "fBdAccSma"                   "fBdAccErX"                   "fBdAccErY"                  
# [286] "fBdAccErZ"                   "fBdAccIqrX"                  "fBdAccIqrY"                 
# [289] "fBdAccIqrZ"                  "fBdAccEntropyX"              "fBdAccEntropyY"             
# [292] "fBdAccEntropyZ"              "fBdAccMaxIndsX"              "fBdAccMaxIndsY"             
# [295] "fBdAccMaxIndsZ"              "fBdAccMeanFreqX"             "fBdAccMeanFreqY"            
# [298] "fBdAccMeanFreqZ"             "fBdAccskewnessX"             "fBdAccKurtosisX"            
# [301] "fBdAccskewnessY"             "fBdAccKurtosisY"             "fBdAccskewnessZ"            
# [304] "fBdAccKurtosisZ"             "fBdAccbandsEnergy-1,8"       "fBdAccbandsEnergy-9,16"     
# [307] "fBdAccbandsEnergy-17,24"     "fBdAccbandsEnergy-25,32"     "fBdAccbandsEnergy-33,40"    
# [310] "fBdAccbandsEnergy-41,48"     "fBdAccbandsEnergy-49,56"     "fBdAccbandsEnergy-57,64"    
# [313] "fBdAccbandsEnergy-1,16"      "fBdAccbandsEnergy-17,32"     "fBdAccbandsEnergy-33,48"    
# [316] "fBdAccbandsEnergy-49,64"     "fBdAccbandsEnergy-1,24"      "fBdAccbandsEnergy-25,48"    
# [319] "fBdAccJerkMeanX"             "fBdAccJerkMeanY"             "fBdAccJerkMeanZ"            
# [322] "fBdAccJerkStdX"              "fBdAccJerkStdY"              "fBdAccJerkStdZ"             
# [325] "fBdAccJerkMedX"              "fBdAccJerkMedY"              "fBdAccJerkMedZ"             
# [328] "fBdAccJerkMaxX"              "fBdAccJerkMaxY"              "fBdAccJerkMaxZ"             
# [331] "fBdAccJerkMinX"              "fBdAccJerkMinY"              "fBdAccJerkMinZ"             
# [334] "fBdAccJerkSma"               "fBdAccJerkErX"               "fBdAccJerkErY"              
# [337] "fBdAccJerkErZ"               "fBdAccJerkIqrX"              "fBdAccJerkIqrY"             
# [340] "fBdAccJerkIqrZ"              "fBdAccJerkEntropyX"          "fBdAccJerkEntropyY"         
# [343] "fBdAccJerkEntropyZ"          "fBdAccJerkMaxIndsX"          "fBdAccJerkMaxIndsY"         
# [346] "fBdAccJerkMaxIndsZ"          "fBdAccJerkMeanFreqX"         "fBdAccJerkMeanFreqY"        
# [349] "fBdAccJerkMeanFreqZ"         "fBdAccJerkskewnessX"         "fBdAccJerkKurtosisX"        
# [352] "fBdAccJerkskewnessY"         "fBdAccJerkKurtosisY"         "fBdAccJerkskewnessZ"        
# [355] "fBdAccJerkKurtosisZ"         "fBdAccJerkbandsEnergy-1,8"   "fBdAccJerkbandsEnergy-9,16" 
# [358] "fBdAccJerkbandsEnergy-17,24" "fBdAccJerkbandsEnergy-25,32" "fBdAccJerkbandsEnergy-33,40"
# [361] "fBdAccJerkbandsEnergy-41,48" "fBdAccJerkbandsEnergy-49,56" "fBdAccJerkbandsEnergy-57,64"
# [364] "fBdAccJerkbandsEnergy-1,16"  "fBdAccJerkbandsEnergy-17,32" "fBdAccJerkbandsEnergy-33,48"
# [367] "fBdAccJerkbandsEnergy-49,64" "fBdAccJerkbandsEnergy-1,24"  "fBdAccJerkbandsEnergy-25,48"
# [370] "fBdGyroMeanX"                "fBdGyroMeanY"                "fBdGyroMeanZ"               
# [373] "fBdGyroStdX"                 "fBdGyroStdY"                 "fBdGyroStdZ"                
# [376] "fBdGyroMedX"                 "fBdGyroMedY"                 "fBdGyroMedZ"                
# [379] "fBdGyroMaxX"                 "fBdGyroMaxY"                 "fBdGyroMaxZ"                
# [382] "fBdGyroMinX"                 "fBdGyroMinY"                 "fBdGyroMinZ"                
# [385] "fBdGyroSma"                  "fBdGyroErX"                  "fBdGyroErY"                 
# [388] "fBdGyroErZ"                  "fBdGyroIqrX"                 "fBdGyroIqrY"                
# [391] "fBdGyroIqrZ"                 "fBdGyroEntropyX"             "fBdGyroEntropyY"            
# [394] "fBdGyroEntropyZ"             "fBdGyroMaxIndsX"             "fBdGyroMaxIndsY"            
# [397] "fBdGyroMaxIndsZ"             "fBdGyroMeanFreqX"            "fBdGyroMeanFreqY"           
# [400] "fBdGyroMeanFreqZ"            "fBdGyroskewnessX"            "fBdGyroKurtosisX"           
# [403] "fBdGyroskewnessY"            "fBdGyroKurtosisY"            "fBdGyroskewnessZ"           
# [406] "fBdGyroKurtosisZ"            "fBdGyrobandsEnergy-1,8"      "fBdGyrobandsEnergy-9,16"    
# [409] "fBdGyrobandsEnergy-17,24"    "fBdGyrobandsEnergy-25,32"    "fBdGyrobandsEnergy-33,40"   
# [412] "fBdGyrobandsEnergy-41,48"    "fBdGyrobandsEnergy-49,56"    "fBdGyrobandsEnergy-57,64"   
# [415] "fBdGyrobandsEnergy-1,16"     "fBdGyrobandsEnergy-17,32"    "fBdGyrobandsEnergy-33,48"   
# [418] "fBdGyrobandsEnergy-49,64"    "fBdGyrobandsEnergy-1,24"     "fBdGyrobandsEnergy-25,48"   
# [421] "fBdAccMagMean"               "fBdAccMagStd"                "fBdAccMagMed"               
# [424] "fBdAccMagMax"                "fBdAccMagMin"                "fBdAccMagSma"               
# [427] "fBdAccMagEr"                 "fBdAccMagIqr"                "fBdAccMagEntropy"           
# [430] "fBdAccMagMaxInds"            "fBdAccMagMeanFreq"           "fBdAccMagskewness"          
# [433] "fBdAccMagKurtosis"           "fBdBdAccJerkMagMean"         "fBdBdAccJerkMagStd"         
# [436] "fBdBdAccJerkMagMed"          "fBdBdAccJerkMagMax"          "fBdBdAccJerkMagMin"         
# [439] "fBdBdAccJerkMagSma"          "fBdBdAccJerkMagEr"           "fBdBdAccJerkMagIqr"         
# [442] "fBdBdAccJerkMagEntropy"      "fBdBdAccJerkMagMaxInds"      "fBdBdAccJerkMagMeanFreq"    
# [445] "fBdBdAccJerkMagskewness"     "fBdBdAccJerkMagKurtosis"     "fBdBdGyroMagMean"           
# [448] "fBdBdGyroMagStd"             "fBdBdGyroMagMed"             "fBdBdGyroMagMax"            
# [451] "fBdBdGyroMagMin"             "fBdBdGyroMagSma"             "fBdBdGyroMagEr"             
# [454] "fBdBdGyroMagIqr"             "fBdBdGyroMagEntropy"         "fBdBdGyroMagMaxInds"        
# [457] "fBdBdGyroMagMeanFreq"        "fBdBdGyroMagskewness"        "fBdBdGyroMagKurtosis"       
# [460] "fBdBdGyroJerkMagMean"        "fBdBdGyroJerkMagStd"         "fBdBdGyroJerkMagMed"        
# [463] "fBdBdGyroJerkMagMax"         "fBdBdGyroJerkMagMin"         "fBdBdGyroJerkMagSma"        
# [466] "fBdBdGyroJerkMagEr"          "fBdBdGyroJerkMagIqr"         "fBdBdGyroJerkMagEntropy"    
# [469] "fBdBdGyroJerkMagMaxInds"     "fBdBdGyroJerkMagMeanFreq"    "fBdBdGyroJerkMagskewness"   
# [472] "fBdBdGyroJerkMagKurtosis"    "AngtBdAccMeanGrv"            "AngtBdAccJerkMeanGrvMean"   
# [475] "AngtBdGyroMeanGrvMean"       "AngtBdGyroJerkMeanGrvMean"   "AngXGrvMean"                
# [478] "AngYGrvMean"                 "AngZGrvMean"                

