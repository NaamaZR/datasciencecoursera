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
<li>   tBdAcc-XYZ    (t 1)     Bd (Body) was extracted from  raw tAcc, 3  cols           </li> 
<li>   tGrvAcc-XYZ   (t 2)     Grv (Gravity) was extracted from raw tAcc, 3 cols         </li> 
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
 <strong>fBdAcc-XYZ, fBdAccJerk-XYZ, fBdGyro-XYZ, fBdAccJerkMag, fBdGyroMag, fBdGyroJerkMag </strong>.
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

 [1]  <strong>"Subject" </strong>       30 participents in expriment  were label by running ind from 1 to 30                 
 [2]  <strong>"Activity"  </strong>        	6 activities were labled: "Walk", "WalkUpS", "WakDn", "Sit", "Stand", "Lay"    
 [3]  <strong>"tBdAccMeanX" </strong>      	mean on t 1 (upper list, time) X axis            
 [4]  <strong>"tBdAccMeanY" </strong>      	mean on t 1 Y axis             
 [5]  <strong>"tBdAccMeanZ" </strong>      	mean on t 1 Z axis                
 [6]  <strong>"tBdAccStdX"  </strong>      	std on t 1 X axis               
 [7]  <strong>"tBdAccStdY"  </strong>      	std on t 1 Y axis            
 [8]  <strong>"tBdAccStdZ" </strong>       	std on t 1 Z axis            
 [9]  <strong>"tBdAccMedX" </strong>       	median on t 1 X axis              
 [10] <strong>"tBdAccMedY" </strong>       	median on t 1 Y axis             
 [11] <strong>"tBdAccMedZ" </strong>      	median on t 1 Z axis            
 [12] <strong>"tBdAccMaxX" </strong>     	max val on t 1 X axis               
 [13] <strong>"tBdAccMaxY" </strong>     	max val on t 1 Y axis             
 [14] <strong>"tBdAccMaxZ"  </strong>    	max val on t 1 Z axis          
 [15] <strong>"tBdAccMinX"  </strong>    	min val on t 1 X axis              
 [16] <strong>"tBdAccMinY"  </strong>    	min val on t 1 X axis           
 [17] <strong>"tBdAccMinZ"  </strong>    	min val on t 1 X axis            
 [18] <strong>"tBdAccSma"    </strong>     	Signal Magintude Area on t 1 all axis           
 [19] <strong>"tBdAccErX"    </strong>      	Energy measure on t 1 X axis               
 [20] <strong>"tBdAccErY"    </strong>      	Energy measure on t 1 Y axis               
 [21] <strong>"tBdAccErZ"    </strong>      	Energy measure on t 1 Z axis               
 [22] <strong>"tBdAccIqrX"   </strong>     	IQR  on t 1 X axis            
 [23] <strong>"tBdAccIqrY"   </strong>     	 IQR  on t 1 Y axis            
 [24] <strong>"tBdAccIqrZ"   </strong>     	 IQR  on t 1 Z axis           
 [25] <strong>"tBdAccEntropyX"</strong>          Entropy  on t 1 X axis   
 [26] <strong>"tBdAccEntropyY"  </strong>        Entropy  on t 1 Y axis    
 [27] <strong>"tBdAccEntropyZ"  </strong>        Entropy  on t 1 Z axis   
 [28] <strong>"tBdAccarCoeffX,1" </strong>       Autorregresion coefficients ot t 1 X burg order 1    
 [29] <strong>"tBdAccarCoeffX,2" </strong>       Autorregresion coefficients ot t 1 X burg order 2     
 [30] <strong>"tBdAccarCoeffX,3" </strong>       Autorregresion coefficients ot t 1 X burg order 3    
 [31] <strong>"tBdAccarCoeffX,4" </strong>       Autorregresion coefficients ot t 1 X burg order 4    
 [32] <strong>"tBdAccarCoeffY,1" </strong>       Autorregresion coefficients ot t 1 Y burg order 1    
 [33] <strong>"tBdAccarCoeffY,2" </strong>       Autorregresion coefficients ot t 1 Y burg order 2   
 [34] <strong>"tBdAccarCoeffY,3"  </strong>      Autorregresion coefficients ot t 1 Y burg order 3    
 [35] <strong>"tBdAccarCoeffY,4"  </strong>      Autorregresion coefficients ot t 1 Y burg order 4    
 [36] <strong>"tBdAccarCoeffZ,1" </strong>       Autorregresion coefficients ot t 1 Z burg order 1   
 [37] <strong>"tBdAccarCoeffZ,2" </strong>       Autorregresion coefficients ot t 1 Z burg order 2    
 [38] <strong>"tBdAccarCoeffZ,3" </strong>       Autorregresion coefficients ot t 1 Z burg order 3    
 [39] <strong>"tBdAccarCoeffZ,4" </strong>       Autorregresion coefficients ot t 1 Z burg order 4   
 [40] <strong>"tBdAccCorXY"   </strong>          Correlation on t 1  X vs Y    
 [41] <strong>"tBdAccCorXZ"   </strong>          Correlation on t 1  X vs Z    
 [42] <strong>"tBdAccCorYZ"   </strong>          Correlation on t 1  Y vs Z  
 [43] <strong>"tGrvAccMeanX"   </strong>         mean on t 2 (upper list, time) X axis    
 [44] <strong>"tGrvAccMeanY"  </strong>          mean on t 2  Y axis    
 [45] <strong>"tGrvAccMeanZ"  </strong>          mean on t 2  Z axis   
 [46] <strong>"tGrvAccStdX" </strong>            std on t 2  X axis    
 [47] <strong>"tGrvAccStdY" </strong>            std on t 2  Y axis    
 [48] <strong>"tGrvAccStdZ" </strong>            std on t 2  Z axis   
 [49] <strong>"tGrvAccMedX" </strong>            median on t 2  X axis     
 [50] <strong>"tGrvAccMedY" </strong>            median on t 2  Y axis     
 [51] <strong>"tGrvAccMedZ" </strong>            median on t 2  Z axis    
 [52] <strong>"tGrvAccMaxX" </strong>            max val on t 2 X axis    
 [53] <strong>"tGrvAccMaxY" </strong>            max val on t 2 Y axis    
 [54] <strong>"tGrvAccMaxZ" </strong>            max val on t 2 Z axis   
 [55] <strong>"tGrvAccMinX" </strong>            min val on t 2 X axis    
 [56] <strong>"tGrvAccMinY" </strong>            min val on t 2 Y axis    
 [57] <strong>"tGrvAccMinZ" </strong>            min val on t 2 Z axis   
 [58] <strong>"tGrvAccSma"  </strong>            Signal Magintude Area on t 2 all axis    
 [59] <strong>"tGrvAccErX" </strong>             Energy measure on t 2 X axis    
 [60] <strong>"tGrvAccErY" </strong>             Energy measure on t 2 Y axis   
 [61] <strong>"tGrvAccErZ" </strong>		 Energy measure on t 2 Z axis
 [62] <strong>"tGrvAccIqrX" </strong>            IQR  on t 2 X axis   
 [63] <strong>"tGrvAccIqrY" </strong>            IQR  on t 2 Y axis   
 [64] <strong>"tGrvAccIqrZ" </strong>            IQR  on t 2 Z axis    
 [65] <strong>"tGrvAccEntropyX" </strong>        Entropy  on t 2 X axis    
 [66] <strong>"tGrvAccEntropyY" </strong>        Entropy  on t 2 Y axis   
 [67] <strong>"tGrvAccEntropyZ"  </strong>       Entropy  on t 2 Z axis   
 [68] <strong>"tGrvAccarCoeffX,1" </strong>      Autorregresion coefficients ot t 2 X burg order 1    
 [69] <strong>"tGrvAccarCoeffX,2" </strong>      Autorregresion coefficients ot t 2 X burg order 2   
 [70] <strong>"tGrvAccarCoeffX,3" </strong>      Autorregresion coefficients ot t 2 X burg order 3    
 [71] <strong>"tGrvAccarCoeffX,4" </strong>      Autorregresion coefficients ot t 2 X burg order 4   
 [72] <strong>"tGrvAccarCoeffY,1" </strong>      Autorregresion coefficients ot t 2 Y burg order 1   
 [73] <strong>"tGrvAccarCoeffY,2" </strong>      Autorregresion coefficients ot t 2 Y burg order 2    
 [74] <strong>"tGrvAccarCoeffY,3" </strong>      Autorregresion coefficients ot t 2 Y burg order 3    
 [75] <strong>"tGrvAccarCoeffY,4" </strong>      Autorregresion coefficients ot t 2 Y burg order 4   
 [76] <strong>"tGrvAccarCoeffZ,1" </strong>      Autorregresion coefficients ot t 2 Z burg order 1    
 [77] <strong>"tGrvAccarCoeffZ,2" </strong>      Autorregresion coefficients ot t 2 Z burg order 2    
 [78] <strong>"tGrvAccarCoeffZ,3" </strong>      Autorregresion coefficients ot t 2 Z burg order 3   
 [79] <strong>"tGrvAccarCoeffZ,4" </strong>      Autorregresion coefficients ot t 2 Z burg order 3     
 [80] <strong>"tGrvAccCorXY"  </strong>          Correlation on t 2  X vs Y    
 [81] <strong>"tGrvAccCorXZ" </strong>           Correlation on t 2  X vs Z   
 [82] <strong>"tGrvAccCorYZ"  </strong>          Correlation on t 2  Y vs Z    
 [83] <strong>"tBdAccJerkMeanX" </strong>            
 [84] <strong>"tBdAccJerkMeanY"  </strong>          
 [85] <strong>"tBdAccJerkMeanZ"  </strong>           
 [86] <strong>"tBdAccJerkStdX" </strong>             
 [87] <strong>"tBdAccJerkStdY" </strong>            
 [88] <strong>"tBdAccJerkStdZ"  </strong>            
 [89] <strong>"tBdAccJerkMedX"  </strong>            
 [90] <strong>"tBdAccJerkMedY"  </strong>           
 [91] <strong>"tBdAccJerkMedZ"  </strong>            
 [92] <strong>"tBdAccJerkMaxX" </strong>             
 [93] <strong>"tBdAccJerkMaxY" </strong>            
 [94] <strong>"tBdAccJerkMaxZ" </strong>             
 [95] <strong>"tBdAccJerkMinX" </strong>             
 [96] <strong>"tBdAccJerkMinY" </strong>            
 [97] <strong>"tBdAccJerkMinZ" </strong>             
 [98] <strong>"tBdAccJerkSma" </strong>              
 [99] <strong>"tBdAccJerkErX"  </strong>            
 [100] <strong>"tBdAccJerkErY"  </strong>             
 [101] <strong>"tBdAccJerkErZ"  </strong>             
 [102] <strong>"tBdAccJerkIqrX" </strong>            
 [103] <strong>"tBdAccJerkIqrY" </strong>             
 [104] <strong>"tBdAccJerkIqrZ"  </strong>            
 [105] <strong>"tBdAccJerkEntropyX" </strong>        
 [106] <strong>"tBdAccJerkEntropyY" </strong>         
 [107] <strong>"tBdAccJerkEntropyZ"  </strong>        
 [108] <strong>"tBdAccJerkarCoeffX,1" </strong>      
 [109] <strong>"tBdAccJerkarCoeffX,2" </strong>       
 [110] <strong>"tBdAccJerkarCoeffX,3" </strong>       
 [111] <strong>"tBdAccJerkarCoeffX,4" </strong>      
 [112] <strong>"tBdAccJerkarCoeffY,1" </strong>       
 [113] <strong>"tBdAccJerkarCoeffY,2" </strong>       
 [114] <strong>"tBdAccJerkarCoeffY,3" </strong>      
 [115] <strong>"tBdAccJerkarCoeffY,4" </strong>       
 [116] <strong>"tBdAccJerkarCoeffZ,1" </strong>       
 [117] <strong>"tBdAccJerkarCoeffZ,2"  </strong>     
 [118] <strong>"tBdAccJerkarCoeffZ,3" </strong>       
 [119] <strong>"tBdAccJerkarCoeffZ,4" </strong>       
 [120] <strong>"tBdAccJerkCorXY"  </strong>          
 [121] <strong>"tBdAccJerkCorXZ"  </strong>           
 [122] <strong>"tBdAccJerkCorYZ"  </strong>           
 [123] <strong>"tBdGyroMeanX"   </strong>             
 [124] <strong>"tBdGyroMeanY"  </strong>              
 [125] <strong>"tBdGyroMeanZ" </strong>               
 [126] <strong>"tBdGyroStdX"  </strong>              
 [127] <strong>"tBdGyroStdY"  </strong>               
 [128] <strong>"tBdGyroStdZ"  </strong>               
 [129] <strong>"tBdGyroMedX"  </strong>              
 [130] <strong>"tBdGyroMedY"  </strong>               
 [131] <strong>"tBdGyroMedZ" </strong>               
 [132] <strong>"tBdGyroMaxX"  </strong>              
 [133] <strong>"tBdGyroMaxY"  </strong>               
 [134] <strong>"tBdGyroMaxZ"  </strong>               
 [135] <strong>"tBdGyroMinX"  </strong>              
 [136] <strong>"tBdGyroMinY"  </strong>               
 [137] <strong>"tBdGyroMinZ" </strong>                
 [138] <strong>"tBdGyroSma"  </strong>               
 [139] <strong>"tBdGyroErX" </strong>                 
 [140] <strong>"tBdGyroErY" </strong>                 
 [141] <strong>"tBdGyroErZ"</strong>                 
 [142] <strong>"tBdGyroIqrX" </strong>                
 [143] <strong>"tBdGyroIqrY"</strong>                 
 [144] <strong>"tBdGyroIqrZ"</strong>                
 [145] <strong>"tBdGyroEntropyX"</strong>             
 [146] <strong>"tBdGyroEntropyY"</strong>             
 [147] <strong>"tBdGyroEntropyZ"</strong>            
 [148] <strong>"tBdGyroarCoeffX,1"</strong>           
 [149] <strong>"tBdGyroarCoeffX,2"</strong>           
 [150] <strong>"tBdGyroarCoeffX,3"</strong>          
 [151] <strong>"tBdGyroarCoeffX,4"</strong>           
 [152] <strong>"tBdGyroarCoeffY,1"</strong>           
 [153] <strong>"tBdGyroarCoeffY,2"</strong>          
 [154] <strong>"tBdGyroarCoeffY,3"</strong>           
 [155] <strong>"tBdGyroarCoeffY,4"</strong>           
 [156] <strong>"tBdGyroarCoeffZ,1"</strong>          
 [157] <strong>"tBdGyroarCoeffZ,2"</strong>           
 [158] <strong>"tBdGyroarCoeffZ,3" </strong>          
 [159] <strong>"tBdGyroarCoeffZ,4" </strong>         
 [160] <strong>"tBdGyroCorXY"</strong>                
 [161] <strong>"tBdGyroCorXZ"</strong>                
 [162] <strong>"tBdGyroCorYZ"</strong>               
 [163] <strong>"tBdGyroJerkMeanX"</strong>            
 [164] <strong>"tBdGyroJerkMeanY"</strong>            
 [165] <strong>"tBdGyroJerkMeanZ"</strong>           
 [166] <strong>"tBdGyroJerkStdX"</strong>             
 [167] <strong>"tBdGyroJerkStdY"</strong>             
 [168] <strong>"tBdGyroJerkStdZ"</strong>            
 [169] <strong>"tBdGyroJerkMedX"</strong>            
 [170] <strong>"tBdGyroJerkMedY"</strong>             
 [171] <strong>"tBdGyroJerkMedZ"</strong>            
 [172] <strong>"tBdGyroJerkMaxX" </strong>            
 [173] <strong>"tBdGyroJerkMaxY"</strong>             
 [174] <strong>"tBdGyroJerkMaxZ"</strong>            
 [175] <strong>"tBdGyroJerkMinX"</strong>             
 [176] <strong>"tBdGyroJerkMinY"</strong>             
 [177] <strong>"tBdGyroJerkMinZ"</strong>            
 [178] <strong>"tBdGyroJerkSma"</strong>              
 [179] <strong>"tBdGyroJerkErX"</strong>              
 [180] <strong>"tBdGyroJerkErY" </strong>            
 [181] <strong>"tBdGyroJerkErZ" </strong>             
 [182] <strong>"tBdGyroJerkIqrX"</strong>             
 [183] <strong>"tBdGyroJerkIqrY"</strong>            
 [184] <strong>"tBdGyroJerkIqrZ"</strong>             
 [185] <strong>"tBdGyroJerkEntropyX"</strong>         
 [186] <strong>"tBdGyroJerkEntropyY"</strong>        
 [187] <strong>"tBdGyroJerkEntropyZ"</strong>         
 [188] <strong>"tBdGyroJerkarCoeffX,1"</strong>       
 [189] <strong>"tBdGyroJerkarCoeffX,2"</strong>      
 [190] <strong>"tBdGyroJerkarCoeffX,3"</strong>       
 [191] <strong>"tBdGyroJerkarCoeffX,4"</strong>       
 [192] <strong>"tBdGyroJerkarCoeffY,1"</strong>      
 [193] <strong>"tBdGyroJerkarCoeffY,2"</strong>       
 [194] <strong>"tBdGyroJerkarCoeffY,3"</strong>       
 [195] <strong>"tBdGyroJerkarCoeffY,4"</strong>      
 [196] <strong>"tBdGyroJerkarCoeffZ,1" </strong>      
 [197] <strong>"tBdGyroJerkarCoeffZ,2"</strong>       
 [198] <strong>"tBdGyroJerkarCoeffZ,3" </strong>     
 [199] <strong>"tBdGyroJerkarCoeffZ,4" </strong>      
 [200] <strong>"tBdGyroJerkCorXY"</strong>            
 [201] <strong>"tBdGyroJerkCorXZ"</strong>           
 [202] <strong>"tBdGyroJerkCorYZ"</strong>            
 [203] <strong>"tBdAccMagMean"</strong>               
 [204] <strong>"tBdAccMagStd"</strong>               
 [205] <strong>"tBdAccMagMed"</strong>                
 [206] <strong>"tBdAccMagMax"</strong>                
 [207] <strong>"tBdAccMagMin"</strong>               
 [208] <strong>"tBdAccMagSma"</strong>                
 [209] <strong>"tBdAccMagEr"</strong>                 
 [210] <strong>"tBdAccMagIqr"</strong>               
 [211] <strong>"tBdAccMagEntropy"</strong>            
 [212] <strong>"tBdAccMagarCoeff1"</strong>           
 [213] <strong>"tBdAccMagarCoeff2"</strong>          
 [214] <strong>"tBdAccMagarCoeff3"</strong>           
 [215] <strong>"tBdAccMagarCoeff4"</strong>           
 [216] <strong>"tGrvAccMagMean"</strong>             
 [217] <strong>"tGrvAccMagStd"</strong>               
 [218] <strong>"tGrvAccMagMed"</strong>               
 [219] <strong>"tGrvAccMagMax" </strong>             
 [220] <strong>"tGrvAccMagMin"</strong>               
 [221] <strong>"tGrvAccMagSma"</strong>               
 [222] <strong>"tGrvAccMagEr" </strong>              
 [223] <strong>"tGrvAccMagIqr" </strong>              
 [224] <strong>"tGrvAccMagEntropy"  </strong>         
 [225] <strong>"tGrvAccMagarCoeff1" </strong>        
 [226] <strong>"tGrvAccMagarCoeff2" </strong>         
 [227] <strong>"tGrvAccMagarCoeff3" </strong>         
 [228] <strong>"tGrvAccMagarCoeff4"</strong>         
 [229] <strong>"tBdAccJerkMagMean"</strong>           
 [230] <strong>"tBdAccJerkMagStd" </strong>           
 [231] <strong>"tBdAccJerkMagMed" </strong>          
 [232] <strong>"tBdAccJerkMagMax" </strong>           
 [233] <strong>"tBdAccJerkMagMin" </strong>           
 [234] <strong>"tBdAccJerkMagSma" </strong>          
 [235] <strong>"tBdAccJerkMagEr" </strong>            
 [236] <strong>"tBdAccJerkMagIqr" </strong>           
 [237] <strong>"tBdAccJerkMagEntropy"</strong>      
 [238] <strong>"tBdAccJerkMagarCoeff1" </strong>      
 [239] <strong>"tBdAccJerkMagarCoeff2" </strong>      
 [240] <strong>"tBdAccJerkMagarCoeff3" </strong>     
 [241] <strong>"tBdAccJerkMagarCoeff4" </strong>      
 [242] <strong>"tBdGyroMagMean"  </strong>            
 [243] <strong>"tBdGyroMagStd" </strong>             
 [244] <strong>"tBdGyroMagMed" </strong>              
 [245] <strong>"tBdGyroMagMax" </strong>              
 [246] <strong>"tBdGyroMagMin" </strong>             
 [247] <strong>"tBdGyroMagSma" </strong>              
 [248] <strong>"tBdGyroMagEr" </strong>               
 [249] <strong>"tBdGyroMagIqr" </strong>             
 [250] <strong>"tBdGyroMagEntropy"</strong>           
 [251] <strong>"tBdGyroMagarCoeff1"</strong>         
 [252] <strong>"tBdGyroMagarCoeff2" </strong>        
 [253] <strong>"tBdGyroMagarCoeff3" </strong>         
 [254] <strong>"tBdGyroMagarCoeff4" </strong>         
 [255] <strong>"tBdGyroJerkMagMean"</strong>         
 [256] <strong>"tBdGyroJerkMagStd" </strong>          
 [257] <strong>"tBdGyroJerkMagMed" </strong>          
 [258] <strong>"tBdGyroJerkMagMax" </strong>         
 [259] <strong>"tBdGyroJerkMagMin"</strong>          
 [260] <strong>"tBdGyroJerkMagSma" </strong>          
 [261] <strong>"tBdGyroJerkMagEr" </strong>          
 [262] <strong>"tBdGyroJerkMagIqr" </strong>          
 [263] <strong>"tBdGyroJerkMagEntropy" </strong>      
 [264] <strong>"tBdGyroJerkMagarCoeff1"</strong>     
 [265] <strong>"tBdGyroJerkMagarCoeff2"</strong>     
 [266] <strong>"tBdGyroJerkMagarCoeff3" </strong>     
 [267] <strong>"tBdGyroJerkMagarCoeff4" </strong>    
 [268] <strong>"fBdAccMeanX"  </strong>               
 [269] <strong>"fBdAccMeanY"  </strong>               
 [270] <strong>"fBdAccMeanZ" </strong>               
 [271] <strong>"fBdAccStdX" </strong>                 
 [272] <strong>"fBdAccStdY" </strong>                 
 [273] <strong>"fBdAccStdZ" </strong>                
 [274] <strong>"fBdAccMedX" </strong>                 
 [275] <strong>"fBdAccMedY" </strong>                 
 [276] <strong>"fBdAccMedZ" </strong>                
 [277] <strong>"fBdAccMaxX" </strong>                 
 [278] <strong>"fBdAccMaxY" </strong>                 
 [279] <strong>"fBdAccMaxZ" </strong>                
 [280] <strong>"fBdAccMinX" </strong>                 
 [281] <strong>"fBdAccMinY" </strong>                 
 [282] <strong>"fBdAccMinZ"</strong>                 
 [283] <strong>"fBdAccSma"  </strong>                 
 [284] <strong>"fBdAccErX"  </strong>                 
 [285] <strong>"fBdAccErY"  </strong>                
 [286] <strong>"fBdAccErZ"  </strong>                 
 [287] <strong>"fBdAccIqrX" </strong>                 
 [288] <strong>"fBdAccIqrY" </strong>                
 [289] <strong>"fBdAccIqrZ" </strong>                 
 [290] <strong>"fBdAccEntropyX" </strong>             
 [291] <strong>"fBdAccEntropyY" </strong>            
 [292] <strong>"fBdAccEntropyZ"  </strong>            
 [293] <strong>"fBdAccMaxIndsX" </strong>             
 [294] <strong>"fBdAccMaxIndsY"  </strong>           
 [295] <strong>"fBdAccMaxIndsZ" </strong>            
 [296] <strong>"fBdAccMeanFreqX" </strong>            
 [297] <strong>"fBdAccMeanFreqY" </strong>           
 [298] <strong>"fBdAccMeanFreqZ" </strong>            
 [299] <strong>"fBdAccskewnessX" </strong>            
 [300] <strong>"fBdAccKurtosisX" </strong>           
 [301] <strong>"fBdAccskewnessY" </strong>            
 [302] <strong>"fBdAccKurtosisY" </strong>            
 [303] <strong>"fBdAccskewnessZ" </strong>           
 [304] <strong>"fBdAccKurtosisZ" </strong>            
 [305] <strong>"fBdAccbandsEnergy-1,8" </strong>      
 [306] <strong>"fBdAccbandsEnergy-9,16"  </strong>   
 [307] <strong>"fBdAccbandsEnergy-17,24" </strong>    
 [308] <strong>"fBdAccbandsEnergy-25,32" </strong>    
 [309] <strong>"fBdAccbandsEnergy-33,40" </strong>   
 [310] <strong>"fBdAccbandsEnergy-41,48" </strong>    
 [311] <strong>"fBdAccbandsEnergy-49,56" </strong>    
 [312] <strong>"fBdAccbandsEnergy-57,64" </strong>   
 [313] <strong><strong>"fBdAccbandsEnergy-1,16"  </strong>    
 [314] <strong>"fBdAccbandsEnergy-17,32"  </strong>   
 [315] <strong>"fBdAccbandsEnergy-33,48" </strong>   
 [316] <strong>"fBdAccbandsEnergy-49,64" </strong>    
 [317] <strong>"fBdAccbandsEnergy-1,24" </strong>     
 [318] <strong>"fBdAccbandsEnergy-25,48" </strong>   
 [319] <strong>"fBdAccJerkMeanX" </strong>            
 [320] <strong>"fBdAccJerkMeanY" </strong>            
 [321] <strong>"fBdAccJerkMeanZ" </strong>           
 [322] <strong>"fBdAccJerkStdX" </strong>             
 [323] <strong>"fBdAccJerkStdY" </strong>             
 [324] <strong>"fBdAccJerkStdZ"  </strong>           
 [325] <strong>"fBdAccJerkMedX"</strong>              
 [326] <strong>"fBdAccJerkMedY" </strong>             
 [327] <strong>"fBdAccJerkMedZ" </strong>            
 [328] <strong>"fBdAccJerkMaxX" </strong>             
 [329] <strong>"fBdAccJerkMaxY" </strong>             
 [330] <strong>"fBdAccJerkMaxZ" </strong>            
 [331] <strong>"fBdAccJerkMinX" </strong>             
 [332] <strong>"fBdAccJerkMinY" </strong>             
 [333] <strong>"fBdAccJerkMinZ" </strong>            
 [334] <strong>"fBdAccJerkSma" </strong>              
 [335] <strong>"fBdAccJerkErX" </strong>              
 [336] <strong>"fBdAccJerkErY" </strong>             
 [337] <strong>"fBdAccJerkErZ" </strong>              
 [338] <strong>"fBdAccJerkIqrX" </strong>             
 [339] <strong>"fBdAccJerkIqrY" </strong>            
 [340] <strong>"fBdAccJerkIqrZ"</strong>              
 [341] <strong>"fBdAccJerkEntropyX" </strong>         
 [342] <strong>"fBdAccJerkEntropyY" </strong>        
 [343] <strong>"fBdAccJerkEntropyZ" </strong>         
 [344] <strong>"fBdAccJerkMaxIndsX" </strong>         
 [345] <strong>"fBdAccJerkMaxIndsY" </strong>        
 [346] <strong>"fBdAccJerkMaxIndsZ" </strong>         
 [347] <strong>"fBdAccJerkMeanFreqX" </strong>        
 [348] <strong>"fBdAccJerkMeanFreqY" </strong>       
 [349] <strong>"fBdAccJerkMeanFreqZ" </strong>        
 [350] <strong>"fBdAccJerkskewnessX" </strong>        
 [351] <strong>"fBdAccJerkKurtosisX" </strong>       
 [352] <strong>"fBdAccJerkskewnessY" </strong>        
 [353] <strong>"fBdAccJerkKurtosisY" </strong>        
 [354] <strong>"fBdAccJerkskewnessZ"</strong>        
 [355] <strong>"fBdAccJerkKurtosisZ"</strong>        
 [356] <strong>"fBdAccJerkbandsEnergy-1,8"  </strong> 
 [357] <strong>"fBdAccJerkbandsEnergy-9,16" </strong>
 [358] <strong>"fBdAccJerkbandsEnergy-17,24" </strong>
 [359] <strong>"fBdAccJerkbandsEnergy-25,32" </strong>
 [360] <strong>"fBdAccJerkbandsEnergy-33,40"</strong>
 [361] <strong>"fBdAccJerkbandsEnergy-41,48"</strong> 
 [362] <strong>"fBdAccJerkbandsEnergy-49,56"</strong> 
 [363] <strong>"fBdAccJerkbandsEnergy-57,64"</strong>
 [364] <strong>"fBdAccJerkbandsEnergy-1,16" </strong> 
 [365] <strong>"fBdAccJerkbandsEnergy-17,32"</strong> 
 [366] <strong>"fBdAccJerkbandsEnergy-33,48"</strong>
 [367] <strong>"fBdAccJerkbandsEnergy-49,64"</strong> 
 [368] <strong>"fBdAccJerkbandsEnergy-1,24" </strong> 
 [369] <strong>"fBdAccJerkbandsEnergy-25,48"</strong>
 [370] <strong>"fBdGyroMeanX"  </strong>              
 [371] <strong>"fBdGyroMeanY" </strong>               
 [372] <strong>"fBdGyroMeanZ" </strong>              
 [373] <strong>"fBdGyroStdX" </strong>                
 [374] <strong>"fBdGyroStdY"</strong>                 
 [375] <strong>"fBdGyroStdZ"</strong>                
 [376] <strong>"fBdGyroMedX"</strong>                 
 [377] <strong>"fBdGyroMedY" </strong>                
 [378] <strong>"fBdGyroMedZ" </strong>               
 [379] <strong>"fBdGyroMaxX" </strong>                
 [380] <strong>"fBdGyroMaxY" </strong>                
 [381] <strong>"fBdGyroMaxZ" </strong>               
 [382] <strong>"fBdGyroMinX" </strong>                
 [383] <strong>"fBdGyroMinY" </strong>                
 [384] <strong>"fBdGyroMinZ" </strong>               
 [385] <strong>"fBdGyroSma"</strong>                  
 [386] <strong>"fBdGyroErX" </strong>                 
 [387] <strong>"fBdGyroErY" </strong>                
 [388] <strong>"fBdGyroErZ" </strong>                
 [389] <strong>"fBdGyroIqrX" </strong>                
 [390] <strong>"fBdGyroIqrY" </strong>               
 [391] <strong>"fBdGyroIqrZ" </strong>                
 [392] <strong>"fBdGyroEntropyX"  </strong>           
 [393] <strong><strong>"fBdGyroEntropyY"  </strong>          
 [394] <strong>"fBdGyroEntropyZ"   </strong>          
 [395] <strong>"fBdGyroMaxIndsX"  </strong>           
 [396] <strong>"fBdGyroMaxIndsY" </strong>           
 [397] <strong>"fBdGyroMaxIndsZ"  </strong>           
 [398] <strong>"fBdGyroMeanFreqX" </strong>           
 [399] <strong>"fBdGyroMeanFreqY" </strong>          
 [400] <strong>"fBdGyroMeanFreqZ"  </strong>          
 [401] <strong>"fBdGyroskewnessX" </strong>           
 [402] <strong>"fBdGyroKurtosisX" </strong>          
 [403] <strong>"fBdGyroskewnessY" </strong>           
 [404] <strong>"fBdGyroKurtosisY" </strong>           
 [405] <strong>"fBdGyroskewnessZ"</strong>           
 [406] <strong>"fBdGyroKurtosisZ" </strong>           
 [407] <strong>"fBdGyrobandsEnergy-1,8" </strong>     
 [408] <strong>"fBdGyrobandsEnergy-9,16"  </strong>  
 [409] <strong>"fBdGyrobandsEnergy-17,24" </strong>   
 [410] <strong>"fBdGyrobandsEnergy-25,32" </strong>   
 [411] <strong>"fBdGyrobandsEnergy-33,40"</strong>   
 [412] <strong>"fBdGyrobandsEnergy-41,48"</strong>    
 [413] <strong>"fBdGyrobandsEnergy-49,56"</strong>    
 [414] <strong>"fBdGyrobandsEnergy-57,64"</strong>   
 [415] <strong>"fBdGyrobandsEnergy-1,16" </strong>    
 [416] <strong>"fBdGyrobandsEnergy-17,32" </strong>   
 [417] <strong>"fBdGyrobandsEnergy-33,48"</strong>   
 [418] <strong>"fBdGyrobandsEnergy-49,64"</strong>    
 [419] <strong>"fBdGyrobandsEnergy-1,24"</strong>     
 [420] <strong>"fBdGyrobandsEnergy-25,48"</strong>   
 [421] <strong>"fBdAccMagMean"</strong>               
 [422] <strong>"fBdAccMagStd" </strong>               
 [423] <strong>"fBdAccMagMed" </strong>              
 [424] <strong>"fBdAccMagMax" </strong>               
 [425] <strong>"fBdAccMagMin" </strong>               
 [426] <strong>"fBdAccMagSma" </strong>              
 [427] <strong>"fBdAccMagEr"  </strong>               
 [428] <strong>"fBdAccMagIqr" </strong>               
 [429] <strong>"fBdAccMagEntropy"</strong>           
 [430] <strong>"fBdAccMagMaxInds" </strong>           
 [431] <strong>"fBdAccMagMeanFreq" </strong>          
 [432] <strong>"fBdAccMagskewness"</strong>         
 [433] <strong>"fBdAccMagKurtosis"</strong>          
 [434] <strong>"fBdBdAccJerkMagMean"  </strong>       
 [435] <strong>"fBdBdAccJerkMagStd"</strong>         
 [436] <strong>"fBdBdAccJerkMagMed" </strong>         
 [437] <strong>"fBdBdAccJerkMagMax" </strong>         
 [438] <strong>"fBdBdAccJerkMagMin"</strong>         
 [439] <strong>"fBdBdAccJerkMagSma" </strong>         
 [440] <strong>"fBdBdAccJerkMagEr" </strong>          
 [441] <strong>"fBdBdAccJerkMagIqr" </strong>        
 [442] <strong>"fBdBdAccJerkMagEntropy"  </strong>    
 [443] <strong>"fBdBdAccJerkMagMaxInds" </strong>     
 [444] <strong>"fBdBdAccJerkMagMeanFreq"</strong>    
 [445] <strong>"fBdBdAccJerkMagskewness"</strong>     
 [446] <strong>"fBdBdAccJerkMagKurtosis"</strong>     
 [447] <strong>"fBdBdGyroMagMean" </strong>          
 [448] <strong>"fBdBdGyroMagStd" </strong>            
 [449] <strong>"fBdBdGyroMagMed" </strong>            
 [450] <strong>"fBdBdGyroMagMax" </strong>           
 [451] <strong>"fBdBdGyroMagMin"</strong>             
 [452] <strong>"fBdBdGyroMagSma"</strong>             
 [453] <strong>"fBdBdGyroMagEr" </strong>            
 [454] <strong>"fBdBdGyroMagIqr"  </strong>           
 [455] <strong>"fBdBdGyroMagEntropy" </strong>        
 [456] <strong>"fBdBdGyroMagMaxInds" </strong>       
 [457] <strong>"fBdBdGyroMagMeanFreq" </strong>       
 [458] <strong>"fBdBdGyroMagskewness" </strong>       
 [459] <strong>"fBdBdGyroMagKurtosis" </strong>      
 [460] <strong>"fBdBdGyroJerkMagMean" </strong>       
 [461] <strong>"fBdBdGyroJerkMagStd" </strong>        
 [462] <strong>"fBdBdGyroJerkMagMed"</strong>        
 [463] <strong>"fBdBdGyroJerkMagMax"</strong>         
 [464] <strong>"fBdBdGyroJerkMagMin"</strong>         
 [465] <strong>"fBdBdGyroJerkMagSma" </strong>       
 [466] <strong>"fBdBdGyroJerkMagEr" </strong>         
 [467] <strong>"fBdBdGyroJerkMagIqr" </strong>        
 [468] <strong>"fBdBdGyroJerkMagEntropy" </strong>   
 [469] <strong>"fBdBdGyroJerkMagMaxInds" </strong>    
 [470] <strong>"fBdBdGyroJerkMagMeanFreq"</strong>    
 [471] <strong>"fBdBdGyroJerkMagskewness" </strong>  
 [472] <strong>"fBdBdGyroJerkMagKurtosis"  </strong>  
 [473] <strong>"AngtBdAccMeanGrv" </strong>           
 [474] <strong>"AngtBdAccJerkMeanGrvMean" </strong>  
 [475] <strong>"AngtBdGyroMeanGrvMean" </strong>      
 [476] <strong>"AngtBdGyroJerkMeanGrvMean"  </strong> 
 [477] <strong>"AngXGrvMean" </strong>               
 [478] <strong>"AngYGrvMean" </strong>               
 [478] <strong>"AngZGrvMean" </strong>               

