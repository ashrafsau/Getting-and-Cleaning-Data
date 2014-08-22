Getting-and-Cleaning-Data
=========================

Project of coursera course "Getting and Cleaning Data"


The analysis file does the followings:
1. First reads the training and test data separately
2. Merges both traing and test data to create X (feature matrix as data.frame) and y (labels)
3. Extract all the features with mean and std, and updates X accordingly
4. Replaces y values by exact label names (activities)
5. Reads the subject values for training and test data and combines it
5. A new dataframe (df) is created binding X, y, subject
6. The aggregate function is used on df to obtain required tidy data set
