Data Science at courseare.com by Johns Hopkins U 

<p>
In this repo I had deposited run_analysis.R file and CodeBook.md, 
both are required for the project at the Getting and Cleaning Data course. 
</p>

<p>
At run_analysis.R , a zip file was downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
</p>

<p>
Test data and Train data were read and combined, </br>
subject coloumn and acitvity coloumn were added as well.</br>
Duplicated coloumns were removed.</br>
Coloumns were named by variables names at features.txt.</br>
Next, coloumns were scaned for "mean", "std" or "Mean"</br>
and these coloumns were extracted by subsetting the original data.frame.</br>
Nest, Activity coloumn was labeled by explicit names, e.g.</br>
"Walking", "Walking Upstaris", "Walking Downstairs", "Sitting", "Standing", "Laying"</br>
which were shortcut to</br>
"Walk", "WalkUpS", "WalkDn", "Sit", "Stand", "Lay"</br>
Next, coloumns were relabeled to shorter names which are more neat, e.g. no ) or (</br>
Next, TidyData was pulled by applying mean on all measures of same subject and same acitivy.</br>

</p>
