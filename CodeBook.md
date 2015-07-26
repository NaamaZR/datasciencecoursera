<h1>CodeBook by Naama Rubin</h1>
<h3>
Data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
also called the "Samsung Data"
</h2>

<h2>
The features selected for this database come from the accelerometer and gyroscope 
</h2>
<p>
There are 3-axial raw signals <strong>tAcc-XYZ</strong> and <strong>tGyro-XYZ</strong>. 
<strong>We are expecting two main measures 
"Acc" for accelerometer 
"Gyro" for gyroscope 
each in 3 coloumns for X,Y,Z.</strong>
</p>

<p>
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter 
with a corner frequency of 20 Hz to remove noise. 
</p>

<p>
<strong>
The acceleration signal was further splitted into two  internal acceleration components,
body and  gravity.
"Body" denote as "Bd", "Gravity" as "Grv" </strong>
this was done using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
tBdAcc-XYZ and tGrvAcc-XYZ
</p>

<p>
Subsequently, the body linear acceleration and angular velocity (gyro)
were derived in time to obtain Jerk signals (diff was done on it, e.g. subtract).
tBdAccJerk-XYZ and tBdGyroJerk-XYZ
</p>

<p>
Magnitude of these three-dimensional signals were calculated using the Euclidean norm
tBdAccMag, tGrvAccMag, tBdAccJerkMag, tBdGyroMag, tBdGyroJerkMag. 
</p>

<p>
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
</p>


<h3>
Signals at Time Domain:
</h3>
<ol>
<li>   tBdAcc-XYZ              Bd (Body) was extracted from  raw tAcc, 3  cols           </li> 
<li>   tGrvAcc-XYZ             Grv (Gravity) was extracted from raw tAcc, 3 cols         </li> 
<li>   tBdAccJerk-XYZ          diff elements in tBdAcc (1), 3 cols                       </li> 
<li>   tBdGyro-XYZ             is the raw tGyro, 3 cols                                  </li> 
<li>   tBdGyroJerk-XYZ         diff on  tBdGyro (4), 3 cols                              </li> 
<li>   tBdAccMag               Euclidean norm on tBdAcc (1) all cols to get 1 col        </li> 
<li>   tGrvAccMag              Euclidean norm on tGrvAcc (2) all cols to get 1 col       </li> 
<li>   tBdAccJerkMag           Euclidean norm  on tBdAccJerk  (3) all cols to get 1 col  </li> 
<li>   tBdGyroMag              Euclidean norm  on tBdGyro  (4) all cols to get 1 col     </li> 
<li>   tBdGyroJerkMag          Euclidean norm  on tBdGyroJerk (5) all cols to get 1 col  </li> 
</ol>

<p>
Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBdAcc-XYZ, fBdAccJerk-XYZ, fBdGyro-XYZ, fBdAccJerkMag, fBdGyroMag, fBdGyroJerkMag.
'f' is to indicate frequency domain signals. 
</p>
<h3>
Signals at Frequency Domain:
</h3>
<ol>
<li>fBdAcc-XYZ                 fft on (t 1)   </li> 
<li>fBdAccJerk-XYZ             fft on (t 3)   </li> 
<li>fBdGyro-XYZ                fft on (t 4)   </li> 
<li>fBdAccMag                  fft on (t 6)   </li> 
<li>fBdAccJerkMag              fft on (t 8)   </li> 
<li>fBdGyroMag                 fft on (t 9)   </li> 
<li>fBdGyroJerkMag             fft on (t 10)  </li> 
</ol>

<h3>
Measures that were calculated from these signals:
</h3>
<ol>
<li>mean 	Mean value                                                           </li>               
<li>std	        Standard deviation                                                   </li>
<li>median 	Median, take 50% quantile                                            </li>
<li>max	        Max value                                                            </li>
<li>min	        Minimum value                                                        </li>
<li>sma	        Signal Magnitude Area                                                </li>
<li>energy	Energy measure. Sum of the squares divided by the number of values.  </li>
<li>iqr	        Interquartile range, 25% quantile to 75% quantile                    </li>
<li>entropy	Signal entropy                                                       </li>
<li>arCoeff	Autorregresion coefficients with Burg order equal to 4               </li>
</ol>

