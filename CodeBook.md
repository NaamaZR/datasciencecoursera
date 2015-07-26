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
<strong>tBdAcc-XYZ and tGrvAcc-XYZ</strong></br>
</p>

<p>
Subsequently, the body linear acceleration and angular velocity (gyro)</br>
were derived in time to obtain Jerk signals 
(diff was done on it, e.g. subtract).</br>
<strong>tBdAccJerk-XYZ and tBdGyroJerk-XYZ</strong></br>
</p>

<p>
Magnitude of these three-dimensional signals</br> 
were calculated using the Euclidean norm</br>
<strong>tBdAccMag, tGrvAccMag, tBdAccJerkMag, tBdGyroMag, tBdGyroJerkMag.</strong></br> 
</p>

<p>
These signals were used to estimate variables of the feature vector for each pattern: </br> 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.</br>
</p>


<h3>
Signals at Time Domain:
</h3>
<ol>
<li>   tBdAcc-XYZ       (t1)     Bd (Body) was extracted from  raw tAcc, 3  cols               </li> 
<li>   tGrvAcc-XYZ      (t2)     Grv (Gravity) was extracted from raw tAcc, 3 cols             </li> 
<li>   tBdAccJerk-XYZ   (t3)     diff, takes successive differences along tBdAcc (t1), 3 cols  </li>                     </li> 
<li>   tBdGyro-XYZ      (t4)     is the raw tGyro, 3 cols                                     </li> 
<li>   tBdGyroJerk-XYZ  (t5)     diff on  tBdGyro (4), 3 cols                                 </li> 
<li>   tBdAccMag        (t6)     Euclidean norm on tBdAcc (1) all cols to get 1 col           </li> 
<li>   tGrvAccMag       (t7)     Euclidean norm on tGrvAcc (2) all cols to get 1 col          </li> 
<li>   tBdAccJerkMag    (t8)     Euclidean norm  on tBdAccJerk  (3) all cols to get 1 col     </li> 
<li>   tBdGyroMag       (t9)     Euclidean norm  on tBdGyro  (4) all cols to get 1 col         </li> 
<li>   tBdGyroJerkMag  (t10)     Euclidean norm  on tBdGyroJerk (5) all cols to get 1 col      </li> 
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
<li>fBdAcc-XYZ                 fft on (t1)  --> (f1) </li> 
<li>fBdAccJerk-XYZ             fft on (t3)  -->  (f2)</li> 
<li>fBdGyro-XYZ                fft on (t4)  -->  (f3)</li> 
<li>fBdAccMag                  fft on (t6)  -->  (f4)</li> 
<li>fBdAccJerkMag              fft on (t8)  -->  (f5)</li> 
<li>fBdGyroMag                 fft on (t9)  -->  (f6)</li> 
<li>fBdGyroJerkMag             fft on (t10) -->  (f7)</li> 
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

<h3>
Measures that were calculated from freq domain siganls:
</h3>
<ol>
<li>maxInds():          index of the frequency component with largest magnitude</li>
<li>meanFreq():         Weighted average of the frequency components to obtain a mean frequency</li>
<li>skewness():         skewness of the frequency domain signal </li>
<li>kurtosis():         kurtosis of the frequency domain signal </li>
<li>bandsEnergy():      Energy of a frequency interval within the 64 bins of the FFT of each window.</li>
</ol>


<h3>
Measures on two signals:
</h3>
<ol>
<li>correlation():     correlation coefficient between two signals,</br>
this will denote with two upercase axial dims at end, e.g. "tGrvAccCorXZ"  </li>    
<li>angle():                    Angle between two vectors.</li>
</ol>

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

<h3>
Units:
</h3>
<p>
Accelleration is in  <strong>meter/(sec squared)</strong>
Running on it mean, std, median, max, min, iqr, sma  is in <strong>meter/ (sec squared)</strong>
</p>

<p>
Angluar velocity is in  <strong>radian / sec</strong>
Result of running on it mean, std, median, max, min, iqr, sma, average   is in <strong>radian/sec</strong>
</p>

<p>
Frequenchy is in  <strong> Hz / sec</strong>
Resulat of running on it mean, std, median, max, min, iqr, sma, average  is in <strong>Hz</strong>
</p>
<p>
Energy is  in <strong>Joule</strong>
Entropy is <strong>energy per amount of substance</strong>
</p>

<p>
skewness and kurtosis <strong>has no unit</strong>
</p>
<p>
Autorregresion coefficients are in a <strong>unit circle</strong>
</p>

<p>
Ang is in  <strong>radian</strong>
</p>

