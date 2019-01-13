###############################################################################	
#
# RQAEntr for openface landmarks 
# 
#
#
#
#
# Miguel P Xochicale [http://mxochicale.github.io]
#
###############################################################################	
	# OUTLINE:
	# (0) Loading libraries and functions
	# (1) Defining paths for main_path, r_scripts_path, ..., etc.
	# (2) Setting DataSets paths and reading data
	# (3) Reading data
	


#################
# Start the clock!
start.time <- Sys.time()


################################################################################
# (0) Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
library(ggplot2) # for plotting 



################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.

homepath <- Sys.getenv("HOME") 
r_scripts_path <- getwd()
setwd("../../")
repository_path <- getwd()


##VERSION 
version <- '00'
feature_path <- '/dataset'
graphics_path <- '/rqaentr'

#### Outcomes Data Path
outcomes_graphics_path <- paste(repository_path,'/docs/figs', graphics_path, sep="")

### DataSet Path
data_path <- paste(repository_path,'/data', feature_path, '/v', version, sep="")



################################################################################
# (2) Setting DataSets paths and reading data
setwd(data_path)


################################################################################
# (3) Reading data
file_ext <- "rawopenfacedata.datatable"
xdata <- fread( file_ext, header=TRUE)



######################################################
# P.S. I am sorry for this annoying message. 
# I broke my GNU/Linux OS machine on Monday 17DEC2018. 
# Luckly, I were able to conduct the pilot experiment,
# to compute landmarks with OpenFace, and to plot time series 
# but I was not able to compute the RQAEntr.
#
# If you are still interested with the results for RQAEntr,
# you can email me (perezDOTxochicaleATgmailDOTcom)subjet:RQAEntr
# or try to implement these scripts from a similar experiment
# https://github.com/mxochicale/phd-thesis-code-data/tree/master/code/rscripts/rqa/hii/v01
# Fri Dec 21 11:30:01 GMT 2018


#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path