<p>
Measures that were calculated from freq domain siganls:
maxInds():          index of the frequency component with largest magnitude
meanFreq():        Weighted average of the frequency components to obtain a mean frequency
skewness():          skewness of the frequency domain signal 
kurtosis():               kurtosis of the frequency domain signal 
bandsEnergy():      Energy of a frequency interval within the 64 bins of the FFT of each window.
</p>
<p>
Measures on two signals
correlation():     correlation coefficient between two signals, this will denote with two upercase axial dims at end, e.g. "tGrvAccCorXZ"      
angle():                    Angle between two vectors.
</p>

<p>
Additional vectors obtained by averaging the signals in a signal window sample. 
These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
</p>

<p>
Two ID variables were added :
"Subject"                              30 participents in expriment  were label by running ind from 1 to 30                 
"Activity"                             6 activities were labled:         "Walk", "WalkUpS", "WakDn", "Sit", "Stand", "Lay"   
</p>

<h4>
The complete list of variables:
</h4>
cols names
 [1]  "Subject"           	30 participents in expriment  were label by running ind from 1 to 30                 
 [2]  "Activity"          	6 activities were labled: "Walk", "WalkUpS", "WakDn", "Sit", "Stand", "Lay"    
 [3]  "tBdAccMeanX"       	mean on t 1 X axis            
 [4]  "tBdAccMeanY"       	mean on t 1 Y axis             
 [5]  "tBdAccMeanZ"       	mean on t 1 Z axis                
 [6]  "tBdAccStdX"        	std on t 1 X axis               
 [7]  "tBdAccStdY"        	std on t 1 Y axis            
 [8]  "tBdAccStdZ"        	std on t 1 Z axis            
 [9]  "tBdAccMedX"        	median on t 1 X axis              
 [10] "tBdAccMedY"        	median on t 1 Y axis             
 [11] "tBdAccMedZ"       	 median on t 1 Z axis            
 [12] "tBdAccMaxX"      	max val on t 1 X axis               
 [13] "tBdAccMaxY"      	max val on t 1 Y axis             
 [14] "tBdAccMaxZ"      	max val on t 1 Z axis          
 [15] "tBdAccMinX"      	min val on t 1 X axis              
 [16] "tBdAccMinY"      	min val on t 1 X axis           
 [17] "tBdAccMinZ"      	min val on t 1 X axis            
 [18] "tBdAccSma"       	Signal Magintude Area on t 1 all axis           
 [19] "tBdAccErX"       	Energy measure on t 1 X axis               
 [20] "tBdAccErY"       	Energy measure on t 1 Y axis               
 [21] "tBdAccErZ"       	Energy measure on t 1 Z axis               
 [22] "tBdAccIqrX"      	IQR  on t 1 X axis            
 [23] "tBdAccIqrY"      	IQR  on t 1 Y axis            
 [24] "tBdAccIqrZ"      	IQR  on t 1 Z axis           
 [25] "tBdAccEntropyX"          Entropy  on t 1 X axis   
 [26] "tBdAccEntropyY"          Entropy  on t 1 Y axis    
 [27] "tBdAccEntropyZ"          Entropy  on t 1 Z axis   
 [28] "tBdAccarCoeffX,1"        Autorregresion coefficients ot t 1 X burg order 1    
 [29] "tBdAccarCoeffX,2"        Autorregresion coefficients ot t 1 X burg order 2     
 [30] "tBdAccarCoeffX,3"        Autorregresion coefficients ot t 1 X burg order 3    
 [31] "tBdAccarCoeffX,4"        Autorregresion coefficients ot t 1 X burg order 4    
 [32] "tBdAccarCoeffY,1"        Autorregresion coefficients ot t 1 Y burg order 1    
 [33] "tBdAccarCoeffY,2"        Autorregresion coefficients ot t 1 Y burg order 2   
 [34] "tBdAccarCoeffY,3"        Autorregresion coefficients ot t 1 Y burg order 3    
 [35] "tBdAccarCoeffY,4"        Autorregresion coefficients ot t 1 Y burg order 4    
 [36] "tBdAccarCoeffZ,1"        Autorregresion coefficients ot t 1 Z burg order 1   
 [37] "tBdAccarCoeffZ,2"        Autorregresion coefficients ot t 1 Z burg order 2    
 [38] "tBdAccarCoeffZ,3"        Autorregresion coefficients ot t 1 Z burg order 3    
 [39] "tBdAccarCoeffZ,4"        Autorregresion coefficients ot t 1 Z burg order 4   
 [40] "tBdAccCorXY"             Correlation on t 1  X vs Y    
 [41] "tBdAccCorXZ"             Correlation on t 1  X vs Z    
 [42] "tBdAccCorYZ"             Correlation on t 1  Y vs Z  
 [43] "tGrvAccMeanX"                
 [44] "tGrvAccMeanY"                
 [45] "tGrvAccMeanZ"               
 [46] "tGrvAccStdX"                 
 [47] "tGrvAccStdY"                 
 [48] "tGrvAccStdZ"                
 [49] "tGrvAccMedX"                 
 [50] "tGrvAccMedY"                 
 [51] "tGrvAccMedZ"                
 [52] "tGrvAccMaxX"                 
 [53] "tGrvAccMaxY"                 
 [54] "tGrvAccMaxZ"                
 [55] "tGrvAccMinX"                 
 [56] "tGrvAccMinY"                 
 [57] "tGrvAccMinZ"                
 [58] "tGrvAccSma"                  
 [59] "tGrvAccErX"                  
 [60] "tGrvAccErY"                 
 [61] "tGrvAccErZ"  
 [62] "tGrvAccIqrX"                
 [63] "tGrvAccIqrY"                
 [64] "tGrvAccIqrZ"                 
 [65] "tGrvAccEntropyX"             
 [66] "tGrvAccEntropyY"            
 [67] "tGrvAccEntropyZ"            
 [68] "tGrvAccarCoeffX,1"           
 [69] "tGrvAccarCoeffX,2"          
 [70] "tGrvAccarCoeffX,3"           
 [71] "tGrvAccarCoeffX,4"           
 [72] "tGrvAccarCoeffY,1"          
 [73] "tGrvAccarCoeffY,2"           
 [74] "tGrvAccarCoeffY,3"           
 [75] "tGrvAccarCoeffY,4"          
 [76] "tGrvAccarCoeffZ,1"           
 [77] "tGrvAccarCoeffZ,2"           
 [78] "tGrvAccarCoeffZ,3"          
 [79] "tGrvAccarCoeffZ,4"           
 [80] "tGrvAccCorXY"                
 [81] "tGrvAccCorXZ"               
 [82] "tGrvAccCorYZ"                
 [83] "tBdAccJerkMeanX"             
 [84] "tBdAccJerkMeanY"            
 [85] "tBdAccJerkMeanZ"             
 [86] "tBdAccJerkStdX"              
 [87] "tBdAccJerkStdY"             
 [88] "tBdAccJerkStdZ"              
 [89] "tBdAccJerkMedX"              
 [90] "tBdAccJerkMedY"             
 [91] "tBdAccJerkMedZ"              
 [92] "tBdAccJerkMaxX"              
 [93] "tBdAccJerkMaxY"             
 [94] "tBdAccJerkMaxZ"              
 [95] "tBdAccJerkMinX"              
 [96] "tBdAccJerkMinY"             
 [97] "tBdAccJerkMinZ"              
 [98] "tBdAccJerkSma"               
 [99] "tBdAccJerkErX"              
 [100] "tBdAccJerkErY"               
 [101] "tBdAccJerkErZ"               
 [102] "tBdAccJerkIqrX"             
 [103] "tBdAccJerkIqrY"              
 [104] "tBdAccJerkIqrZ"              
 [105] "tBdAccJerkEntropyX"         
 [106] "tBdAccJerkEntropyY"          
 [107]"tBdAccJerkEntropyZ"          
 [108] "tBdAccJerkarCoeffX,1"       
 [109] "tBdAccJerkarCoeffX,2"        
 [110] "tBdAccJerkarCoeffX,3"        
 [111] "tBdAccJerkarCoeffX,4"       
 [112] "tBdAccJerkarCoeffY,1"        
 [113] "tBdAccJerkarCoeffY,2"        
 [114] "tBdAccJerkarCoeffY,3"       
 [115] "tBdAccJerkarCoeffY,4"        
 [116] "tBdAccJerkarCoeffZ,1"        
 [117] "tBdAccJerkarCoeffZ,2"       
 [118] "tBdAccJerkarCoeffZ,3"        
 [119] "tBdAccJerkarCoeffZ,4"        
 [120] "tBdAccJerkCorXY"            
 [121] "tBdAccJerkCorXZ"             
 [122] "tBdAccJerkCorYZ"             
 [123] "tBdGyroMeanX"               
 [124] "tBdGyroMeanY"                
 [125] "tBdGyroMeanZ"                
 [126] "tBdGyroStdX"                
 [127] "tBdGyroStdY"                 
 [128] "tBdGyroStdZ"                 
 [129] "tBdGyroMedX"                
 [130] "tBdGyroMedY"                 
 [131] "tBdGyroMedZ"                 
 [132] "tBdGyroMaxX"                
 [133] "tBdGyroMaxY"                 
 [134] "tBdGyroMaxZ"                 
 [135] "tBdGyroMinX"                
 [136] "tBdGyroMinY"                 
 [137] "tBdGyroMinZ"                 
 [138] "tBdGyroSma"                 
 [139] "tBdGyroErX"                  "tBdGyroErY"                  "tBdGyroErZ"                 
 [142] "tBdGyroIqrX"                 "tBdGyroIqrY"                 "tBdGyroIqrZ"                
 [145] "tBdGyroEntropyX"             "tBdGyroEntropyY"             "tBdGyroEntropyZ"            
 [148] "tBdGyroarCoeffX,1"           "tBdGyroarCoeffX,2"           "tBdGyroarCoeffX,3"          
 [151] "tBdGyroarCoeffX,4"           "tBdGyroarCoeffY,1"           "tBdGyroarCoeffY,2"          
 [154] "tBdGyroarCoeffY,3"           "tBdGyroarCoeffY,4"           "tBdGyroarCoeffZ,1"          
 [157] "tBdGyroarCoeffZ,2"           "tBdGyroarCoeffZ,3"           "tBdGyroarCoeffZ,4"          
 [160] "tBdGyroCorXY"                "tBdGyroCorXZ"                "tBdGyroCorYZ"               
 [163] "tBdGyroJerkMeanX"            "tBdGyroJerkMeanY"            "tBdGyroJerkMeanZ"           
 [166] "tBdGyroJerkStdX"             "tBdGyroJerkStdY"             "tBdGyroJerkStdZ"            
 [169] "tBdGyroJerkMedX"             "tBdGyroJerkMedY"             "tBdGyroJerkMedZ"            
 [172] "tBdGyroJerkMaxX"             "tBdGyroJerkMaxY"             "tBdGyroJerkMaxZ"            
 [175] "tBdGyroJerkMinX"             "tBdGyroJerkMinY"             "tBdGyroJerkMinZ"            
 [178] "tBdGyroJerkSma"              "tBdGyroJerkErX"              "tBdGyroJerkErY"             
 [181] "tBdGyroJerkErZ"              "tBdGyroJerkIqrX"             "tBdGyroJerkIqrY"            
 [184] "tBdGyroJerkIqrZ"             "tBdGyroJerkEntropyX"         "tBdGyroJerkEntropyY"        
 [187] "tBdGyroJerkEntropyZ"         "tBdGyroJerkarCoeffX,1"       "tBdGyroJerkarCoeffX,2"      
 [190] "tBdGyroJerkarCoeffX,3"       "tBdGyroJerkarCoeffX,4"       "tBdGyroJerkarCoeffY,1"      
 [193] "tBdGyroJerkarCoeffY,2"       "tBdGyroJerkarCoeffY,3"       "tBdGyroJerkarCoeffY,4"      
 [196] "tBdGyroJerkarCoeffZ,1"       "tBdGyroJerkarCoeffZ,2"       "tBdGyroJerkarCoeffZ,3"      
 [199] "tBdGyroJerkarCoeffZ,4"       "tBdGyroJerkCorXY"            "tBdGyroJerkCorXZ"           
 [202] "tBdGyroJerkCorYZ"            "tBdAccMagMean"               "tBdAccMagStd"               
 [205] "tBdAccMagMed"                "tBdAccMagMax"                "tBdAccMagMin"               
 [208] "tBdAccMagSma"                "tBdAccMagEr"                 "tBdAccMagIqr"               
 [211] "tBdAccMagEntropy"            "tBdAccMagarCoeff1"           "tBdAccMagarCoeff2"          
 [214] "tBdAccMagarCoeff3"           "tBdAccMagarCoeff4"           "tGrvAccMagMean"             
 [217] "tGrvAccMagStd"               "tGrvAccMagMed"               "tGrvAccMagMax"              
 [220] "tGrvAccMagMin"               "tGrvAccMagSma"               "tGrvAccMagEr"               
 [223] "tGrvAccMagIqr"               "tGrvAccMagEntropy"           "tGrvAccMagarCoeff1"         
 [226] "tGrvAccMagarCoeff2"          "tGrvAccMagarCoeff3"          "tGrvAccMagarCoeff4"         
 [229] "tBdAccJerkMagMean"           "tBdAccJerkMagStd"            "tBdAccJerkMagMed"           
 [232] "tBdAccJerkMagMax"            "tBdAccJerkMagMin"            "tBdAccJerkMagSma"           
 [235] "tBdAccJerkMagEr"             "tBdAccJerkMagIqr"            "tBdAccJerkMagEntropy"       
 [238] "tBdAccJerkMagarCoeff1"       "tBdAccJerkMagarCoeff2"       "tBdAccJerkMagarCoeff3"      
 [241] "tBdAccJerkMagarCoeff4"       "tBdGyroMagMean"              "tBdGyroMagStd"              
 [244] "tBdGyroMagMed"               "tBdGyroMagMax"               "tBdGyroMagMin"              
 [247] "tBdGyroMagSma"               "tBdGyroMagEr"                "tBdGyroMagIqr"              
 [250] "tBdGyroMagEntropy"           "tBdGyroMagarCoeff1"          "tBdGyroMagarCoeff2"         
 [253] "tBdGyroMagarCoeff3"          "tBdGyroMagarCoeff4"          "tBdGyroJerkMagMean"         
 [256] "tBdGyroJerkMagStd"           "tBdGyroJerkMagMed"           "tBdGyroJerkMagMax"          
 [259] "tBdGyroJerkMagMin"           "tBdGyroJerkMagSma"           "tBdGyroJerkMagEr"           
 [262] "tBdGyroJerkMagIqr"           "tBdGyroJerkMagEntropy"       "tBdGyroJerkMagarCoeff1"     
 [265] "tBdGyroJerkMagarCoeff2"      "tBdGyroJerkMagarCoeff3"      "tBdGyroJerkMagarCoeff4"     
 [268] "fBdAccMeanX"                 "fBdAccMeanY"                 "fBdAccMeanZ"                
 [271] "fBdAccStdX"                  "fBdAccStdY"                  "fBdAccStdZ"                 
 [274] "fBdAccMedX"                  "fBdAccMedY"                  "fBdAccMedZ"                 
 [277] "fBdAccMaxX"                  "fBdAccMaxY"                  "fBdAccMaxZ"                 
 [280] "fBdAccMinX"                  "fBdAccMinY"                  "fBdAccMinZ"                 
 [283] "fBdAccSma"                   "fBdAccErX"                   "fBdAccErY"                  
 [286] "fBdAccErZ"                   "fBdAccIqrX"                  "fBdAccIqrY"                 
 [289] "fBdAccIqrZ"                  "fBdAccEntropyX"              "fBdAccEntropyY"             
 [292] "fBdAccEntropyZ"              "fBdAccMaxIndsX"              "fBdAccMaxIndsY"             
 [295] "fBdAccMaxIndsZ"              "fBdAccMeanFreqX"             "fBdAccMeanFreqY"            
 [298] "fBdAccMeanFreqZ"             "fBdAccskewnessX"             "fBdAccKurtosisX"            
 [301] "fBdAccskewnessY"             "fBdAccKurtosisY"             "fBdAccskewnessZ"            
 [304] "fBdAccKurtosisZ"             "fBdAccbandsEnergy-1,8"       "fBdAccbandsEnergy-9,16"     
 [307] "fBdAccbandsEnergy-17,24"     "fBdAccbandsEnergy-25,32"     "fBdAccbandsEnergy-33,40"    
 [310] "fBdAccbandsEnergy-41,48"     "fBdAccbandsEnergy-49,56"     "fBdAccbandsEnergy-57,64"    
 [313] "fBdAccbandsEnergy-1,16"      "fBdAccbandsEnergy-17,32"     "fBdAccbandsEnergy-33,48"    
 [316] "fBdAccbandsEnergy-49,64"     "fBdAccbandsEnergy-1,24"      "fBdAccbandsEnergy-25,48"    
 [319] "fBdAccJerkMeanX"             "fBdAccJerkMeanY"             "fBdAccJerkMeanZ"            
 [322] "fBdAccJerkStdX"              "fBdAccJerkStdY"              "fBdAccJerkStdZ"             
 [325] "fBdAccJerkMedX"              "fBdAccJerkMedY"              "fBdAccJerkMedZ"             
 [328] "fBdAccJerkMaxX"              "fBdAccJerkMaxY"              "fBdAccJerkMaxZ"             
 [331] "fBdAccJerkMinX"              "fBdAccJerkMinY"              "fBdAccJerkMinZ"             
 [334] "fBdAccJerkSma"               "fBdAccJerkErX"               "fBdAccJerkErY"              
 [337] "fBdAccJerkErZ"               "fBdAccJerkIqrX"              "fBdAccJerkIqrY"             
 [340] "fBdAccJerkIqrZ"              "fBdAccJerkEntropyX"          "fBdAccJerkEntropyY"         
 [343] "fBdAccJerkEntropyZ"          "fBdAccJerkMaxIndsX"          "fBdAccJerkMaxIndsY"         
 [346] "fBdAccJerkMaxIndsZ"          "fBdAccJerkMeanFreqX"         "fBdAccJerkMeanFreqY"        
 [349] "fBdAccJerkMeanFreqZ"         "fBdAccJerkskewnessX"         "fBdAccJerkKurtosisX"        
 [352] "fBdAccJerkskewnessY"         "fBdAccJerkKurtosisY"         "fBdAccJerkskewnessZ"        
 [355] "fBdAccJerkKurtosisZ"         "fBdAccJerkbandsEnergy-1,8"   "fBdAccJerkbandsEnergy-9,16" 
 [358] "fBdAccJerkbandsEnergy-17,24" "fBdAccJerkbandsEnergy-25,32" "fBdAccJerkbandsEnergy-33,40"
 [361] "fBdAccJerkbandsEnergy-41,48" "fBdAccJerkbandsEnergy-49,56" "fBdAccJerkbandsEnergy-57,64"
 [364] "fBdAccJerkbandsEnergy-1,16"  "fBdAccJerkbandsEnergy-17,32" "fBdAccJerkbandsEnergy-33,48"
 [367] "fBdAccJerkbandsEnergy-49,64" "fBdAccJerkbandsEnergy-1,24"  "fBdAccJerkbandsEnergy-25,48"
 [370] "fBdGyroMeanX"                "fBdGyroMeanY"                "fBdGyroMeanZ"               
 [373] "fBdGyroStdX"                 "fBdGyroStdY"                 "fBdGyroStdZ"                
 [376] "fBdGyroMedX"                 "fBdGyroMedY"                 "fBdGyroMedZ"                
 [379] "fBdGyroMaxX"                 "fBdGyroMaxY"                 "fBdGyroMaxZ"                
 [382] "fBdGyroMinX"                 "fBdGyroMinY"                 "fBdGyroMinZ"                
 [385] "fBdGyroSma"                  "fBdGyroErX"                  "fBdGyroErY"                 
 [388] "fBdGyroErZ"                  "fBdGyroIqrX"                 "fBdGyroIqrY"                
 [391] "fBdGyroIqrZ"                 "fBdGyroEntropyX"             "fBdGyroEntropyY"            
 [394] "fBdGyroEntropyZ"             "fBdGyroMaxIndsX"             "fBdGyroMaxIndsY"            
 [397] "fBdGyroMaxIndsZ"             "fBdGyroMeanFreqX"            "fBdGyroMeanFreqY"           
 [400] "fBdGyroMeanFreqZ"            "fBdGyroskewnessX"            "fBdGyroKurtosisX"           
 [403] "fBdGyroskewnessY"            "fBdGyroKurtosisY"            "fBdGyroskewnessZ"           
 [406] "fBdGyroKurtosisZ"            "fBdGyrobandsEnergy-1,8"      "fBdGyrobandsEnergy-9,16"    
 [409] "fBdGyrobandsEnergy-17,24"    "fBdGyrobandsEnergy-25,32"    "fBdGyrobandsEnergy-33,40"   
 [412] "fBdGyrobandsEnergy-41,48"    "fBdGyrobandsEnergy-49,56"    "fBdGyrobandsEnergy-57,64"   
 [415] "fBdGyrobandsEnergy-1,16"     "fBdGyrobandsEnergy-17,32"    "fBdGyrobandsEnergy-33,48"   
 [418] "fBdGyrobandsEnergy-49,64"    "fBdGyrobandsEnergy-1,24"     "fBdGyrobandsEnergy-25,48"   
 [421] "fBdAccMagMean"               "fBdAccMagStd"                "fBdAccMagMed"               
 [424] "fBdAccMagMax"                "fBdAccMagMin"                "fBdAccMagSma"               
 [427] "fBdAccMagEr"                 "fBdAccMagIqr"                "fBdAccMagEntropy"           
 [430] "fBdAccMagMaxInds"            "fBdAccMagMeanFreq"           "fBdAccMagskewness"          
 [433] "fBdAccMagKurtosis"           "fBdBdAccJerkMagMean"         "fBdBdAccJerkMagStd"         
 [436] "fBdBdAccJerkMagMed"          "fBdBdAccJerkMagMax"          "fBdBdAccJerkMagMin"         
 [439] "fBdBdAccJerkMagSma"          "fBdBdAccJerkMagEr"           "fBdBdAccJerkMagIqr"         
 [442] "fBdBdAccJerkMagEntropy"      "fBdBdAccJerkMagMaxInds"      "fBdBdAccJerkMagMeanFreq"    
 [445] "fBdBdAccJerkMagskewness"     "fBdBdAccJerkMagKurtosis"     "fBdBdGyroMagMean"           
 [448] "fBdBdGyroMagStd"             "fBdBdGyroMagMed"             "fBdBdGyroMagMax"            
 [451] "fBdBdGyroMagMin"             "fBdBdGyroMagSma"             "fBdBdGyroMagEr"             
 [454] "fBdBdGyroMagIqr"             "fBdBdGyroMagEntropy"         "fBdBdGyroMagMaxInds"        
 [457] "fBdBdGyroMagMeanFreq"        "fBdBdGyroMagskewness"        "fBdBdGyroMagKurtosis"       
 [460] "fBdBdGyroJerkMagMean"        "fBdBdGyroJerkMagStd"         "fBdBdGyroJerkMagMed"        
 [463] "fBdBdGyroJerkMagMax"         "fBdBdGyroJerkMagMin"         "fBdBdGyroJerkMagSma"        
 [466] "fBdBdGyroJerkMagEr"          "fBdBdGyroJerkMagIqr"         "fBdBdGyroJerkMagEntropy"    
 [469] "fBdBdGyroJerkMagMaxInds"     "fBdBdGyroJerkMagMeanFreq"    "fBdBdGyroJerkMagskewness"   
 [472] "fBdBdGyroJerkMagKurtosis"    "AngtBdAccMeanGrv"            "AngtBdAccJerkMeanGrvMean"   
 [475] "AngtBdGyroMeanGrvMean"       "AngtBdGyroJerkMeanGrvMean"   "AngXGrvMean"                
 [478] "AngYGrvMean"                
 [478] "AngZGrvMean"                

