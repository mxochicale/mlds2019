###############################################################################	
#
# RQAEntr for openface landmarks 
# 
# Reference: 
# https://github.com/mxochicale/phd-thesis-code-data/blob/master/code/rscripts/rqa/hii/v00/Fa_rqa_topology.R
#
#
#
# Miguel Xochicale [http://mxochicale.github.io]
#
###############################################################################	
	# OUTLINE:
	# (0) Defining paths for main_path, r_scripts_path, ..., etc.
	# (1) Loading libraries and functions
	# (2) Setting DataSets paths and reading data
	# (3) Reading data
	


#################
# Start the clock!
start.time <- Sys.time()



################################################################################
# (0) Defining paths for main_path, r_scripts_path, ..., etc.

homepath <- Sys.getenv("HOME") 
r_scripts_path <- getwd()
setwd("../../")
repository_path <- getwd()
setwd("../")
github_path <- getwd()

################################################################################
# (1) Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
library(ggplot2) # for plotting 
library(signal)# for butterworth filter and sgolay
library(RColorBrewer)

library(devtools)
load_all( paste(github_path, '/nonlinearTseries', sep='' ))




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



################################################################################
# (4) Filtering data

data <- xdata[,.(

	sgzmuvx_0,  sgzmuvx_1,  sgzmuvx_2,  sgzmuvx_3,  sgzmuvx_4 
#	sgzmuvx_5,  sgzmuvx_6,  sgzmuvx_7,  sgzmuvx_8,  sgzmuvx_9, 
#	sgzmuvx_10, sgzmuvx_11, sgzmuvx_12, sgzmuvx_13, sgzmuvx_14, 
#	sgzmuvx_15, sgzmuvx_16, sgzmuvx_17, sgzmuvx_18, sgzmuvx_19,
#	sgzmuvx_20, sgzmuvx_21, sgzmuvx_22, sgzmuvx_23, sgzmuvx_24, 
#	sgzmuvx_25, sgzmuvx_26, sgzmuvx_27, sgzmuvx_28, sgzmuvx_29,
#	sgzmuvx_30, sgzmuvx_31, sgzmuvx_32, sgzmuvx_33, sgzmuvx_34, 
#	sgzmuvx_35, sgzmuvx_36, sgzmuvx_37, sgzmuvx_38, sgzmuvx_39,
#	sgzmuvx_40, sgzmuvx_41, sgzmuvx_42, sgzmuvx_43, sgzmuvx_44, 
#	sgzmuvx_45, sgzmuvx_46, sgzmuvx_47, sgzmuvx_48, sgzmuvx_49,
#	sgzmuvx_50, sgzmuvx_51, sgzmuvx_52, sgzmuvx_53, sgzmuvx_54, 
#	sgzmuvx_55, sgzmuvx_56, sgzmuvx_57, sgzmuvx_58, sgzmuvx_59,
#	sgzmuvx_60, sgzmuvx_61, sgzmuvx_62, sgzmuvx_63, sgzmuvx_64, 
#	sgzmuvx_65, sgzmuvx_66, sgzmuvx_67
 
	), by=. (participant,trial)]




################################################################################
################################################################################
################################################################################
################################################################################
		## (4.2.3) Participants Selection

		P<-NULL#rqas for all participants

		#pNN <- c('p01', 'p04', 'p05', 'p10', 'p11', 'p15')
		number_of_participants <- 1



