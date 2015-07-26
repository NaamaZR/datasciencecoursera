<h1>CodeBook by Naama Rubin</h1>
<h3>
Data was downloaded from: </br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</br>
also called the "Samsung Data"
</h2>

<h2>
The features selected for this database come from the accelerometer and gyroscope</br> 
</h2>
<p>
There are 3-axial raw signals <strong>tAcc-XYZ</strong> and <strong>tGyro-XYZ</strong>.</br> 
<strong>We are expecting two main measures </br>
"Acc" for accelerometer</br> 
"Gyro" for gyroscope </br>
each in 3 coloumns for X,Y,Z.</strong></br>
</p>

<p>
These time domain signals (prefix 't' to denote time)</br> 
were captured at a constant rate of 50 Hz.</br> 
Then they were filtered using a median filter 
and a 3rd order low pass Butterworth filter</br> 
with a corner frequency of 20 Hz to remove noise.</br> 
</p>

<p>
<strong>
The acceleration signal was further splitted into two</br>  
internal acceleration components,</br>
body and  gravity.</br>
"Body" denote as "Bd", "Gravity" as "Grv" </strong></br>
this was done using another low pass</br> 
Butterworth filter with a corner frequency of 0.3 Hz.</br> 
tBdAcc-XYZ and tGrvAcc-XYZ</br>
</p>

<p>
Subsequently, the body linear acceleration and angular velocity (gyro)</br>
were derived in time to obtain Jerk signals 
(diff was done on it, e.g. subtract).</br>
tBdAccJerk-XYZ and tBdGyroJerk-XYZ</br>
</p>

<p>
Magnitude of these three-dimensional signals</br> 
were calculated using the Euclidean norm</br>
tBdAccMag, tGrvAccMag, tBdAccJerkMag, tBdGyroMag, tBdGyroJerkMag.</br> 
</p>

<p>
These signals were used to estimate variables of the feature vector for each pattern: </br> 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.</br>
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
Fast Fourier Transform (FFT) was applied to some of these signals producing</br> 
 <strong>fBdAcc-XYZ, fBdAccJerk-XYZ, fBdGyro-XYZ, fBdAccJerkMag, fBdGyroMag, fBdGyroJerkMag </strong>.</br>
'f' is to indicate frequency domain signals.</br> 
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
Measures that were calculated from freq domain siganls:</br>
maxInds():          index of the frequency component with largest magnitude</br>
meanFreq():        Weighted average of the frequency components to obtain a mean frequency</br>
skewness():          skewness of the frequency domain signal </br>
kurtosis():               kurtosis of the frequency domain signal </br>
bandsEnergy():      Energy of a frequency interval within the 64 bins of the FFT of each window.</br>
</p>
<p>
Measures on two signals
correlation():     correlation coefficient between two signals, </br>
this will denote with two upercase axial dims at end, e.g. "tGrvAccCorXZ"  </br>    
angle():                    Angle between two vectors.</br>
</p>

<p>
Additional vectors obtained by averaging the signals in a signal window sample. </br>
These are used on the angle() variable:
</br>
gravityMean</br>
tBodyAccMean</br>
tBodyAccJerkMean</br>
tBodyGyroMean</br>
</p>

<p>
Two ID variables were added :
"Subject"                              30 participents</br>                
"Activity"                             6 activities </br>   
</p>