<h3>
The complete list of variables:
</h3>

 [1]  <strong>"Subject" </strong>       30 participents in expriment  were label by running ind from 1 to 30 </br>                
 [2]  <strong>"Activity"  </strong>        	6 activities were labled: "Walk", "WalkUpS", "WakDn", "Sit", "Stand", "Lay"</br>    
 [3]  <strong>"tBdAccMeanX" </strong>      	 mean on (t1) (upper list, time) X axis  </br>          
 [4]  <strong>"tBdAccMeanY" </strong>      	 mean on (t1) Y axis   </br>          
 [5]  <strong>"tBdAccMeanZ" </strong>      	 mean on (t1) Z axis </br>               
 [6]  <strong>"tBdAccStdX"  </strong>      	 std on (t1) X axis  </br>             
 [7]  <strong>"tBdAccStdY"  </strong>      	 std on (t1) Y axis </br>           
 [8]  <strong>"tBdAccStdZ" </strong>       	 std on (t1) Z axis </br>           
 [9]  <strong>"tBdAccMedX" </strong>       	 median on (t1) X axis </br>             
 [10] <strong>"tBdAccMedY" </strong>       	 median on (t1) Y axis</br>             
 [11] <strong>"tBdAccMedZ" </strong>      	 median on (t1) Z axis </br>           
 [12] <strong>"tBdAccMaxX" </strong>     	 max val on (t1) X axis </br>              
 [13] <strong>"tBdAccMaxY" </strong>     	 max val on (t1) Y axis </br>            
 [14] <strong>"tBdAccMaxZ"  </strong>    	 max val on (t1) Z axis</br>          
 [15] <strong>"tBdAccMinX"  </strong>    	 min val on (t1) X axis </br>             
 [16] <strong>"tBdAccMinY"  </strong>    	 min val on (t1) X axis</br>           
 [17] <strong>"tBdAccMinZ"  </strong>    	 min val on (t1) X axis </br>           
 [18] <strong>"tBdAccSma"    </strong>     	 Signal Magintude Area on (t1) all axis  </br>         
 [19] <strong>"tBdAccErX"    </strong>      	 Energy measure on (t1) X axis </br>              
 [20] <strong>"tBdAccErY"    </strong>      	 Energy measure on (t1) Y axis </br>              
 [21] <strong>"tBdAccErZ"    </strong>      	 Energy measure on (t1) Z axis </br>              
 [22] <strong>"tBdAccIqrX"   </strong>     	 IQR  on (t1) X axis </br>           
 [23] <strong>"tBdAccIqrY"   </strong>     	 IQR  on (t1) Y axis </br>           
 [24] <strong>"tBdAccIqrZ"   </strong>     	 IQR  on (t1) Z axis </br>          
 [25] <strong>"tBdAccEntropyX"</strong>          Entropy  on (t1) X axis </br>  
 [26] <strong>"tBdAccEntropyY"  </strong>        Entropy  on (t1) Y axis</br>    
 [27] <strong>"tBdAccEntropyZ"  </strong>        Entropy  on (t1) Z axis </br>  
 [28] <strong>"tBdAccarCoeffX,1" </strong>       Autorregresion coefficients on (t1) X burg order 1 </br>   
 [29] <strong>"tBdAccarCoeffX,2" </strong>       Autorregresion coefficients on (t1) X burg order 2</br>     
 [30] <strong>"tBdAccarCoeffX,3" </strong>       Autorregresion coefficients on (t1) X burg order 3</br>    
 [31] <strong>"tBdAccarCoeffX,4" </strong>       Autorregresion coefficients on (t1) X burg order 4</br>    
 [32] <strong>"tBdAccarCoeffY,1" </strong>       Autorregresion coefficients on (t1) Y burg order 1</br>    
 [33] <strong>"tBdAccarCoeffY,2" </strong>       Autorregresion coefficients on (t1) Y burg order 2</br>   
 [34] <strong>"tBdAccarCoeffY,3"  </strong>      Autorregresion coefficients on (t1) Y burg order 3 </br>   
 [35] <strong>"tBdAccarCoeffY,4"  </strong>      Autorregresion coefficients on (t1) Y burg order 4</br>    
 [36] <strong>"tBdAccarCoeffZ,1" </strong>       Autorregresion coefficients on (t1) Z burg order 1</br>   
 [37] <strong>"tBdAccarCoeffZ,2" </strong>       Autorregresion coefficients on (t1) Z burg order 2</br>    
 [38] <strong>"tBdAccarCoeffZ,3" </strong>       Autorregresion coefficients on (t1) Z burg order 3</br>    
 [39] <strong>"tBdAccarCoeffZ,4" </strong>       Autorregresion coefficients on (t1) Z burg order 4</br>   
 [40] <strong>"tBdAccCorXY"   </strong>          Correlation on (t1)  X vs Y </br>   
 [41] <strong>"tBdAccCorXZ"   </strong>          Correlation on (t1)  X vs Z </br>   
 [42] <strong>"tBdAccCorYZ"   </strong>          Correlation on (t1)  Y vs Z </br> 
 [43] <strong>"tGrvAccMeanX"   </strong>         mean on (t2) (upper list, time) X axis </br>   
 [44] <strong>"tGrvAccMeanY"  </strong>          mean on (t2)  Y axis</br>    
 [45] <strong>"tGrvAccMeanZ"  </strong>          mean on (t2)  Z axis</br>   
 [46] <strong>"tGrvAccStdX" </strong>            std on (t2)  X axis </br>   
 [47] <strong>"tGrvAccStdY" </strong>            std on (t2)  Y axis </br>   
 [48] <strong>"tGrvAccStdZ" </strong>            std on (t2)  Z axis </br>  
 [49] <strong>"tGrvAccMedX" </strong>            median on (t2)  X axis</br>     
 [50] <strong>"tGrvAccMedY" </strong>            median on (t2)  Y axis</br>     
 [51] <strong>"tGrvAccMedZ" </strong>            median on (t2)  Z axis</br>    
 [52] <strong>"tGrvAccMaxX" </strong>            max val on (t2) X axis </br>   
 [53] <strong>"tGrvAccMaxY" </strong>            max val on (t2) Y axis</br>   
 [54] <strong>"tGrvAccMaxZ" </strong>            max val on (t2) Z axis</br>  
 [55] <strong>"tGrvAccMinX" </strong>            min val on (t2) X axis</br>    
 [56] <strong>"tGrvAccMinY" </strong>            min val on (t2) Y axis</br>    
 [57] <strong>"tGrvAccMinZ" </strong>            min val on (t2) Z axis</br>   
 [58] <strong>"tGrvAccSma"  </strong>            Signal Magintude Area on (t2) all axis</br>    
 [59] <strong>"tGrvAccErX" </strong>             Energy measure on (t2) X axis</br>    
 [60] <strong>"tGrvAccErY" </strong>             Energy measure on (t2) Y axis </br>  
 [61] <strong>"tGrvAccErZ" </strong>		 Energy measure on (t2) Z axis</br>
 [62] <strong>"tGrvAccIqrX" </strong>            IQR  on (t2) X axis</br>   
 [63] <strong>"tGrvAccIqrY" </strong>            IQR  on (t2) Y axis </br>  
 [64] <strong>"tGrvAccIqrZ" </strong>            IQR  on (t2) Z axis</br>    
 [65] <strong>"tGrvAccEntropyX" </strong>        Entropy  on (t2) X axis </br>   
 [66] <strong>"tGrvAccEntropyY" </strong>        Entropy  on (t2) Y axis </br>  
 [67] <strong>"tGrvAccEntropyZ"  </strong>       Entropy  on (t2) Z axis </br>  
 [68] <strong>"tGrvAccarCoeffX,1" </strong>      Autorregresion coefficients on (t2) X burg order 1</br>    
 [69] <strong>"tGrvAccarCoeffX,2" </strong>      Autorregresion coefficients on (t2) X burg order 2</br>   
 [70] <strong>"tGrvAccarCoeffX,3" </strong>      Autorregresion coefficients on (t2) X burg order 3</br>    
 [71] <strong>"tGrvAccarCoeffX,4" </strong>      Autorregresion coefficients on (t2) X burg order 4</br>   
 [72] <strong>"tGrvAccarCoeffY,1" </strong>      Autorregresion coefficients on (t2) Y burg order 1</br>   
 [73] <strong>"tGrvAccarCoeffY,2" </strong>      Autorregresion coefficients on (t2) Y burg order 2</br>    
 [74] <strong>"tGrvAccarCoeffY,3" </strong>      Autorregresion coefficients on (t2) Y burg order 3</br>    
 [75] <strong>"tGrvAccarCoeffY,4" </strong>      Autorregresion coefficients on (t2) Y burg order 4</br>   
 [76] <strong>"tGrvAccarCoeffZ,1" </strong>      Autorregresion coefficients on (t2) Z burg order 1</br>    
 [77] <strong>"tGrvAccarCoeffZ,2" </strong>      Autorregresion coefficients on (t2) Z burg order 2</br>    
 [78] <strong>"tGrvAccarCoeffZ,3" </strong>      Autorregresion coefficients on (t2) Z burg order 3</br>   
 [79] <strong>"tGrvAccarCoeffZ,4" </strong>      Autorregresion coefficients on (t2) Z burg order 3</br>     
 [80] <strong>"tGrvAccCorXY"  </strong>          Correlation on (t2)  X vs Y </br>   
 [81] <strong>"tGrvAccCorXZ" </strong>           Correlation on (t2)  X vs Z </br>  
 [82] <strong>"tGrvAccCorYZ"  </strong>          Correlation on (t2)  Y vs Z </br>   
 [83] <strong>"tBdAccJerkMeanX" </strong>        mean on (t3) (upper list, time) X axis  </br>   
 [84] <strong>"tBdAccJerkMeanY"  </strong>       mean on (t3)   Y axis </br>          
 [85] <strong>"tBdAccJerkMeanZ"  </strong>       mean on (t3)   Z axis </br>           
 [86] <strong>"tBdAccJerkStdX" </strong>         std on (t3)    X axis </br>        
 [87] <strong>"tBdAccJerkStdY" </strong>         std on (t3)    Y axis </br>             
 [88] <strong>"tBdAccJerkStdZ"  </strong>        std on (t3)    Z axis </br>             
 [89] <strong>"tBdAccJerkMedX"  </strong>        median on (t3)  X axis </br>         
 [90] <strong>"tBdAccJerkMedY"  </strong>        median on (t3)  Y axis </br>           
 [91] <strong>"tBdAccJerkMedZ"  </strong>        median on (t3)  Z axis </br>            
 [92] <strong>"tBdAccJerkMaxX" </strong>         max val on (t3) X axis </br>         
 [93] <strong>"tBdAccJerkMaxY" </strong>         max val on (t3) Y axis </br>         
 [94] <strong>"tBdAccJerkMaxZ" </strong>         max val on (t3) Z axis </br>          
 [95] <strong>"tBdAccJerkMinX" </strong>         min val on (t3) X axis </br>          
 [96] <strong>"tBdAccJerkMinY" </strong>         min val on (t3) Y axis </br>         
 [97] <strong>"tBdAccJerkMinZ" </strong>         min val on (t3) Z axis </br>          
 [98] <strong>"tBdAccJerkSma" </strong>          Signal Magintude Area on (t3) all axis</br>         
 [99] <strong>"tBdAccJerkErX"  </strong>         Energy measure on (t3) X axis</br>            
 [100] <strong>"tBdAccJerkErY"  </strong>        Energy measure on (t3) Y axis</br>             
 [101] <strong>"tBdAccJerkErZ"  </strong>        Energy measure on (t2) X axis</br>             
 [102] <strong>"tBdAccJerkIqrX" </strong>        IQR  on (t3) X axis</br>            
 [103] <strong>"tBdAccJerkIqrY" </strong>        IQR  on (t3) Y axis</br>             
 [104] <strong>"tBdAccJerkIqrZ"  </strong>       IQR  on (t3) Z axis</br>            
 [105] <strong>"tBdAccJerkEntropyX" </strong>    Entropy  on (t3) X axis </br>        
 [106] <strong>"tBdAccJerkEntropyY" </strong>    Entropy  on (t3) Y axis </br>         
 [107] <strong>"tBdAccJerkEntropyZ"  </strong>   Entropy  on (t3) Z axis </br>        
 [108] <strong>"tBdAccJerkarCoeffX,1" </strong>  Autorregresion coefficients on (t3) X burg order 1</br>      
 [109] <strong>"tBdAccJerkarCoeffX,2" </strong>  Autorregresion coefficients on (t3) X burg order 2</br>       
 [110] <strong>"tBdAccJerkarCoeffX,3" </strong>  Autorregresion coefficients on (t3) X burg order 3</br>       
 [111] <strong>"tBdAccJerkarCoeffX,4" </strong>  Autorregresion coefficients on (t3) X burg order 4</br>      
 [112] <strong>"tBdAccJerkarCoeffY,1" </strong>  Autorregresion coefficients on (t3) Y burg order 1</br>       
 [113] <strong>"tBdAccJerkarCoeffY,2" </strong>  Autorregresion coefficients on (t3) Y burg order 2</br>       
 [114] <strong>"tBdAccJerkarCoeffY,3" </strong>  Autorregresion coefficients on (t3) Y burg order 3</br>      
 [115] <strong>"tBdAccJerkarCoeffY,4" </strong>  Autorregresion coefficients on (t3) Y burg order 4</br>      
 [116] <strong>"tBdAccJerkarCoeffZ,1" </strong>  Autorregresion coefficients on (t3) Z burg order 1</br>       
 [117] <strong>"tBdAccJerkarCoeffZ,2"  </strong> Autorregresion coefficients on (t3) Z burg order 2</br>     
 [118] <strong>"tBdAccJerkarCoeffZ,3" </strong>  Autorregresion coefficients on (t3) Z burg order 3</br>       
 [119] <strong>"tBdAccJerkarCoeffZ,4" </strong>  Autorregresion coefficients on (t3) Z burg order 4</br>       
 [120] <strong>"tBdAccJerkCorXY"  </strong>      Correlation on (t3)  X vs Y </br>          
 [121] <strong>"tBdAccJerkCorXZ"  </strong>      Correlation on (t3)  X vs Z </br>            
 [122] <strong>"tBdAccJerkCorYZ"  </strong>      Correlation on (t3)  Y vs Z </br>            
 [123] <strong>"tBdGyroMeanX"   </strong>        mean on (t4) (upper list, time) X axis  </br>             
 [124] <strong>"tBdGyroMeanY"  </strong>         mean on (t4) Y axis  </br>               
 [125] <strong>"tBdGyroMeanZ" </strong>          mean on (t4) Z axis  </br>                
 [126] <strong>"tBdGyroStdX"  </strong>          std on (t4)  X axis </br>              
 [127] <strong>"tBdGyroStdY"  </strong>          std on (t4)  Y axis </br>               
 [128] <strong>"tBdGyroStdZ"  </strong>          std on (t4)  Z axis </br>             
 [129] <strong>"tBdGyroMedX"  </strong>          median on (t4)  X axis</br>              
 [130] <strong>"tBdGyroMedY"  </strong>          median on (t4)  Y axis</br>              
 [131] <strong>"tBdGyroMedZ" </strong>           median on (t4)  Z axis</br>               
 [132] <strong>"tBdGyroMaxX"  </strong>          max val on (t4) X axis </br>               
 [133] <strong>"tBdGyroMaxY"  </strong>          max val on (t4) Y axis </br>               
 [134] <strong>"tBdGyroMaxZ"  </strong>          max val on (t4) Z axis </br>                
 [135] <strong>"tBdGyroMinX"  </strong>          min val on (t4) X axis </br>               
 [136] <strong>"tBdGyroMinY"  </strong>          min val on (t4) Y axis </br>               
 [137] <strong>"tBdGyroMinZ" </strong>           min val on (t4) Z axis </br>                
 [138] <strong>"tBdGyroSma"  </strong>           Signal Magintude Area on (t4) all axis</br>               
 [139] <strong>"tBdGyroErX" </strong>            Energy measure on (t4) X axis</br>                 
 [140] <strong>"tBdGyroErY" </strong>            Energy measure on (t4) Y axis</br>                  
 [141] <strong>"tBdGyroErZ"</strong>             Energy measure on (t4) Z axis</br>                  
 [142] <strong>"tBdGyroIqrX" </strong>           IQR  on (t4) X axis</br>               
 [143] <strong>"tBdGyroIqrY"</strong>            IQR  on (t4) Y axis</br>                
 [144] <strong>"tBdGyroIqrZ"</strong>            IQR  on (t4) Z axis</br>                
 [145] <strong>"tBdGyroEntropyX"</strong>        Entropy  on (t4) X axis </br>              
 [146] <strong>"tBdGyroEntropyY"</strong>        Entropy  on (t4) Y axis </br>               
 [147] <strong>"tBdGyroEntropyZ"</strong>        Entropy  on (t4) Z axis </br>             
 [148] <strong>"tBdGyroarCoeffX,1"</strong>      Autorregresion coefficients on (t4) X burg order 1</br>         
 [149] <strong>"tBdGyroarCoeffX,2"</strong>      Autorregresion coefficients on (t4) X burg order 2</br>           
 [150] <strong>"tBdGyroarCoeffX,3"</strong>      Autorregresion coefficients on (t4) X burg order 3</br>          
 [151] <strong>"tBdGyroarCoeffX,4"</strong>      Autorregresion coefficients on (t4) X burg order 4</br>           
 [152] <strong>"tBdGyroarCoeffY,1"</strong>      Autorregresion coefficients on (t4) X burg order 1</br>           
 [153] <strong>"tBdGyroarCoeffY,2"</strong>      Autorregresion coefficients on (t4) X burg order 2</br>          
 [154] <strong>"tBdGyroarCoeffY,3"</strong>      Autorregresion coefficients on (t4) X burg order 3</br>           
 [155] <strong>"tBdGyroarCoeffY,4"</strong>      Autorregresion coefficients on (t4) X burg order 4</br>           
 [156] <strong>"tBdGyroarCoeffZ,1"</strong>      Autorregresion coefficients on (t4) X burg order 1</br>         
 [157] <strong>"tBdGyroarCoeffZ,2"</strong>      Autorregresion coefficients on (t4) X burg order 2</br>          
 [158] <strong>"tBdGyroarCoeffZ,3" </strong>     Autorregresion coefficients on (t4) X burg order 3</br>          
 [159] <strong>"tBdGyroarCoeffZ,4" </strong>     Autorregresion coefficients on (t4) X burg order 4</br>         
 [160] <strong>"tBdGyroCorXY"</strong>           Correlation on (t4)  X vs Y </br>                
 [161] <strong>"tBdGyroCorXZ"</strong>           Correlation on (t4)  X vs Z </br>                 
 [162] <strong>"tBdGyroCorYZ"</strong>           Correlation on (t4)  Y vs Z </br>                
 [163] <strong>"tBdGyroJerkMeanX"</strong>       mean on (t5) (upper list, time) X axis  </br>            
 [164] <strong>"tBdGyroJerkMeanY"</strong>       mean on (t5) Y axis  </br>            
 [165] <strong>"tBdGyroJerkMeanZ"</strong>       mean on (t5) Z axis  </br>           
 [166] <strong>"tBdGyroJerkStdX"</strong>        std on (t5)  X axis  </br>             
 [167] <strong>"tBdGyroJerkStdY"</strong>        std on (t5)  Y axis  </br>             
 [168] <strong>"tBdGyroJerkStdZ"</strong>        std on (t5)  Z axis  </br>            
 [169] <strong>"tBdGyroJerkMedX"</strong>        median on (t5)  X axis  </br>          
 [170] <strong>"tBdGyroJerkMedY"</strong>        median on (t5)  Y axis  </br>             
 [171] <strong>"tBdGyroJerkMedZ"</strong>        median on (t5)  Z axis  </br>            
 [172] <strong>"tBdGyroJerkMaxX" </strong>       max on (t5)  X axis  </br>           
 [173] <strong>"tBdGyroJerkMaxY"</strong>        max on (t5)  Y axis  </br>             
 [174] <strong>"tBdGyroJerkMaxZ"</strong>        max on (t5)  Z axis  </br>            
 [175] <strong>"tBdGyroJerkMinX"</strong>        min on (t5)  X axis  </br>            
 [176] <strong>"tBdGyroJerkMinY"</strong>        min on (t5)  Y axis  </br>             
 [177] <strong>"tBdGyroJerkMinZ"</strong>        min on (t5)  Z axis  </br>            
 [178] <strong>"tBdGyroJerkSma"</strong>         Signal Magintude Area on (t5) all axis</br>               
 [179] <strong>"tBdGyroJerkErX"</strong>         Energy measure on (t5) X axis</br>               
 [180] <strong>"tBdGyroJerkErY" </strong>        Energy measure on (t5) Y axis</br>            
 [181] <strong>"tBdGyroJerkErZ" </strong>        Energy measure on (t5) Z axis</br>              
 [182] <strong>"tBdGyroJerkIqrX"</strong>        IQR  on (t5) X axis</br>             
 [183] <strong>"tBdGyroJerkIqrY"</strong>        IQR  on (t5) Y axis</br>            
 [184] <strong>"tBdGyroJerkIqrZ"</strong>        IQR  on (t5) Z axis</br>             
 [185] <strong>"tBdGyroJerkEntropyX"</strong>    Entropy  on (t5) X axis </br>        
 [186] <strong>"tBdGyroJerkEntropyY"</strong>    Entropy  on (t5) Y axis </br>        
 [187] <strong>"tBdGyroJerkEntropyZ"</strong>    Entropy  on (t5) Z axis </br>         
 [188] <strong>"tBdGyroJerkarCoeffX,1"</strong>  Autorregresion coefficients on (t5) X burg order 1</br>       
 [189] <strong>"tBdGyroJerkarCoeffX,2"</strong>  Autorregresion coefficients on (t5) X burg order 2</br>     
 [190] <strong>"tBdGyroJerkarCoeffX,3"</strong>  Autorregresion coefficients on (t5) X burg order 3</br>      
 [191] <strong>"tBdGyroJerkarCoeffX,4"</strong>  Autorregresion coefficients on (t5) X burg order 4</br>       
 [192] <strong>"tBdGyroJerkarCoeffY,1"</strong>  Autorregresion coefficients on (t5) Y burg order 1</br>     
 [193] <strong>"tBdGyroJerkarCoeffY,2"</strong>  Autorregresion coefficients on (t5) Y burg order 2</br>       
 [194] <strong>"tBdGyroJerkarCoeffY,3"</strong>  Autorregresion coefficients on (t5) Y burg order 3</br>     
 [195] <strong>"tBdGyroJerkarCoeffY,4"</strong>  Autorregresion coefficients on (t5) Y burg order 4</br>     
 [196] <strong>"tBdGyroJerkarCoeffZ,1" </strong> Autorregresion coefficients on (t5) Z burg order 1</br>     
 [197] <strong>"tBdGyroJerkarCoeffZ,2"</strong>  Autorregresion coefficients on (t5) Z burg order 2</br>    
 [198] <strong>"tBdGyroJerkarCoeffZ,3" </strong> Autorregresion coefficients on (t5) Z burg order 3</br>    
 [199] <strong>"tBdGyroJerkarCoeffZ,4" </strong> Autorregresion coefficients on (t5) Z burg order 4</br>      
 [200] <strong>"tBdGyroJerkCorXY"</strong>       Correlation on (t5)  X vs Y </br>            
 [201] <strong>"tBdGyroJerkCorXZ"</strong>       Correlation on (t5)  X vs Z </br>          
 [202] <strong>"tBdGyroJerkCorYZ"</strong>       Correlation on (t5)  Y vs Z </br>            
 [203] <strong>"tBdAccMagMean"</strong>          mean on (t6) (upper list, time)</br>               
 [204] <strong>"tBdAccMagStd"</strong>           std on (t6)      </br>                
 [205] <strong>"tBdAccMagMed"</strong>           median on (t6)   </br>                
 [206] <strong>"tBdAccMagMax"</strong>           max on (t6)      </br>                
 [207] <strong>"tBdAccMagMin"</strong>           min on (t6)      </br>               
 [208] <strong>"tBdAccMagSma"</strong>           Signal Magintude Area on (t6) </br>               
 [209] <strong>"tBdAccMagEr"</strong>            Energy measure on (t6) </br>                  
 [210] <strong>"tBdAccMagIqr"</strong>           IQR  on (t6)</br>               
 [211] <strong>"tBdAccMagEntropy"</strong>       Entropy  on (t6)  </br>            
 [212] <strong>"tBdAccMagarCoeff1"</strong>      Autorregresion coefficients on (t6)  burg order 1</br>          
 [213] <strong>"tBdAccMagarCoeff2"</strong>      Autorregresion coefficients on (t6)  burg order 2</br>          
 [214] <strong>"tBdAccMagarCoeff3"</strong>      Autorregresion coefficients on (t6)  burg order 3</br>           
 [215] <strong>"tBdAccMagarCoeff4"</strong>      Autorregresion coefficients on (t6)  burg order 4</br>          
 [216] <strong>"tGrvAccMagMean"</strong>         mean on (t7) (upper list, time)</br>             
 [217] <strong>"tGrvAccMagStd"</strong>          std on (t7)</br>                
 [218] <strong>"tGrvAccMagMed"</strong>          median on (t7)</br>                 
 [219] <strong>"tGrvAccMagMax" </strong>         max on (t7)</br>            
 [220] <strong>"tGrvAccMagMin"</strong>          min on (t7)</br>               
 [221] <strong>"tGrvAccMagSma"</strong>          Signal Magintude Area on (t7)</br>               
 [222] <strong>"tGrvAccMagEr" </strong>          Energy measure on (t7)</br>              
 [223] <strong>"tGrvAccMagIqr" </strong>         IQR on (t7)</br>              
 [224] <strong>"tGrvAccMagEntropy"  </strong>    Entropy   on (t7)</br>        
 [225] <strong>"tGrvAccMagarCoeff1" </strong>    Autorregresion coefficients on (t7)  burg order 1</br>        
 [226] <strong>"tGrvAccMagarCoeff2" </strong>    Autorregresion coefficients on (t7)  burg order 2</br>         
 [227] <strong>"tGrvAccMagarCoeff3" </strong>    Autorregresion coefficients on (t7)  burg order 3</br>         
 [228] <strong>"tGrvAccMagarCoeff4"</strong>     Autorregresion coefficients on (t7)  burg order 4</br>         
 [229] <strong>"tBdAccJerkMagMean"</strong>      mean on (t8) (upper list, time)</br>           
 [230] <strong>"tBdAccJerkMagStd" </strong>      std on (t8)</br>            
 [231] <strong>"tBdAccJerkMagMed" </strong>      median on (t8)</br>         
 [232] <strong>"tBdAccJerkMagMax" </strong>      max on (t8)</br>           
 [233] <strong>"tBdAccJerkMagMin" </strong>      min on (t8)</br>            
 [234] <strong>"tBdAccJerkMagSma" </strong>      Signal Magintude Area on (t8)</br>          
 [235] <strong>"tBdAccJerkMagEr" </strong>       Energy measure on (t8)</br>            
 [236] <strong>"tBdAccJerkMagIqr" </strong>      IQR on (t8)</br>            
 [237] <strong>"tBdAccJerkMagEntropy"</strong>   Entropy   on (t8)</br>     
 [238] <strong>"tBdAccJerkMagarCoeff1" </strong> Autorregresion coefficients on (t8)  burg order 1</br>     
 [239] <strong>"tBdAccJerkMagarCoeff2" </strong> Autorregresion coefficients on (t8)  burg order 2</br>       
 [240] <strong>"tBdAccJerkMagarCoeff3" </strong> Autorregresion coefficients on (t8)  burg order 3</br>    
 [241] <strong>"tBdAccJerkMagarCoeff4" </strong> Autorregresion coefficients on (t8)  burg order 4</br>      
 [242] <strong>"tBdGyroMagMean"  </strong>       mean on (t9) (upper list, time)</br>             
 [243] <strong>"tBdGyroMagStd" </strong>         std on (t9)</br>           
 [244] <strong>"tBdGyroMagMed" </strong>         median on (t9)</br>              
 [245] <strong>"tBdGyroMagMax" </strong>         max on (t9)</br>               
 [246] <strong>"tBdGyroMagMin" </strong>         min on (t9)</br>             
 [247] <strong>"tBdGyroMagSma" </strong>         Signal Magintude Area on (t9)</br>             
 [248] <strong>"tBdGyroMagEr" </strong>          Energy measure on (t9)</br>               
 [249] <strong>"tBdGyroMagIqr" </strong>         IQR on (t9)</br>               
 [250] <strong>"tBdGyroMagEntropy"</strong>      Entropy   on (t9)</br>            
 [251] <strong>"tBdGyroMagarCoeff1"</strong>     Autorregresion coefficients on (t9)  burg order 1</br>         
 [252] <strong>"tBdGyroMagarCoeff2" </strong>    Autorregresion coefficients on (t9)  burg order 2</br>        
 [253] <strong>"tBdGyroMagarCoeff3" </strong>    Autorregresion coefficients on (t9)  burg order 3</br>         
 [254] <strong>"tBdGyroMagarCoeff4" </strong>    Autorregresion coefficients on (t9)  burg order 4</br>          
 [255] <strong>"tBdGyroJerkMagMean"</strong>     mean on (t10) (upper list, time)</br>         
 [256] <strong>"tBdGyroJerkMagStd" </strong>     std on (t10)</br>          
 [257] <strong>"tBdGyroJerkMagMed" </strong>     median on (t10)</br>         
 [258] <strong>"tBdGyroJerkMagMax" </strong>     max on (t10)</br>         
 [259] <strong>"tBdGyroJerkMagMin"</strong>      min on (t10)</br>           
 [260] <strong>"tBdGyroJerkMagSma" </strong>     Signal Magintude Area on (t10)</br>         
 [261] <strong>"tBdGyroJerkMagEr" </strong>      Energy measure on (t10)</br>            
 [262] <strong>"tBdGyroJerkMagIqr" </strong>     IQR on (t10)</br>            
 [263] <strong>"tBdGyroJerkMagEntropy" </strong> Entropy   on (t10)</br>      
 [264] <strong>"tBdGyroJerkMagarCoeff1"</strong>  Autorregresion coefficients on (t10)  burg order 1</br>      
 [265] <strong>"tBdGyroJerkMagarCoeff2"</strong>  Autorregresion coefficients on (t10)  burg order 2</br>     
 [266] <strong>"tBdGyroJerkMagarCoeff3" </strong> Autorregresion coefficients on (t10)  burg order 3</br>    
 [267] <strong>"tBdGyroJerkMagarCoeff4" </strong> Autorregresion coefficients on (t10)  burg order 4</br>  
 [268] <strong>"fBdAccMeanX"  </strong>           mean on (f1) (upper list, freq) X axis  </br>               
 [269] <strong>"fBdAccMeanY"  </strong>           mean on (f1) Y axis  </br>                
 [270] <strong>"fBdAccMeanZ" </strong>            mean on (f1) Z axis  </br>                
 [271] <strong>"fBdAccStdX" </strong>             std on (f1) X axis  </br>                 
 [272] <strong>"fBdAccStdY" </strong>             std on (f1) Y axis  </br>                 
 [273] <strong>"fBdAccStdZ" </strong>             std on (f1) Z axis  </br>                
 [274] <strong>"fBdAccMedX" </strong>             median on (f1) X axis  </br>                 
 [275] <strong>"fBdAccMedY" </strong>             median on (f1) Y axis  </br>                 
 [276] <strong>"fBdAccMedZ" </strong>             median on (f1) Z axis  </br>               
 [277] <strong>"fBdAccMaxX" </strong>             max on (f1) X axis  </br>                 
 [278] <strong>"fBdAccMaxY" </strong>             max on (f1) Y axis  </br>                 
 [279] <strong>"fBdAccMaxZ" </strong>             max on (f1) Z axis  </br>                
 [280] <strong>"fBdAccMinX" </strong>             min on (f1) X axis  </br>                 
 [281] <strong>"fBdAccMinY" </strong>             min on (f1) Y axis  </br>                 
 [282] <strong>"fBdAccMinZ"</strong>              min on (f1) Z axis  </br>                 
 [283] <strong>"fBdAccSma"  </strong>             Signal Magintude Area on (f1) all axis</br>                  
 [284] <strong>"fBdAccErX"  </strong>             Energy measure on (f1) X axis</br>               
 [285] <strong>"fBdAccErY"  </strong>             Energy measure on (f1) Y axis</br>                
 [286] <strong>"fBdAccErZ"  </strong>             Energy measure on (f1) Z axis</br>                
 [287] <strong>"fBdAccIqrX" </strong>             IQR  on (f1) X axis</br>                 
 [288] <strong>"fBdAccIqrY" </strong>             IQR  on (f1) Y axis</br>               
 [289] <strong>"fBdAccIqrZ" </strong>             IQR  on (f1) Z axis</br>                 
 [290] <strong>"fBdAccEntropyX" </strong>         Entropy  on (f1) X axis </br>              
 [291] <strong>"fBdAccEntropyY" </strong>         Entropy  on (f1) Y axis </br>             
 [292] <strong>"fBdAccEntropyZ"  </strong>        Entropy  on (f1) Z axis </br>             
 [293] <strong>"fBdAccMaxIndsX" </strong>         index of the frequency component with largest magnitude on (f1) X axis</br>             
 [294] <strong>"fBdAccMaxIndsY"  </strong>        index of the frequency component with largest magnitude on (f1) Y axis</br>           
 [295] <strong>"fBdAccMaxIndsZ" </strong>         index of the frequency component with largest magnitude on (f1) Z axis</br>            
 [296] <strong>"fBdAccMeanFreqX" </strong>        Weighted average of the frequency components to obtain a mean frequency on (f1) X axis</br>            
 [297] <strong>"fBdAccMeanFreqY" </strong>        Weighted average of the frequency components to obtain a mean frequency on (f1) Y axis</br>          
 [298] <strong>"fBdAccMeanFreqZ" </strong>        Weighted average of the frequency components to obtain a mean frequency on (f1) Z axis</br>            
 [299] <strong>"fBdAccskewnessX" </strong>        Skewness on (f1) X axis</br>            
 [300] <strong>"fBdAccKurtosisX" </strong>        Kurtosis on (f1) X axis</br>           
 [301] <strong>"fBdAccskewnessY" </strong>        Skewness on (f1) Y axis</br>           
 [302] <strong>"fBdAccKurtosisY" </strong>        Kurtosis on (f1) Y axis</br>            
 [303] <strong>"fBdAccskewnessZ" </strong>        Skewness on (f1) Z axis</br>          
 [304] <strong>"fBdAccKurtosisZ" </strong>                   
 [305] <strong>"fBdAccbandsEnergy-1,8" </strong>  Energy of Interval from (f1)</br>      
 [306] <strong>"fBdAccbandsEnergy-9,16"  </strong>Energy of Interval from (f1)</br> 
 [307] <strong>"fBdAccbandsEnergy-17,24" </strong>Energy of Interval from (f1)</br>    
 [308] <strong>"fBdAccbandsEnergy-25,32" </strong>Energy of Interval from (f1)</br>  
 [309] <strong>"fBdAccbandsEnergy-33,40" </strong>Energy of Interval from (f1)</br>  
 [310] <strong>"fBdAccbandsEnergy-41,48" </strong>Energy of Interval from (f1)</br> 
 [311] <strong>"fBdAccbandsEnergy-49,56" </strong>Energy of Interval from (f1)</br>   
 [312] <strong>"fBdAccbandsEnergy-57,64" </strong>Energy of Interval from (f1)</br>  
 [313] <strong>"fBdAccbandsEnergy-1,16"  </strong>Energy of Interval from (f1)</br>   
 [314] <strong>"fBdAccbandsEnergy-17,32"  </strong>Energy of Interval from (f1)</br>  
 [315] <strong>"fBdAccbandsEnergy-33,48" </strong>Energy of Interval from (f1)</br>   
 [316] <strong>"fBdAccbandsEnergy-49,64" </strong>Energy of Interval from (f1)</br>   
 [317] <strong>"fBdAccbandsEnergy-1,24" </strong> Energy of Interval from (f1)</br>     
 [318] <strong>"fBdAccbandsEnergy-25,48" </strong>Energy of Interval from (f1)</br>  
 [319] <strong>"fBdAccJerkMeanX" </strong>    mean on (f2) (upper list, freq) X axis  </br>            
 [320] <strong>"fBdAccJerkMeanY" </strong>    mean on (f2) Y axis  </br>            
 [321] <strong>"fBdAccJerkMeanZ" </strong>    mean on (f2) Z axis  </br>          
 [322] <strong>"fBdAccJerkStdX" </strong>     std on (f2) X axis  </br>           
 [323] <strong>"fBdAccJerkStdY" </strong>     std on (f2) Y axis  </br>            
 [324] <strong>"fBdAccJerkStdZ"  </strong>    std on (f2) Z axis  </br>           
 [325] <strong>"fBdAccJerkMedX"</strong>      median on (f2) X axis  </br>              
 [326] <strong>"fBdAccJerkMedY" </strong      median on (f2) Y axis  </br>            
 [327] <strong>"fBdAccJerkMedZ" </strong>     median on (f2) Z axis  </br>           
 [328] <strong>"fBdAccJerkMaxX" </strong>     max on (f2) X axis  </br>             
 [329] <strong>"fBdAccJerkMaxY" </strong>     max on (f2) Y axis  </br>             
 [330] <strong>"fBdAccJerkMaxZ" </strong>     max on (f2) Z axis  </br>            
 [331] <strong>"fBdAccJerkMinX" </strong>     min on (f2) X axis  </br>             
 [332] <strong>"fBdAccJerkMinY" </strong>     min on (f2) Y axis  </br>             
 [333] <strong>"fBdAccJerkMinZ" </strong>     min on (f2) Z axis  </br>           
 [334] <strong>"fBdAccJerkSma" </strong>      Signal Magintude Area on (f2) all axis</br>           
 [335] <strong>"fBdAccJerkErX" </strong>      Energy measure on (f2) X axis</br>              
 [336] <strong>"fBdAccJerkErY" </strong>      Energy measure on (f2) Y axis</br>             
 [337] <strong>"fBdAccJerkErZ" </strong>      Energy measure on (f2) Z axis</br>               
 [338] <strong>"fBdAccJerkIqrX" </strong>     IQR  on (f2) X axis</br>             
 [339] <strong>"fBdAccJerkIqrY" </strong>     IQR  on (f2) Y axis</br>             
 [340] <strong>"fBdAccJerkIqrZ"</strong>      IQR  on (f2) Z axis</br>              
 [341] <strong>"fBdAccJerkEntropyX" </strong> Entropy  on (f2) X axis </br>         
 [342] <strong>"fBdAccJerkEntropyY" </strong> Entropy  on (f2) Y axis </br>        
 [343] <strong>"fBdAccJerkEntropyZ" </strong> Entropy  on (f2) Z axis </br>         
 [344] <strong>"fBdAccJerkMaxIndsX" </strong> index of the frequency component with largest magnitude on (f2)  X axis</br>          
 [345] <strong>"fBdAccJerkMaxIndsY" </strong> index of the frequency component with largest magnitude on (f2)  Y axis</br>       
 [346] <strong>"fBdAccJerkMaxIndsZ" </strong> index of the frequency component with largest magnitude on (f2)  Z axis</br>         
 [347] <strong>"fBdAccJerkMeanFreqX" </strong> Weighted average of the frequency components to obtain a mean frequency on (f2) X axis</br>         
 [348] <strong>"fBdAccJerkMeanFreqY" </strong> Weighted average of the frequency components to obtain a mean frequency on (f2) Y axis</br>        
 [349] <strong>"fBdAccJerkMeanFreqZ" </strong> Weighted average of the frequency components to obtain a mean frequency on (f2) Z axis</br>        
 [350] <strong>"fBdAccJerkskewnessX" </strong> Skewness on (f2) X axis</br>         
 [351] <strong>"fBdAccJerkKurtosisX" </strong> Kurtosis on (f2) X axis</br>      
 [352] <strong>"fBdAccJerkskewnessY" </strong> Skewness on (f2) Y axis</br>        
 [353] <strong>"fBdAccJerkKurtosisY" </strong> Kurtosis on (f2) Y axis</br>        
 [354] <strong>"fBdAccJerkskewnessZ"</strong>  Skewness on (f2) Z axis</br>         
 [355] <strong>"fBdAccJerkKurtosisZ"</strong>  Kurtosis on (f2) Z axis</br>        
 [356] <strong>"fBdAccJerkbandsEnergy-1,8"  </strong>  Energy of Interval from (f2)</br>
 [357] <strong>"fBdAccJerkbandsEnergy-9,16" </strong>  Energy of Interval from (f2)</br>
 [358] <strong>"fBdAccJerkbandsEnergy-17,24" </strong> Energy of Interval from (f2)</br>
 [359] <strong>"fBdAccJerkbandsEnergy-25,32" </strong> Energy of Interval from (f2)</br>
 [360] <strong>"fBdAccJerkbandsEnergy-33,40"</strong>  Energy of Interval from (f2)</br>
 [361] <strong>"fBdAccJerkbandsEnergy-41,48"</strong>  Energy of Interval from (f2)</br> 
 [362] <strong>"fBdAccJerkbandsEnergy-49,56"</strong>  Energy of Interval from (f2)</br> 
 [363] <strong>"fBdAccJerkbandsEnergy-57,64"</strong>  Energy of Interval from (f2)</br>
 [364] <strong>"fBdAccJerkbandsEnergy-1,16" </strong>  Energy of Interval from (f2)</br>
 [365] <strong>"fBdAccJerkbandsEnergy-17,32"</strong>  Energy of Interval from (f2)</br>
 [366] <strong>"fBdAccJerkbandsEnergy-33,48"</strong>  Energy of Interval from (f2)</br>
 [367] <strong>"fBdAccJerkbandsEnergy-49,64"</strong>  Energy of Interval from (f2)</br> 
 [368] <strong>"fBdAccJerkbandsEnergy-1,24" </strong>  Energy of Interval from (f2)</br> 
 [369] <strong>"fBdAccJerkbandsEnergy-25,48"</strong>  Energy of Interval from (f2)</br>
 [370] <strong>"fBdGyroMeanX"  </strong>                mean on (f3) (upper list, freq) X axis </br>               
 [371] <strong>"fBdGyroMeanY" </strong>                 mean on (f3) Y axis </br>               
 [372] <strong>"fBdGyroMeanZ" </strong>                 mean on (f3) Z axis </br>             
 [373] <strong>"fBdGyroStdX" </strong>                  std on (f3) X axis  </br>                
 [374] <strong>"fBdGyroStdY"</strong>                   std on (f3) Y axis  </br>                
 [375] <strong>"fBdGyroStdZ"</strong>                   std on (f3) Z axis  </br>                
 [376] <strong>"fBdGyroMedX"</strong>                   medain on (f3) X axis  </br>                 
 [377] <strong>"fBdGyroMedY" </strong>                  medain on (f3) Y axis  </br>               
 [378] <strong>"fBdGyroMedZ" </strong>                  medain on (f3) Z axis  </br>               
 [379] <strong>"fBdGyroMaxX" </strong>                  max on (f3) X axis  </br>                 
 [380] <strong>"fBdGyroMaxY" </strong>                  max on (f3) Y axis  </br>                
 [381] <strong>"fBdGyroMaxZ" </strong>                  max on (f3) Z axis  </br>               
 [382] <strong>"fBdGyroMinX" </strong>                  min on (f3) X axis  </br>                
 [383] <strong>"fBdGyroMinY" </strong>                  min on (f3) Y axis  </br>                
 [384] <strong>"fBdGyroMinZ" </strong>                  min on (f3) Z axis  </br>               
 [385] <strong>"fBdGyroSma"</strong>                    Signal Magintude Area on (f3) all axis</br>                  
 [386] <strong>"fBdGyroErX" </strong>                   Energy measure on (f3) X axis</br>                 
 [387] <strong>"fBdGyroErY" </strong>                   Energy measure on (f3) Y axis</br>              
 [388] <strong>"fBdGyroErZ" </strong>                   Energy measure on (f3) Z axis</br>              
 [389] <strong>"fBdGyroIqrX" </strong>                  IQR  on (f3) X axis</br>                 
 [390] <strong>"fBdGyroIqrY" </strong>                  IQR  on (f3) Y axis</br>               
 [391] <strong>"fBdGyroIqrZ" </strong>                  IQR  on (f3) Z axis</br>                
 [392] <strong>"fBdGyroEntropyX"  </strong>             Entropy  on (f3) X axis </br>            
 [393] <strong>"fBdGyroEntropyY"  </strong>             Entropy  on (f3) Y axis </br>           
 [394] <strong>"fBdGyroEntropyZ"   </strong>            Entropy  on (f3) Z axis </br>            
 [395] <strong>"fBdGyroMaxIndsX"  </strong>  index of the frequency component with largest magnitude on (f3)  X axis</br>            
 [396] <strong>"fBdGyroMaxIndsY"  </strong>  index of the frequency component with largest magnitude on (f3)  Y axis</br>           
 [397] <strong>"fBdGyroMaxIndsZ"  </strong>  index of the frequency component with largest magnitude on (f3)  Z axis</br>           
 [398] <strong>"fBdGyroMeanFreqX" </strong>  Weighted average of the frequency components to obtain a mean frequency on (f3) X axis</br>           
 [399] <strong>"fBdGyroMeanFreqY" </strong>  Weighted average of the frequency components to obtain a mean frequency on (f3) Y axis</br>        
 [400] <strong>"fBdGyroMeanFreqZ"  </strong> Weighted average of the frequency components to obtain a mean frequency on(f3)  Z axis</br>          
 [401] <strong>"fBdGyroskewnessX" </strong>  Skewness on (f3) X axis</br>          
 [402] <strong>"fBdGyroKurtosisX" </strong>  Kurtosis on (f3) X axis</br>          
 [403] <strong>"fBdGyroskewnessY" </strong>  Skewness on (f3) Y axis</br>           
 [404] <strong>"fBdGyroKurtosisY" </strong>  Kurtosis on (f3) Y axis</br>            
 [405] <strong>"fBdGyroskewnessZ"</strong>   Skewness on (f3) Z axis</br>         
 [406] <strong>"fBdGyroKurtosisZ" </strong>  Kurtosis on (f3) Z axis</br>           
 [407] <strong>"fBdGyrobandsEnergy-1,8"     </strong> Energy of Interval from (f3)</br>     
 [408] <strong>"fBdGyrobandsEnergy-9,16"    </strong> Energy of Interval from (f3)</br>  
 [409] <strong>"fBdGyrobandsEnergy-17,24"   </strong> Energy of Interval from (f3)</br>   
 [410] <strong>"fBdGyrobandsEnergy-25,32"   </strong> Energy of Interval from (f3)</br>   
 [411] <strong>"fBdGyrobandsEnergy-33,40"   </strong> Energy of Interval from (f3)</br>   
 [412] <strong>"fBdGyrobandsEnergy-41,48"   </strong> Energy of Interval from (f3)</br>     
 [413] <strong>"fBdGyrobandsEnergy-49,56"   </strong> Energy of Interval from (f3)</br>     
 [414] <strong>"fBdGyrobandsEnergy-57,64"   </strong> Energy of Interval from (f3)</br>    
 [415] <strong>"fBdGyrobandsEnergy-1,16"    </strong> Energy of Interval from (f3)</br>     
 [416] <strong>"fBdGyrobandsEnergy-17,32"   </strong> Energy of Interval from (f3)</br>    
 [417] <strong>"fBdGyrobandsEnergy-33,48"   </strong> Energy of Interval from (f3)</br>    
 [418] <strong>"fBdGyrobandsEnergy-49,64"   </strong> Energy of Interval from (f3)</br>     
 [419] <strong>"fBdGyrobandsEnergy-1,24"    </strong> Energy of Interval from (f3)</br>      
 [420] <strong>"fBdGyrobandsEnergy-25,48"   </strong> Energy of Interval from (f3)</br>    
 [421] <strong>"fBdAccMagMean"</strong>     mean on (f4) (upper list, freq) </br>              
 [422] <strong>"fBdAccMagStd" </strong>     std on (f4)     </br>               
 [423] <strong>"fBdAccMagMed" </strong>     median on (f4)  </br>             
 [424] <strong>"fBdAccMagMax" </strong>     max on (f4)     </br>               
 [425] <strong>"fBdAccMagMin" </strong>     min on (f4)     </br>                
 [426] <strong>"fBdAccMagSma" </strong>     Signal Magintude Area on (f4) </br>             
 [427] <strong>"fBdAccMagEr"  </strong>     Energy measure on (f4) </br>               
 [428] <strong>"fBdAccMagIqr" </strong>     IQR  on (f4) </br>               
 [429] <strong>"fBdAccMagEntropy"</strong>  Entropy  on (f4) </br>         
 [430] <strong>"fBdAccMagMaxInds" </strong>  index of the frequency component with largest magnitude on (f4)</br>               
 [431] <strong>"fBdAccMagMeanFreq" </strong> Weighted average of the frequency components to obtain a mean frequency on (f4)</br>         
 [432] <strong>"fBdAccMagskewness"</strong>  Skewness on (f4) </br>         
 [433] <strong>"fBdAccMagKurtosis"</strong>  Kurtosis on (f4) </br>           
 [434] <strong>"fBdBdAccJerkMagMean"  </strong> mean on (f5) (upper list, freq) </br>       
 [435] <strong>"fBdBdAccJerkMagStd"</strong>       std on (f5)  </br>          
 [436] <strong>"fBdBdAccJerkMagMed" </strong>      median on (f5)  </br>           
 [437] <strong>"fBdBdAccJerkMagMax" </strong>      max on (f5)     </br>           
 [438] <strong>"fBdBdAccJerkMagMin"</strong>       min on (f5)     </br>          
 [439] <strong>"fBdBdAccJerkMagSma" </strong>      Signal Magintude Area on (f5)</br>         
 [440] <strong>"fBdBdAccJerkMagEr" </strong>       Energy measure on (f5) </br>        
 [441] <strong>"fBdBdAccJerkMagIqr" </strong>      IQR  on (f5) </br>        
 [442] <strong>"fBdBdAccJerkMagEntropy"  </strong> Entropy  on (f5) </br>       
 [443] <strong>"fBdBdAccJerkMagMaxInds" </strong>  index of the frequency component with largest magnitude on (f5)</br>      
 [444] <strong>"fBdBdAccJerkMagMeanFreq"</strong>  Weighted average of the frequency components to obtain a mean frequency on (f5)</br>    
 [445] <strong>"fBdBdAccJerkMagskewness"</strong>  Skewness on (f5) </br>      
 [446] <strong>"fBdBdAccJerkMagKurtosis"</strong>  Kurtosis on (f5) </br>     
 [447] <strong>"fBdBdGyroMagMean" </strong>          mean on (f6) (upper list, freq) </br>        
 [448] <strong>"fBdBdGyroMagStd"  </strong>          std on  (f6)  </br>            
 [449] <strong>"fBdBdGyroMagMed" </strong>           median on (f6)  </br>            
 [450] <strong>"fBdBdGyroMagMax" </strong>           max on (f6)     </br>          
 [451] <strong>"fBdBdGyroMagMin"</strong>            min on (f6)     </br>            
 [452] <strong>"fBdBdGyroMagSma"</strong>            Signal Magintude Area on (f6) </br>              
 [453] <strong>"fBdBdGyroMagEr" </strong>            Energy measure on (f6) </br>           
 [454] <strong>"fBdBdGyroMagIqr"  </strong>          IQR  on (f6) </br>        
 [455] <strong>"fBdBdGyroMagEntropy" </strong>       Entropy  on (f6) </br>       
 [456] <strong>"fBdBdGyroMagMaxInds" </strong>     index of the frequency component with largest magnitude on (f6)</br>      
 [457] <strong>"fBdBdGyroMagMeanFreq" </strong>    Weighted average of the frequency components to obtain a mean frequency on(f6)</br>        
 [458] <strong>"fBdBdGyroMagskewness" </strong>    Skewness on (f6) </br>      
 [459] <strong>"fBdBdGyroMagKurtosis" </strong>    Kurtosis on (f6) </br>      
 [460] <strong>"fBdBdGyroJerkMagMean" </strong>    mean on (f7) (upper list, freq) </br>      
 [461] <strong>"fBdBdGyroJerkMagStd" </strong>     std on (f7)  </br>     
 [462] <strong>"fBdBdGyroJerkMagMed"</strong>      median on (f7)  </br>        
 [463] <strong>"fBdBdGyroJerkMagMax"</strong>      max on (f7)     </br>         
 [464] <strong>"fBdBdGyroJerkMagMin"</strong>      min on (f7)     </br>         
 [465] <strong>"fBdBdGyroJerkMagSma" </strong>     Signal Magintude Area on (f7)</br>       
 [466] <strong>"fBdBdGyroJerkMagEr" </strong>      Energy measure on (f7) </br>         
 [467] <strong>"fBdBdGyroJerkMagIqr" </strong>     IQR  on (f7) </br>      
 [468] <strong>"fBdBdGyroJerkMagEntropy" </strong> Entropy  on (f7) </br>  
 [469] <strong>"fBdBdGyroJerkMagMaxInds" </strong> index of the frequency component with largest magnitude on (f7)</br>     
 [470] <strong>"fBdBdGyroJerkMagMeanFreq"</strong>  Weighted average of the frequency components to obtain a mean frequency on(f7)</br>     
 [471] <strong>"fBdBdGyroJerkMagskewness" </strong> Skewness on (f7) </br> 
 [472] <strong>"fBdBdGyroJerkMagKurtosis"  </strong>Kurtosis on (f7) </br> 
 [473] <strong>"AngtBdAccMeanGrv" </strong> Ang between Body Acc and MeanGrv</br>           
 [474] <strong>"AngtBdAccJerkMeanGrvMean" </strong> Ang between Body Acc Jerk Mean and GrvityMean</br> 
 [475] <strong>"AngtBdGyroMeanGrvMean" </strong>    Ang between Body Gyro Mean and GrvityMean</br>      
 [476] <strong>"AngtBdGyroJerkMeanGrvMean"  </strong>Ang between Body Gyro Jerk Mean and GrvityMean</br> 
 [477] <strong>"AngXGrvMean" </strong> Ang between X GrvityMean</br>              
 [478] <strong>"AngYGrvMean" </strong>Ang between Y GrvityMean</br>               
 [478] <strong>"AngZGrvMean" </strong>Ang between Z GrvityMean</br>               