#################################################################################
#################################################################################
################################################################################
#################################################################################
################################
			#### (4.2.2) Trial Selection

			T<-NULL#rqas for all sensors
			
			trials <- c('Trial1','Trial2', 'Trial3')

			#########################################################
			for (trial_k in 1:length(trials) ) {

			trialk <- trials[trial_k]
			message(trialk)

			tkdata <- data

			if (trialk == 'Trial1' ) {
			setkey(tkdata, trial)
			trialkdata <- tkdata[.(c('Trial1'))]
			
			} else if (trialk == 'Trial2' ) {
			setkey(tkdata, trial)
			trialkdata <- tkdata[.(c('Trial2'))]
		
			} else if (trialk == 'Trial3' ) {
			setkey(tkdata, trial)
			trialkdata <- tkdata[.(c('Trial3'))]

			} else {
			message('no valid movement_variable')
			}



#################################################################################
#################################################################################
#################################################################################
#################################################################################
				### (4.2.4) Axis Selection
				
				a<-NULL# rqas for one axis


				axis <- names(data)[3: (  length(data))  ]


				####### Axisk
				for (axis_k in c(1:length(axis)  )){ #for (axis_k in c(1:length(axis))){
				
				
				axisk<- axis[axis_k]
				message('#### axis:' , axisk )

				######################## inputtimeseries
				xn <- trialkdata[,  get(axisk) ]


################################################################################
################################################################################
#  UNIFORM TIME DELAY EMBEDDING
################################################################################
################################################################################

#dimensions <- c(6)
#delays <- c(8)

dimensions <- c(6,7)
delays <- c(8,9)

#dimensions <- c(5, 6, 7)
#delays <- c(7, 8, 9)
#
#dimensions <- c(5, 6, 7, 8, 9, 10)
#delays <- c(5, 6, 7, 8, 9, 10)
#

#dimensions <- seq(1,10)
#delays <- seq(1,10)


################################################################################
for (dim_i in (1:100000)[dimensions]){
    	for (tau_j in (1:100000)[delays]){
		message('>> Embedding parameters:  m=',dim_i,' tau=',d=tau_j)
      	


################################################################################
# Recurrence Quantification Analysis
################################################################################

		epsilons <- c(0.9, 1.0, 1.1)
		#epsilons <- c(0.9, 1.0, 1.1, 1.2)
		#epsilons <- seq(0.2,3.0,0.1)

		for (epsilon_idx in 1:(length(epsilons)) ){

		epsilon_k <- epsilons[ epsilon_idx ] 
		message('                                        epsilon_k: ', epsilon_k )
      	

		rqaa=rqa(
			time.series = xn, 
			embedding.dim= dim_i, time.lag=tau_j, radius=epsilon_k,
			lmin=2, vmin=2, do.plot=FALSE, distanceToBorder=2
			)


#####################################################
#$recurrence.matrix (matrix of N*(m-1)T x N(m-1)T  )
#$diagonalHistogram (vector of N*(m-1)T length  )
#$recurrenceRate  (vector of N*(m-1)T length   )
#####################
#$REC (single value)
#$RATIO (single value)
#$DET (single value)
#$DIV (single value)
#$Lmax (single value)
#$Lmean (single value)
#$LmeanWithoutMain (single value)
#$ENTR (single value)
#$LAM (single value)
#$Vmax (single value)
#$Vmean (single value)

	rqas <- as.data.table(  
		t(	
			c(  
				#rqaa$REC, rqaa$RATIO, rqaa$DET, rqaa$DIV, 
				#rqaa$Lmax, rqaa$Lmean, rqaa$LmeanWithoutMain,
				#rqaa$ENTR, rqaa$LAM, 
				#rqaa$Vmax, rqaa$Vmean
				rqaa$REC, rqaa$ENTR
			)
		)
		)
	fa <- function(x) { axisk  }
       	rqas[,c("Axis"):= fa(), ]

	ft <- function(x) { trialk  }
       	rqas[,c("Sensor"):= ft(), ]

	fD <- function(x) { dim_i }
       	rqas[,c("dim"):= fD(), ]

	fT <- function(x) { tau_j }
       	rqas[,c("tau"):= fT(), ]

	fEp <- function(x) { epsilon_k }
       	rqas[,c("eps"):= fEp(), ]


	a <- rbind(a,rqas) #rqas with axisk

		}#for (epsilon_k in (1:100000)[epsilons]){
################################################################################
# Recurrence Quantification Analysis
################################################################################




	} # for (dim_i in (1:500)[dimensions]){
} # for (tau_j in (1:500)[delays]){
#################################################################################

################################################################################
################################################################################
#  UNIFORM TIME DELAY EMBEDDING
################################################################################
################################################################################







				}##end##for (axis_k in c(1:length(axis)  )){ 
#################################################################################
#################################################################################
#################################################################################
#################################################################################




T <- rbind(T,a) # rqa values with axisk trialk


			}##end##for (trial_k 
#################################################################################
#################################################################################
#################################################################################
#################################################################################







################################################################################
# () Rename col names and change order

rqacn <-	 c(
		'REC', 'ENTR'
		)

names(T)[1:2] <- rqacn
setcolorder(  T,c( 3,4,5,6,7, 1:2)  )

















#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path