<h4>
The complete list of variables:
</h4>

 [1]  <strong>"Subject" </strong>       30 participents in expriment  were label by running ind from 1 to 30 </br>                
 [2]  <strong>"Activity"  </strong>        	6 activities were labled: "Walk", "WalkUpS", "WakDn", "Sit", "Stand", "Lay"</br>    
 [3]  <strong>"tBdAccMeanX" </strong>      	mean on t 1 (upper list, time) X axis  </br>          
 [4]  <strong>"tBdAccMeanY" </strong>      	mean on t 1 Y axis   </br>          
 [5]  <strong>"tBdAccMeanZ" </strong>      	mean on t 1 Z axis </br>               
 [6]  <strong>"tBdAccStdX"  </strong>      	std on t 1 X axis  </br>             
 [7]  <strong>"tBdAccStdY"  </strong>      	std on t 1 Y axis </br>           
 [8]  <strong>"tBdAccStdZ" </strong>       	std on t 1 Z axis </br>           
 [9]  <strong>"tBdAccMedX" </strong>       	median on t 1 X axis </br>             
 [10] <strong>"tBdAccMedY" </strong>       	median on t 1 Y axis</br>             
 [11] <strong>"tBdAccMedZ" </strong>      	median on t 1 Z axis </br>           
 [12] <strong>"tBdAccMaxX" </strong>     	max val on t 1 X axis </br>              
 [13] <strong>"tBdAccMaxY" </strong>     	max val on t 1 Y axis </br>            
 [14] <strong>"tBdAccMaxZ"  </strong>    	max val on t 1 Z axis</br>          
 [15] <strong>"tBdAccMinX"  </strong>    	min val on t 1 X axis </br>             
 [16] <strong>"tBdAccMinY"  </strong>    	min val on t 1 X axis</br>           
 [17] <strong>"tBdAccMinZ"  </strong>    	min val on t 1 X axis </br>           
 [18] <strong>"tBdAccSma"    </strong>     	Signal Magintude Area on t 1 all axis  </br>         
 [19] <strong>"tBdAccErX"    </strong>      	Energy measure on t 1 X axis </br>              
 [20] <strong>"tBdAccErY"    </strong>      	Energy measure on t 1 Y axis </br>              
 [21] <strong>"tBdAccErZ"    </strong>      	Energy measure on t 1 Z axis </br>              
 [22] <strong>"tBdAccIqrX"   </strong>     	IQR  on t 1 X axis </br>           
 [23] <strong>"tBdAccIqrY"   </strong>     	 IQR  on t 1 Y axis </br>           
 [24] <strong>"tBdAccIqrZ"   </strong>     	 IQR  on t 1 Z axis </br>          
 [25] <strong>"tBdAccEntropyX"</strong>          Entropy  on t 1 X axis </br>  
 [26] <strong>"tBdAccEntropyY"  </strong>        Entropy  on t 1 Y axis</br>    
 [27] <strong>"tBdAccEntropyZ"  </strong>        Entropy  on t 1 Z axis </br>  
 [28] <strong>"tBdAccarCoeffX,1" </strong>       Autorregresion coefficients on t 1 X burg order 1 </br>   
 [29] <strong>"tBdAccarCoeffX,2" </strong>       Autorregresion coefficients on t 1 X burg order 2</br>     
 [30] <strong>"tBdAccarCoeffX,3" </strong>       Autorregresion coefficients on t 1 X burg order 3</br>    
 [31] <strong>"tBdAccarCoeffX,4" </strong>       Autorregresion coefficients on t 1 X burg order 4</br>    
 [32] <strong>"tBdAccarCoeffY,1" </strong>       Autorregresion coefficients on t 1 Y burg order 1</br>    
 [33] <strong>"tBdAccarCoeffY,2" </strong>       Autorregresion coefficients on t 1 Y burg order 2</br>   
 [34] <strong>"tBdAccarCoeffY,3"  </strong>      Autorregresion coefficients on t 1 Y burg order 3 </br>   
 [35] <strong>"tBdAccarCoeffY,4"  </strong>      Autorregresion coefficients on t 1 Y burg order 4</br>    
 [36] <strong>"tBdAccarCoeffZ,1" </strong>       Autorregresion coefficients on t 1 Z burg order 1</br>   
 [37] <strong>"tBdAccarCoeffZ,2" </strong>       Autorregresion coefficients on t 1 Z burg order 2</br>    
 [38] <strong>"tBdAccarCoeffZ,3" </strong>       Autorregresion coefficients on t 1 Z burg order 3</br>    
 [39] <strong>"tBdAccarCoeffZ,4" </strong>       Autorregresion coefficients on t 1 Z burg order 4</br>   
 [40] <strong>"tBdAccCorXY"   </strong>          Correlation on t 1  X vs Y </br>   
 [41] <strong>"tBdAccCorXZ"   </strong>          Correlation on t 1  X vs Z </br>   
 [42] <strong>"tBdAccCorYZ"   </strong>          Correlation on t 1  Y vs Z </br> 
 [43] <strong>"tGrvAccMeanX"   </strong>         mean on t 2 (upper list, time) X axis </br>   
 [44] <strong>"tGrvAccMeanY"  </strong>          mean on t 2  Y axis</br>    
 [45] <strong>"tGrvAccMeanZ"  </strong>          mean on t 2  Z axis</br>   
 [46] <strong>"tGrvAccStdX" </strong>            std on t 2  X axis </br>   
 [47] <strong>"tGrvAccStdY" </strong>            std on t 2  Y axis </br>   
 [48] <strong>"tGrvAccStdZ" </strong>            std on t 2  Z axis </br>  
 [49] <strong>"tGrvAccMedX" </strong>            median on t 2  X axis</br>     
 [50] <strong>"tGrvAccMedY" </strong>            median on t 2  Y axis</br>     
 [51] <strong>"tGrvAccMedZ" </strong>            median on t 2  Z axis</br>    
 [52] <strong>"tGrvAccMaxX" </strong>            max val on t 2 X axis </br>   
 [53] <strong>"tGrvAccMaxY" </strong>            max val on t 2 Y axis</br>   
 [54] <strong>"tGrvAccMaxZ" </strong>            max val on t 2 Z axis</br>  
 [55] <strong>"tGrvAccMinX" </strong>            min val on t 2 X axis</br>    
 [56] <strong>"tGrvAccMinY" </strong>            min val on t 2 Y axis</br>    
 [57] <strong>"tGrvAccMinZ" </strong>            min val on t 2 Z axis</br>   
 [58] <strong>"tGrvAccSma"  </strong>            Signal Magintude Area on t 2 all axis</br>    
 [59] <strong>"tGrvAccErX" </strong>             Energy measure on t 2 X axis</br>    
 [60] <strong>"tGrvAccErY" </strong>             Energy measure on t 2 Y axis </br>  
 [61] <strong>"tGrvAccErZ" </strong>		 Energy measure on t 2 Z axis</br>
 [62] <strong>"tGrvAccIqrX" </strong>            IQR  on t 2 X axis</br>   
 [63] <strong>"tGrvAccIqrY" </strong>            IQR  on t 2 Y axis </br>  
 [64] <strong>"tGrvAccIqrZ" </strong>            IQR  on t 2 Z axis</br>    
 [65] <strong>"tGrvAccEntropyX" </strong>        Entropy  on t 2 X axis </br>   
 [66] <strong>"tGrvAccEntropyY" </strong>        Entropy  on t 2 Y axis </br>  
 [67] <strong>"tGrvAccEntropyZ"  </strong>       Entropy  on t 2 Z axis </br>  
 [68] <strong>"tGrvAccarCoeffX,1" </strong>      Autorregresion coefficients on t 2 X burg order 1</br>    
 [69] <strong>"tGrvAccarCoeffX,2" </strong>      Autorregresion coefficients on t 2 X burg order 2</br>   
 [70] <strong>"tGrvAccarCoeffX,3" </strong>      Autorregresion coefficients on t 2 X burg order 3</br>    
 [71] <strong>"tGrvAccarCoeffX,4" </strong>      Autorregresion coefficients on t 2 X burg order 4</br>   
 [72] <strong>"tGrvAccarCoeffY,1" </strong>      Autorregresion coefficients on t 2 Y burg order 1</br>   
 [73] <strong>"tGrvAccarCoeffY,2" </strong>      Autorregresion coefficients on t 2 Y burg order 2</br>    
 [74] <strong>"tGrvAccarCoeffY,3" </strong>      Autorregresion coefficients on t 2 Y burg order 3</br>    
 [75] <strong>"tGrvAccarCoeffY,4" </strong>      Autorregresion coefficients on t 2 Y burg order 4</br>   
 [76] <strong>"tGrvAccarCoeffZ,1" </strong>      Autorregresion coefficients on t 2 Z burg order 1</br>    
 [77] <strong>"tGrvAccarCoeffZ,2" </strong>      Autorregresion coefficients on t 2 Z burg order 2</br>    
 [78] <strong>"tGrvAccarCoeffZ,3" </strong>      Autorregresion coefficients on t 2 Z burg order 3</br>   
 [79] <strong>"tGrvAccarCoeffZ,4" </strong>      Autorregresion coefficients on t 2 Z burg order 3</br>     
 [80] <strong>"tGrvAccCorXY"  </strong>          Correlation on t 2  X vs Y </br>   
 [81] <strong>"tGrvAccCorXZ" </strong>           Correlation on t 2  X vs Z </br>  
 [82] <strong>"tGrvAccCorYZ"  </strong>          Correlation on t 2  Y vs Z </br>   
 [83] <strong>"tBdAccJerkMeanX" </strong></br>            
 [84] <strong>"tBdAccJerkMeanY"  </strong></br>          
 [85] <strong>"tBdAccJerkMeanZ"  </strong></br>           
 [86] <strong>"tBdAccJerkStdX" </strong></br>             
 [87] <strong>"tBdAccJerkStdY" </strong></br>            
 [88] <strong>"tBdAccJerkStdZ"  </strong></br>            
 [89] <strong>"tBdAccJerkMedX"  </strong></br>            
 [90] <strong>"tBdAccJerkMedY"  </strong></br>           
 [91] <strong>"tBdAccJerkMedZ"  </strong></br>            
 [92] <strong>"tBdAccJerkMaxX" </strong></br>             
 [93] <strong>"tBdAccJerkMaxY" </strong></br>            
 [94] <strong>"tBdAccJerkMaxZ" </strong></br>             
 [95] <strong>"tBdAccJerkMinX" </strong></br>             
 [96] <strong>"tBdAccJerkMinY" </strong></br>            
 [97] <strong>"tBdAccJerkMinZ" </strong></br>             
 [98] <strong>"tBdAccJerkSma" </strong></br>              
 [99] <strong>"tBdAccJerkErX"  </strong></br>            
 [100] <strong>"tBdAccJerkErY"  </strong></br>             
 [101] <strong>"tBdAccJerkErZ"  </strong></br>             
 [102] <strong>"tBdAccJerkIqrX" </strong></br>            
 [103] <strong>"tBdAccJerkIqrY" </strong></br>             
 [104] <strong>"tBdAccJerkIqrZ"  </strong></br>            
 [105] <strong>"tBdAccJerkEntropyX" </strong></br>        
 [106] <strong>"tBdAccJerkEntropyY" </strong></br>         
 [107] <strong>"tBdAccJerkEntropyZ"  </strong></br>        
 [108] <strong>"tBdAccJerkarCoeffX,1" </strong></br>      
 [109] <strong>"tBdAccJerkarCoeffX,2" </strong></br>       
 [110] <strong>"tBdAccJerkarCoeffX,3" </strong></br>       
 [111] <strong>"tBdAccJerkarCoeffX,4" </strong></br>      
 [112] <strong>"tBdAccJerkarCoeffY,1" </strong></br>       
 [113] <strong>"tBdAccJerkarCoeffY,2" </strong></br>       
 [114] <strong>"tBdAccJerkarCoeffY,3" </strong></br>      
 [115] <strong>"tBdAccJerkarCoeffY,4" </strong></br>       
 [116] <strong>"tBdAccJerkarCoeffZ,1" </strong></br>       
 [117] <strong>"tBdAccJerkarCoeffZ,2"  </strong></br>     
 [118] <strong>"tBdAccJerkarCoeffZ,3" </strong></br>       
 [119] <strong>"tBdAccJerkarCoeffZ,4" </strong></br>       
 [120] <strong>"tBdAccJerkCorXY"  </strong> </br>         
 [121] <strong>"tBdAccJerkCorXZ"  </strong></br>           
 [122] <strong>"tBdAccJerkCorYZ"  </strong></br>           
 [123] <strong>"tBdGyroMeanX"   </strong></br>             
 [124] <strong>"tBdGyroMeanY"  </strong></br>              
 [125] <strong>"tBdGyroMeanZ" </strong></br>               
 [126] <strong>"tBdGyroStdX"  </strong></br>              
 [127] <strong>"tBdGyroStdY"  </strong></br>               
 [128] <strong>"tBdGyroStdZ"  </strong> </br>              
 [129] <strong>"tBdGyroMedX"  </strong></br>              
 [130] <strong>"tBdGyroMedY"  </strong> </br>              
 [131] <strong>"tBdGyroMedZ" </strong></br>               
 [132] <strong>"tBdGyroMaxX"  </strong></br>              
 [133] <strong>"tBdGyroMaxY"  </strong></br>              
 [134] <strong>"tBdGyroMaxZ"  </strong></br>               
 [135] <strong>"tBdGyroMinX"  </strong></br>              
 [136] <strong>"tBdGyroMinY"  </strong></br>               
 [137] <strong>"tBdGyroMinZ" </strong></br>                
 [138] <strong>"tBdGyroSma"  </strong></br>               
 [139] <strong>"tBdGyroErX" </strong></br>                 
 [140] <strong>"tBdGyroErY" </strong></br>                 
 [141] <strong>"tBdGyroErZ"</strong></br>                 
 [142] <strong>"tBdGyroIqrX" </strong> </br>               
 [143] <strong>"tBdGyroIqrY"</strong></br>                 
 [144] <strong>"tBdGyroIqrZ"</strong></br>                
 [145] <strong>"tBdGyroEntropyX"</strong> </br>            
 [146] <strong>"tBdGyroEntropyY"</strong></br>             
 [147] <strong>"tBdGyroEntropyZ"</strong> </br>           
 [148] <strong>"tBdGyroarCoeffX,1"</strong> </br>         
 [149] <strong>"tBdGyroarCoeffX,2"</strong></br>           
 [150] <strong>"tBdGyroarCoeffX,3"</strong></br>          
 [151] <strong>"tBdGyroarCoeffX,4"</strong></br>           
 [152] <strong>"tBdGyroarCoeffY,1"</strong></br>           
 [153] <strong>"tBdGyroarCoeffY,2"</strong></br>          
 [154] <strong>"tBdGyroarCoeffY,3"</strong></br>           
 [155] <strong>"tBdGyroarCoeffY,4"</strong></br>           
 [156] <strong>"tBdGyroarCoeffZ,1"</strong></br>          
 [157] <strong>"tBdGyroarCoeffZ,2"</strong></br>           
 [158] <strong>"tBdGyroarCoeffZ,3" </strong></br>          
 [159] <strong>"tBdGyroarCoeffZ,4" </strong></br>         
 [160] <strong>"tBdGyroCorXY"</strong> </br>               
 [161] <strong>"tBdGyroCorXZ"</strong></br>                
 [162] <strong>"tBdGyroCorYZ"</strong></br>               
 [163] <strong>"tBdGyroJerkMeanX"</strong></br>            
 [164] <strong>"tBdGyroJerkMeanY"</strong></br>            
 [165] <strong>"tBdGyroJerkMeanZ"</strong></br>           
 [166] <strong>"tBdGyroJerkStdX"</strong></br>             
 [167] <strong>"tBdGyroJerkStdY"</strong></br>             
 [168] <strong>"tBdGyroJerkStdZ"</strong></br>            
 [169] <strong>"tBdGyroJerkMedX"</strong></br>            
 [170] <strong>"tBdGyroJerkMedY"</strong></br>             
 [171] <strong>"tBdGyroJerkMedZ"</strong></br>            
 [172] <strong>"tBdGyroJerkMaxX" </strong> </br>           
 [173] <strong>"tBdGyroJerkMaxY"</strong></br>             
 [174] <strong>"tBdGyroJerkMaxZ"</strong></br>            
 [175] <strong>"tBdGyroJerkMinX"</strong></br>             
 [176] <strong>"tBdGyroJerkMinY"</strong></br>             
 [177] <strong>"tBdGyroJerkMinZ"</strong></br>            
 [178] <strong>"tBdGyroJerkSma"</strong></br>              
 [179] <strong>"tBdGyroJerkErX"</strong></br>              
 [180] <strong>"tBdGyroJerkErY" </strong> </br>           
 [181] <strong>"tBdGyroJerkErZ" </strong></br>             
 [182] <strong>"tBdGyroJerkIqrX"</strong></br>             
 [183] <strong>"tBdGyroJerkIqrY"</strong></br>            
 [184] <strong>"tBdGyroJerkIqrZ"</strong></br>             
 [185] <strong>"tBdGyroJerkEntropyX"</strong></br>        
 [186] <strong>"tBdGyroJerkEntropyY"</strong></br>        
 [187] <strong>"tBdGyroJerkEntropyZ"</strong></br>         
 [188] <strong>"tBdGyroJerkarCoeffX,1"</strong></br>       
 [189] <strong>"tBdGyroJerkarCoeffX,2"</strong></br>      
 [190] <strong>"tBdGyroJerkarCoeffX,3"</strong></br>       
 [191] <strong>"tBdGyroJerkarCoeffX,4"</strong></br>       
 [192] <strong>"tBdGyroJerkarCoeffY,1"</strong></br>      
 [193] <strong>"tBdGyroJerkarCoeffY,2"</strong></br>       
 [194] <strong>"tBdGyroJerkarCoeffY,3"</strong></br>      
 [195] <strong>"tBdGyroJerkarCoeffY,4"</strong> </br>     
 [196] <strong>"tBdGyroJerkarCoeffZ,1" </strong> </br>     
 [197] <strong>"tBdGyroJerkarCoeffZ,2"</strong> </br>      
 [198] <strong>"tBdGyroJerkarCoeffZ,3" </strong></br>    
 [199] <strong>"tBdGyroJerkarCoeffZ,4" </strong></br>      
 [200] <strong>"tBdGyroJerkCorXY"</strong></br>            
 [201] <strong>"tBdGyroJerkCorXZ"</strong> </br>          
 [202] <strong>"tBdGyroJerkCorYZ"</strong></br>            
 [203] <strong>"tBdAccMagMean"</strong> </br>              
 [204] <strong>"tBdAccMagStd"</strong></br>               
 [205] <strong>"tBdAccMagMed"</strong></br>                
 [206] <strong>"tBdAccMagMax"</strong></br>                
 [207] <strong>"tBdAccMagMin"</strong></br>               
 [208] <strong>"tBdAccMagSma"</strong></br>                
 [209] <strong>"tBdAccMagEr"</strong></br>                 
 [210] <strong>"tBdAccMagIqr"</strong> </br>              
 [211] <strong>"tBdAccMagEntropy"</strong></br>            
 [212] <strong>"tBdAccMagarCoeff1"</strong></br>           
 [213] <strong>"tBdAccMagarCoeff2"</strong></br>          
 [214] <strong>"tBdAccMagarCoeff3"</strong></br>           
 [215] <strong>"tBdAccMagarCoeff4"</strong></br>           
 [216] <strong>"tGrvAccMagMean"</strong></br>             
 [217] <strong>"tGrvAccMagStd"</strong></br>               
 [218] <strong>"tGrvAccMagMed"</strong></br>               
 [219] <strong>"tGrvAccMagMax" </strong></br>            
 [220] <strong>"tGrvAccMagMin"</strong></br>               
 [221] <strong>"tGrvAccMagSma"</strong></br>               
 [222] <strong>"tGrvAccMagEr" </strong></br>              
 [223] <strong>"tGrvAccMagIqr" </strong></br>              
 [224] <strong>"tGrvAccMagEntropy"  </strong></br>         
 [225] <strong>"tGrvAccMagarCoeff1" </strong></br>        
 [226] <strong>"tGrvAccMagarCoeff2" </strong></br>         
 [227] <strong>"tGrvAccMagarCoeff3" </strong></br>         
 [228] <strong>"tGrvAccMagarCoeff4"</strong></br>         
 [229] <strong>"tBdAccJerkMagMean"</strong></br>           
 [230] <strong>"tBdAccJerkMagStd" </strong></br>           
 [231] <strong>"tBdAccJerkMagMed" </strong></br>          
 [232] <strong>"tBdAccJerkMagMax" </strong></br>           
 [233] <strong>"tBdAccJerkMagMin" </strong></br>           
 [234] <strong>"tBdAccJerkMagSma" </strong></br>          
 [235] <strong>"tBdAccJerkMagEr" </strong></br>            
 [236] <strong>"tBdAccJerkMagIqr" </strong></br>           
 [237] <strong>"tBdAccJerkMagEntropy"</strong></br>      
 [238] <strong>"tBdAccJerkMagarCoeff1" </strong></br>      
 [239] <strong>"tBdAccJerkMagarCoeff2" </strong></br>      
 [240] <strong>"tBdAccJerkMagarCoeff3" </strong></br>     
 [241] <strong>"tBdAccJerkMagarCoeff4" </strong></br>      
 [242] <strong>"tBdGyroMagMean"  </strong></br>            
 [243] <strong>"tBdGyroMagStd" </strong> </br>            
 [244] <strong>"tBdGyroMagMed" </strong></br>              
 [245] <strong>"tBdGyroMagMax" </strong></br>              
 [246] <strong>"tBdGyroMagMin" </strong></br>             
 [247] <strong>"tBdGyroMagSma" </strong></br>              
 [248] <strong>"tBdGyroMagEr" </strong></br>               
 [249] <strong>"tBdGyroMagIqr" </strong></br>             
 [250] <strong>"tBdGyroMagEntropy"</strong></br>           
 [251] <strong>"tBdGyroMagarCoeff1"</strong>         
 [252] <strong>"tBdGyroMagarCoeff2" </strong></br>        
 [253] <strong>"tBdGyroMagarCoeff3" </strong></br>         
 [254] <strong>"tBdGyroMagarCoeff4" </strong></br>         
 [255] <strong>"tBdGyroJerkMagMean"</strong></br>         
 [256] <strong>"tBdGyroJerkMagStd" </strong></br>          
 [257] <strong>"tBdGyroJerkMagMed" </strong></br>          
 [258] <strong>"tBdGyroJerkMagMax" </strong></br>         
 [259] <strong>"tBdGyroJerkMagMin"</strong></br>          
 [260] <strong>"tBdGyroJerkMagSma" </strong></br>          
 [261] <strong>"tBdGyroJerkMagEr" </strong></br>          
 [262] <strong>"tBdGyroJerkMagIqr" </strong></br>          
 [263] <strong>"tBdGyroJerkMagEntropy" </strong></br>      
 [264] <strong>"tBdGyroJerkMagarCoeff1"</strong></br>     
 [265] <strong>"tBdGyroJerkMagarCoeff2"</strong></br>     
 [266] <strong>"tBdGyroJerkMagarCoeff3" </strong></br>     
 [267] <strong>"tBdGyroJerkMagarCoeff4" </strong> </br>   
 [268] <strong>"fBdAccMeanX"  </strong> </br>              
 [269] <strong>"fBdAccMeanY"  </strong></br>               
 [270] <strong>"fBdAccMeanZ" </strong></br>               
 [271] <strong>"fBdAccStdX" </strong></br>                 
 [272] <strong>"fBdAccStdY" </strong></br>                 
 [273] <strong>"fBdAccStdZ" </strong></br>                
 [274] <strong>"fBdAccMedX" </strong></br>                 
 [275] <strong>"fBdAccMedY" </strong></br>                 
 [276] <strong>"fBdAccMedZ" </strong></br>                
 [277] <strong>"fBdAccMaxX" </strong></br>                 
 [278] <strong>"fBdAccMaxY" </strong></br>                 
 [279] <strong>"fBdAccMaxZ" </strong></br>                
 [280] <strong>"fBdAccMinX" </strong></br>                 
 [281] <strong>"fBdAccMinY" </strong></br>                 
 [282] <strong>"fBdAccMinZ"</strong></br>                 
 [283] <strong>"fBdAccSma"  </strong></br>                 
 [284] <strong>"fBdAccErX"  </strong></br>                 
 [285] <strong>"fBdAccErY"  </strong></br>                
 [286] <strong>"fBdAccErZ"  </strong></br>                 
 [287] <strong>"fBdAccIqrX" </strong></br>                 
 [288] <strong>"fBdAccIqrY" </strong></br>                
 [289] <strong>"fBdAccIqrZ" </strong></br>                 
 [290] <strong>"fBdAccEntropyX" </strong></br>             
 [291] <strong>"fBdAccEntropyY" </strong></br>            
 [292] <strong>"fBdAccEntropyZ"  </strong></br>            
 [293] <strong>"fBdAccMaxIndsX" </strong></br>             
 [294] <strong>"fBdAccMaxIndsY"  </strong></br>           
 [295] <strong>"fBdAccMaxIndsZ" </strong></br>            
 [296] <strong>"fBdAccMeanFreqX" </strong></br>            
 [297] <strong>"fBdAccMeanFreqY" </strong></br>           
 [298] <strong>"fBdAccMeanFreqZ" </strong></br>            
 [299] <strong>"fBdAccskewnessX" </strong></br>            
 [300] <strong>"fBdAccKurtosisX" </strong></br>           
 [301] <strong>"fBdAccskewnessY" </strong></br>            
 [302] <strong>"fBdAccKurtosisY" </strong></br>            
 [303] <strong>"fBdAccskewnessZ" </strong></br>           
 [304] <strong>"fBdAccKurtosisZ" </strong></br>            
 [305] <strong>"fBdAccbandsEnergy-1,8" </strong></br>      
 [306] <strong>"fBdAccbandsEnergy-9,16"  </strong></br>   
 [307] <strong>"fBdAccbandsEnergy-17,24" </strong></br>    
 [308] <strong>"fBdAccbandsEnergy-25,32" </strong></br>    
 [309] <strong>"fBdAccbandsEnergy-33,40" </strong></br>   
 [310] <strong>"fBdAccbandsEnergy-41,48" </strong></br>    
 [311] <strong>"fBdAccbandsEnergy-49,56" </strong></br>    
 [312] <strong>"fBdAccbandsEnergy-57,64" </strong></br>   
 [313] <strong>"fBdAccbandsEnergy-1,16"  </strong></br>    
 [314] <strong>"fBdAccbandsEnergy-17,32"  </strong></br>   
 [315] <strong>"fBdAccbandsEnergy-33,48" </strong></br>   
 [316] <strong>"fBdAccbandsEnergy-49,64" </strong></br>    
 [317] <strong>"fBdAccbandsEnergy-1,24" </strong></br>     
 [318] <strong>"fBdAccbandsEnergy-25,48" </strong> </br>  
 [319] <strong>"fBdAccJerkMeanX" </strong></br>            
 [320] <strong>"fBdAccJerkMeanY" </strong></br>            
 [321] <strong>"fBdAccJerkMeanZ" </strong></br>          
 [322] <strong>"fBdAccJerkStdX" </strong> </br>            
 [323] <strong>"fBdAccJerkStdY" </strong> </br>            
 [324] <strong>"fBdAccJerkStdZ"  </strong>           
 [325] <strong>"fBdAccJerkMedX"</strong></br>              
 [326] <strong>"fBdAccJerkMedY" </strong></br>             
 [327] <strong>"fBdAccJerkMedZ" </strong></br>            
 [328] <strong>"fBdAccJerkMaxX" </strong></br>             
 [329] <strong>"fBdAccJerkMaxY" </strong></br>             
 [330] <strong>"fBdAccJerkMaxZ" </strong></br>            
 [331] <strong>"fBdAccJerkMinX" </strong></br>             
 [332] <strong>"fBdAccJerkMinY" </strong></br>             
 [333] <strong>"fBdAccJerkMinZ" </strong> </br>           
 [334] <strong>"fBdAccJerkSma" </strong> </br>             
 [335] <strong>"fBdAccJerkErX" </strong></br>              
 [336] <strong>"fBdAccJerkErY" </strong> </br>            
 [337] <strong>"fBdAccJerkErZ" </strong></br>              
 [338] <strong>"fBdAccJerkIqrX" </strong></br>             
 [339] <strong>"fBdAccJerkIqrY" </strong></br>            
 [340] <strong>"fBdAccJerkIqrZ"</strong></br>              
 [341] <strong>"fBdAccJerkEntropyX" </strong></br>         
 [342] <strong>"fBdAccJerkEntropyY" </strong></br>        
 [343] <strong>"fBdAccJerkEntropyZ" </strong></br>         
 [344] <strong>"fBdAccJerkMaxIndsX" </strong></br>         
 [345] <strong>"fBdAccJerkMaxIndsY" </strong></br>        
 [346] <strong>"fBdAccJerkMaxIndsZ" </strong></br>         
 [347] <strong>"fBdAccJerkMeanFreqX" </strong></br>        
 [348] <strong>"fBdAccJerkMeanFreqY" </strong></br>       
 [349] <strong>"fBdAccJerkMeanFreqZ" </strong></br>        
 [350] <strong>"fBdAccJerkskewnessX" </strong></br>        
 [351] <strong>"fBdAccJerkKurtosisX" </strong></br>       
 [352] <strong>"fBdAccJerkskewnessY" </strong></br>        
 [353] <strong>"fBdAccJerkKurtosisY" </strong></br>        
 [354] <strong>"fBdAccJerkskewnessZ"</strong></br>        
 [355] <strong>"fBdAccJerkKurtosisZ"</strong></br>        
 [356] <strong>"fBdAccJerkbandsEnergy-1,8"  </strong>  </br>
 [357] <strong>"fBdAccJerkbandsEnergy-9,16" </strong> </br>
 [358] <strong>"fBdAccJerkbandsEnergy-17,24" </strong></br>
 [359] <strong>"fBdAccJerkbandsEnergy-25,32" </strong></br>
 [360] <strong>"fBdAccJerkbandsEnergy-33,40"</strong></br>
 [361] <strong>"fBdAccJerkbandsEnergy-41,48"</strong></br> 
 [362] <strong>"fBdAccJerkbandsEnergy-49,56"</strong></br> 
 [363] <strong>"fBdAccJerkbandsEnergy-57,64"</strong></br>
 [364] <strong>"fBdAccJerkbandsEnergy-1,16" </strong> </br>
 [365] <strong>"fBdAccJerkbandsEnergy-17,32"</strong></br> 
 [366] <strong>"fBdAccJerkbandsEnergy-33,48"</strong></br>
 [367] <strong>"fBdAccJerkbandsEnergy-49,64"</strong></br> 
 [368] <strong>"fBdAccJerkbandsEnergy-1,24" </strong></br> 
 [369] <strong>"fBdAccJerkbandsEnergy-25,48"</strong></br>
 [370] <strong>"fBdGyroMeanX"  </strong></br>              
 [371] <strong>"fBdGyroMeanY" </strong></br>               
 [372] <strong>"fBdGyroMeanZ" </strong></br>              
 [373] <strong>"fBdGyroStdX" </strong></br>                
 [374] <strong>"fBdGyroStdY"</strong> </br>                
 [375] <strong>"fBdGyroStdZ"</strong></br>                
 [376] <strong>"fBdGyroMedX"</strong></br>                 
 [377] <strong>"fBdGyroMedY" </strong> </br>               
 [378] <strong>"fBdGyroMedZ" </strong> </br>              
 [379] <strong>"fBdGyroMaxX" </strong></br>                
 [380] <strong>"fBdGyroMaxY" </strong></br>                
 [381] <strong>"fBdGyroMaxZ" </strong></br>               
 [382] <strong>"fBdGyroMinX" </strong></br>                
 [383] <strong>"fBdGyroMinY" </strong></br>                
 [384] <strong>"fBdGyroMinZ" </strong></br>               
 [385] <strong>"fBdGyroSma"</strong></br>                  
 [386] <strong>"fBdGyroErX" </strong></br>                 
 [387] <strong>"fBdGyroErY" </strong> </br>               
 [388] <strong>"fBdGyroErZ" </strong> </br>               
 [389] <strong>"fBdGyroIqrX" </strong></br>                
 [390] <strong>"fBdGyroIqrY" </strong></br>               
 [391] <strong>"fBdGyroIqrZ" </strong> </br>               
 [392] <strong>"fBdGyroEntropyX"  </strong></br>           
 [393] <strong><strong>"fBdGyroEntropyY"  </strong></br>          
 [394] <strong>"fBdGyroEntropyZ"   </strong></br>          
 [395] <strong>"fBdGyroMaxIndsX"  </strong></br>           
 [396] <strong>"fBdGyroMaxIndsY" </strong> </br>          
 [397] <strong>"fBdGyroMaxIndsZ"  </strong></br>           
 [398] <strong>"fBdGyroMeanFreqX" </strong></br>           
 [399] <strong>"fBdGyroMeanFreqY" </strong> </br>         
 [400] <strong>"fBdGyroMeanFreqZ"  </strong></br>          
 [401] <strong>"fBdGyroskewnessX" </strong></br>           
 [402] <strong>"fBdGyroKurtosisX" </strong></br>          
 [403] <strong>"fBdGyroskewnessY" </strong></br>           
 [404] <strong>"fBdGyroKurtosisY" </strong></br>           
 [405] <strong>"fBdGyroskewnessZ"</strong> </br>          
 [406] <strong>"fBdGyroKurtosisZ" </strong></br>           
 [407] <strong>"fBdGyrobandsEnergy-1,8" </strong></br>     
 [408] <strong>"fBdGyrobandsEnergy-9,16"  </strong></br>  
 [409] <strong>"fBdGyrobandsEnergy-17,24" </strong></br>   
 [410] <strong>"fBdGyrobandsEnergy-25,32" </strong></br>   
 [411] <strong>"fBdGyrobandsEnergy-33,40"</strong></br>   
 [412] <strong>"fBdGyrobandsEnergy-41,48"</strong></br>    
 [413] <strong>"fBdGyrobandsEnergy-49,56"</strong></br>    
 [414] <strong>"fBdGyrobandsEnergy-57,64"</strong></br>   
 [415] <strong>"fBdGyrobandsEnergy-1,16" </strong></br>    
 [416] <strong>"fBdGyrobandsEnergy-17,32" </strong></br>   
 [417] <strong>"fBdGyrobandsEnergy-33,48"</strong></br>   
 [418] <strong>"fBdGyrobandsEnergy-49,64"</strong></br>    
 [419] <strong>"fBdGyrobandsEnergy-1,24"</strong></br>     
 [420] <strong>"fBdGyrobandsEnergy-25,48"</strong></br>   
 [421] <strong>"fBdAccMagMean"</strong> </br>              
 [422] <strong>"fBdAccMagStd" </strong></br>               
 [423] <strong>"fBdAccMagMed" </strong></br>              
 [424] <strong>"fBdAccMagMax" </strong></br>               
 [425] <strong>"fBdAccMagMin" </strong></br>               
 [426] <strong>"fBdAccMagSma" </strong></br>              
 [427] <strong>"fBdAccMagEr"  </strong></br>               
 [428] <strong>"fBdAccMagIqr" </strong></br>               
 [429] <strong>"fBdAccMagEntropy"</strong> </br>          
 [430] <strong>"fBdAccMagMaxInds" </strong></br>           
 [431] <strong>"fBdAccMagMeanFreq" </strong> </br>         
 [432] <strong>"fBdAccMagskewness"</strong></br>         
 [433] <strong>"fBdAccMagKurtosis"</strong> </br>         
 [434] <strong>"fBdBdAccJerkMagMean"  </strong> </br>      
 [435] <strong>"fBdBdAccJerkMagStd"</strong></br>         
 [436] <strong>"fBdBdAccJerkMagMed" </strong></br>         
 [437] <strong>"fBdBdAccJerkMagMax" </strong></br>         
 [438] <strong>"fBdBdAccJerkMagMin"</strong> </br>        
 [439] <strong>"fBdBdAccJerkMagSma" </strong></br>         
 [440] <strong>"fBdBdAccJerkMagEr" </strong></br>          
 [441] <strong>"fBdBdAccJerkMagIqr" </strong></br>        
 [442] <strong>"fBdBdAccJerkMagEntropy"  </strong></br>    
 [443] <strong>"fBdBdAccJerkMagMaxInds" </strong></br>     
 [444] <strong>"fBdBdAccJerkMagMeanFreq"</strong></br>    
 [445] <strong>"fBdBdAccJerkMagskewness"</strong></br>     
 [446] <strong>"fBdBdAccJerkMagKurtosis"</strong></br>     
 [447] <strong>"fBdBdGyroMagMean" </strong> </br>         
 [448] <strong>"fBdBdGyroMagStd" </strong></br>            
 [449] <strong>"fBdBdGyroMagMed" </strong></br>            
 [450] <strong>"fBdBdGyroMagMax" </strong></br>           
 [451] <strong>"fBdBdGyroMagMin"</strong></br>             
 [452] <strong>"fBdBdGyroMagSma"</strong></br>             
 [453] <strong>"fBdBdGyroMagEr" </strong></br>            
 [454] <strong>"fBdBdGyroMagIqr"  </strong> </br>          
 [455] <strong>"fBdBdGyroMagEntropy" </strong></br>        
 [456] <strong>"fBdBdGyroMagMaxInds" </strong> </br>      
 [457] <strong>"fBdBdGyroMagMeanFreq" </strong></br>       
 [458] <strong>"fBdBdGyroMagskewness" </strong></br>       
 [459] <strong>"fBdBdGyroMagKurtosis" </strong></br>      
 [460] <strong>"fBdBdGyroJerkMagMean" </strong></br>       
 [461] <strong>"fBdBdGyroJerkMagStd" </strong> </br>       
 [462] <strong>"fBdBdGyroJerkMagMed"</strong></br>        
 [463] <strong>"fBdBdGyroJerkMagMax"</strong></br>         
 [464] <strong>"fBdBdGyroJerkMagMin"</strong></br>         
 [465] <strong>"fBdBdGyroJerkMagSma" </strong></br>       
 [466] <strong>"fBdBdGyroJerkMagEr" </strong></br>         
 [467] <strong>"fBdBdGyroJerkMagIqr" </strong> </br>       
 [468] <strong>"fBdBdGyroJerkMagEntropy" </strong></br>   
 [469] <strong>"fBdBdGyroJerkMagMaxInds" </strong></br>    
 [470] <strong>"fBdBdGyroJerkMagMeanFreq"</strong></br>    
 [471] <strong>"fBdBdGyroJerkMagskewness" </strong></br>  
 [472] <strong>"fBdBdGyroJerkMagKurtosis"  </strong></br>  
 [473] <strong>"AngtBdAccMeanGrv" </strong></br>           
 [474] <strong>"AngtBdAccJerkMeanGrvMean" </strong> </br> 
 [475] <strong>"AngtBdGyroMeanGrvMean" </strong></br>      
 [476] <strong>"AngtBdGyroJerkMeanGrvMean"  </strong></br> 
 [477] <strong>"AngXGrvMean" </strong> </br>              
 [478] <strong>"AngYGrvMean" </strong></br>               
 [478] <strong>"AngZGrvMean" </strong></br>               

