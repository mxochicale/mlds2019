###############################################################################	
#
# Create dataset for openface  features
# 
#
#
#
#
# Miguel Xochicale [http://mxochicale.github.io]
#
###############################################################################	
	# OUTLINE:
	# (0) Loading libraries and functions
 	# (1) Definifing paths and Reading data
	# (2) Data Filtering
		# (2.1) Windowing
	# (4) Creating Preprossed Data Path
	# (5) Writing Data



#################
# Start the clock!
start.time <- Sys.time()


################################################################################
# (0) Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
library(ggplot2) # for plotting 
library(signal)# for butterworth filter and sgolay



################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.

homepath <- Sys.getenv("HOME") 
r_scripts_path <- getwd()
setwd("../../../")
repository_path <- getwd()

#loading extra functions
source( paste(repository_path,'/code/rfunctions/funcextras.R', sep="") )


feature_path <- '/dataset'

### Outcomes Data Path
outcomes_data_path <- paste(repository_path,'/data', feature_path, sep="")
### Raw Data Path
data_path <- paste(repository_path, '/data/rawdata',sep="")




################################################################################
# (1) Setting DataSets paths and reading data
setwd(data_path)
data_path_list <- list.dirs(path = ".", full.names = TRUE, recursive = TRUE)

participantsNN <- 1
trialsNN <- 3
trial_index <- c(3,5,7)


pNNtNN_tmp  <- NULL ## initialise variable

#forSTART......... to read data from participants paths
for(participants_k in 1:participantsNN)
{

	#forSTART......... to read data from trials paths
	for(trials_k in 1:trialsNN)
	{

	participant_NN_path <-  substring( (toString(data_path_list[ trial_index[trials_k] ])) , 2, last = 1000000L)
	full_participant_NN_path <- paste(data_path, participant_NN_path, "/",sep="")
	message(' PATH for PARTICIPANT=', participants_k, '   TRIAL=',  trials_k,'  : ', full_participant_NN_path )
	setwd( full_participant_NN_path )



	details = file.info(list.files(pattern=""))
	files = rownames(details)


    	# Particpant Number
	pNNtNN_ <-  paste("p", participants_k, 't', trials_k, sep="")
    	assign (pNNtNN_, fread(  files[2] , header = TRUE, sep=',') )
    	temp <- get(pNNtNN_)
 
	# add particpant
	func <-function(x) {list( paste('p',participants_k,sep=''))} 
	temp[,c("participant"):=func(), ]
	setcolorder(temp,c(432,1:431) )

	#add trial
	func <-function(x) {list( paste('Trial',trials_k,sep='') )} 
	temp[,c("trial"):=func(), ]
	setcolorder( temp,c(1,433,2:432) )
	pNNtNN_tmp <- rbind(pNNtNN_tmp, temp)


	}
	#forEND......... to read data from trials paths


}
#forEND......... to read data from participants paths


###### dataTable
datatable <- pNNtNN_tmp


################################################################################
# (2) Data Filtering

################################
### (2.1) Windowing Data [xdata[,.SD[1:2],by=.(Participant,Activity,Sensor)]]
windowframe = 002:280;
xdata <- datatable[,.SD[windowframe],by=.(participant,trial)];

##################################
## DELETE COLUMNS
#cols<-c("confidence", "success")
deletecols<-c(

"gaze_0_x", "gaze_0_y", "gaze_0_z", "gaze_1_x", "gaze_1_y", "gaze_1_z", 
"pose_Tx", "pose_Ty", "pose_Tz", "pose_Rx", "pose_Ry", "pose_Rz",

"p_scale", "p_rx", "p_ry", "p_rz", "p_tx", "p_ty", 
"p_0", "p_1", "p_2", "p_3", "p_4", "p_5", "p_6", "p_7", "p_8", "p_9", "p_10", 
"p_11", "p_12", "p_13", "p_14", "p_15", "p_16", "p_17", "p_18", "p_19", "p_20", 
"p_21", "p_22", "p_23", "p_24", "p_25", "p_26", "p_27", "p_28", "p_29", "p_30", 
"p_31", "p_32", "p_33", 

"X_0", "X_1", "X_2", "X_3", "X_4", "X_5", "X_6", "X_7", "X_8", "X_9", "X_10", 
"X_11", "X_12", "X_13", "X_14", "X_15", "X_16", "X_17", "X_18", "X_19", "X_20", 
"X_21", "X_22", "X_23", "X_24", "X_25", "X_26", "X_27", "X_28", "X_29", "X_30", 
"X_31", "X_32", "X_33", "X_34", "X_35", "X_36", "X_37", "X_38", "X_39", "X_40", 
"X_41", "X_42", "X_43", "X_44", "X_45", "X_46", "X_47", "X_48", "X_49", "X_50", 
"X_51", "X_52", "X_53", "X_54", "X_55", "X_56", "X_57", "X_58", "X_59", "X_60", 
"X_61", "X_62", "X_63", "X_64", "X_65", "X_66", "X_67", 

"Y_0", "Y_1", "Y_2", "Y_3", "Y_4", "Y_5", "Y_6", "Y_7", "Y_8", "Y_9", "Y_10", 
"Y_11", "Y_12", "Y_13", "Y_14", "Y_15", "Y_16", "Y_17", "Y_18", "Y_19", "Y_20", 
"Y_21", "Y_22", "Y_23", "Y_24", "Y_25", "Y_26", "Y_27", "Y_28", "Y_29", "Y_30", 
"Y_31", "Y_32", "Y_33", "Y_34", "Y_35", "Y_36", "Y_37", "Y_38", "Y_39", "Y_40", 
"Y_41", "Y_42", "Y_43", "Y_44", "Y_45", "Y_46", "Y_47", "Y_48", "Y_49", "Y_50", 
"Y_51", "Y_52", "Y_53", "Y_54", "Y_55", "Y_56", "Y_57", "Y_58", "Y_59", "Y_60", 
"Y_61", "Y_62", "Y_63", "Y_64", "Y_65", "Y_66", "Y_67", 

"Z_0", "Z_1", "Z_2", "Z_3", "Z_4", "Z_5", "Z_6", "Z_7", "Z_8", "Z_9", "Z_10", 
"Z_11", "Z_12", "Z_13", "Z_14", "Z_15", "Z_16", "Z_17", "Z_18", "Z_19", "Z_20", 
"Z_21", "Z_22", "Z_23", "Z_24", "Z_25", "Z_26", "Z_27", "Z_28", "Z_29", "Z_30", 
"Z_31", "Z_32", "Z_33", "Z_34", "Z_35", "Z_36", "Z_37", "Z_38", "Z_39", "Z_40", 
"Z_41", "Z_42", "Z_43", "Z_44", "Z_45", "Z_46", "Z_47", "Z_48", "Z_49", "Z_50", 
"Z_51", "Z_52", "Z_53", "Z_54", "Z_55", "Z_56", "Z_57", "Z_58", "Z_59", "Z_60", 
"Z_61", "Z_62", "Z_63", "Z_64", "Z_65", "Z_66", "Z_67", 

"AU01_r", "AU02_r", "AU04_r", "AU05_r", "AU06_r", "AU07_r",
"AU09_r", "AU10_r", "AU12_r", "AU14_r", "AU15_r", "AU17_r", 
"AU20_r", "AU23_r", "AU25_r", "AU26_r", "AU45_r", "AU01_c",
"AU02_c", "AU04_c", "AU05_c", "AU06_c", "AU07_c", "AU09_c",
"AU10_c", "AU12_c", "AU14_c", "AU15_c",
"AU17_c", "AU20_c", "AU23_c", "AU25_c", "AU26_c",
"AU28_c", "AU45_c")
xdata[,(deletecols):=NULL]




###############################################
#Fusing x_0 and y_0 using euclidean distance
#a_0 = sqrt( x_0^2 + y_0^2 )

#datatable[,mpg_biased_mean:=mean(mpg), by=cyl]
#participant, trial
# frame, timestamp

###############################################################################
#### FUNCTON TO SMOOTH THE DATA
#euclidean_function <- function(x,y){
#  return( sqrt(x^2 + y^2) )
#}
#
#xdata[,c(
#	"a_0"
#	) 
#		:=mapply(
#		function(x,y) euclidean_function(x,y),
#		x=.(x_0),
#		y=.(y_0)
#		)
#	]
#
#dt[,other_gear:=mapply(function(x, y) setdiff(x, y), x=gearsL, y=gear)]


################################
#adata[,c(
#	"a_0","a_1"
#	) 
#		:=mapply(
#		euclidean_function,
#		.(x_0,x_1),
#		.(y_0,y_1)
#		)
#	]
##ERROR: 2 column matrix RHS of := will be treated as one vector

xdata[, a_0 := sqrt(x_0^2 + y_0^2)]
xdata[, a_1 := sqrt(x_1^2 + y_1^2)]
xdata[, a_2 := sqrt(x_2^2 + y_2^2)]
xdata[, a_3 := sqrt(x_3^2 + y_3^2)]
xdata[, a_4 := sqrt(x_4^2 + y_4^2)]
xdata[, a_5 := sqrt(x_5^2 + y_5^2)]
xdata[, a_6 := sqrt(x_6^2 + y_6^2)]
xdata[, a_7 := sqrt(x_7^2 + y_7^2)]
xdata[, a_8 := sqrt(x_8^2 + y_8^2)]
xdata[, a_9 := sqrt(x_9^2 + y_9^2)]

xdata[, a_10 := sqrt(x_10^2 + y_10^2)]
xdata[, a_11 := sqrt(x_11^2 + y_11^2)]
xdata[, a_12 := sqrt(x_12^2 + y_12^2)]
xdata[, a_13 := sqrt(x_13^2 + y_13^2)]
xdata[, a_14 := sqrt(x_14^2 + y_14^2)]
xdata[, a_15 := sqrt(x_15^2 + y_15^2)]
xdata[, a_16 := sqrt(x_16^2 + y_16^2)]
xdata[, a_17 := sqrt(x_17^2 + y_17^2)]
xdata[, a_18 := sqrt(x_18^2 + y_18^2)]
xdata[, a_19 := sqrt(x_19^2 + y_19^2)]


xdata[, a_20 := sqrt(x_20^2 + y_20^2)]
xdata[, a_21 := sqrt(x_21^2 + y_21^2)]
xdata[, a_22 := sqrt(x_22^2 + y_22^2)]
xdata[, a_23 := sqrt(x_23^2 + y_23^2)]
xdata[, a_24 := sqrt(x_24^2 + y_24^2)]
xdata[, a_25 := sqrt(x_25^2 + y_25^2)]
xdata[, a_26 := sqrt(x_26^2 + y_26^2)]
xdata[, a_27 := sqrt(x_27^2 + y_27^2)]
xdata[, a_28 := sqrt(x_28^2 + y_28^2)]
xdata[, a_29 := sqrt(x_29^2 + y_29^2)]

xdata[, a_30 := sqrt(x_30^2 + y_30^2)]
xdata[, a_31 := sqrt(x_31^2 + y_31^2)]
xdata[, a_32 := sqrt(x_32^2 + y_32^2)]
xdata[, a_33 := sqrt(x_33^2 + y_33^2)]
xdata[, a_34 := sqrt(x_34^2 + y_34^2)]
xdata[, a_35 := sqrt(x_35^2 + y_35^2)]
xdata[, a_36 := sqrt(x_36^2 + y_36^2)]
xdata[, a_37 := sqrt(x_37^2 + y_37^2)]
xdata[, a_38 := sqrt(x_38^2 + y_38^2)]
xdata[, a_39 := sqrt(x_39^2 + y_39^2)]

xdata[, a_40 := sqrt(x_40^2 + y_40^2)]
xdata[, a_41 := sqrt(x_41^2 + y_41^2)]
xdata[, a_42 := sqrt(x_42^2 + y_42^2)]
xdata[, a_43 := sqrt(x_43^2 + y_43^2)]
xdata[, a_44 := sqrt(x_44^2 + y_44^2)]
xdata[, a_45 := sqrt(x_45^2 + y_45^2)]
xdata[, a_46 := sqrt(x_46^2 + y_46^2)]
xdata[, a_47 := sqrt(x_47^2 + y_47^2)]
xdata[, a_48 := sqrt(x_48^2 + y_48^2)]
xdata[, a_49 := sqrt(x_49^2 + y_49^2)]

xdata[, a_50 := sqrt(x_50^2 + y_50^2)]
xdata[, a_51 := sqrt(x_51^2 + y_51^2)]
xdata[, a_52 := sqrt(x_52^2 + y_52^2)]
xdata[, a_53 := sqrt(x_53^2 + y_53^2)]
xdata[, a_54 := sqrt(x_54^2 + y_54^2)]
xdata[, a_55 := sqrt(x_55^2 + y_55^2)]
xdata[, a_56 := sqrt(x_56^2 + y_56^2)]
xdata[, a_57 := sqrt(x_57^2 + y_57^2)]
xdata[, a_58 := sqrt(x_58^2 + y_58^2)]
xdata[, a_59 := sqrt(x_59^2 + y_59^2)]

xdata[, a_60 := sqrt(x_60^2 + y_60^2)]
xdata[, a_61 := sqrt(x_61^2 + y_61^2)]
xdata[, a_62 := sqrt(x_62^2 + y_62^2)]
xdata[, a_63 := sqrt(x_63^2 + y_63^2)]
xdata[, a_64 := sqrt(x_64^2 + y_64^2)]
xdata[, a_65 := sqrt(x_65^2 + y_65^2)]
xdata[, a_66 := sqrt(x_66^2 + y_66^2)]
xdata[, a_67 := sqrt(x_67^2 + y_67^2)]


################################################################################
### (2.2) Zero mean and unit Variance
###
xdata[,c(
	"zmuvx_0",  "zmuvx_1",  "zmuvx_2",  "zmuvx_3",  "zmuvx_4",  
	"zmuvx_5",  "zmuvx_6",  "zmuvx_7",  "zmuvx_8",  "zmuvx_9", 	
	"zmuvx_10", "zmuvx_11", "zmuvx_12", "zmuvx_13", "zmuvx_14", 
	"zmuvx_15", "zmuvx_16", "zmuvx_17", "zmuvx_18", "zmuvx_19",
	"zmuvx_20", "zmuvx_21", "zmuvx_22", "zmuvx_23", "zmuvx_24", 
	"zmuvx_25", "zmuvx_26", "zmuvx_27", "zmuvx_28", "zmuvx_29",
	"zmuvx_30", "zmuvx_31", "zmuvx_32", "zmuvx_33", "zmuvx_34", 
	"zmuvx_35", "zmuvx_36", "zmuvx_37", "zmuvx_38", "zmuvx_39",
	"zmuvx_40", "zmuvx_41", "zmuvx_42", "zmuvx_43", "zmuvx_44", 
	"zmuvx_45", "zmuvx_46", "zmuvx_47", "zmuvx_48", "zmuvx_49",
        "zmuvx_50", "zmuvx_51", "zmuvx_52", "zmuvx_53", "zmuvx_54", 
	"zmuvx_55", "zmuvx_56", "zmuvx_57", "zmuvx_58", "zmuvx_59",
	"zmuvx_60", "zmuvx_61", "zmuvx_62", "zmuvx_63", "zmuvx_64", 
	"zmuvx_65", "zmuvx_66", "zmuvx_67",
	
	"zmuvy_0",  "zmuvy_1",  "zmuvy_2",  "zmuvy_3",  "zmuvy_4",  
	"zmuvy_5",  "zmuvy_6",  "zmuvy_7",  "zmuvy_8",  "zmuvy_9", 
	"zmuvy_10", "zmuvy_11", "zmuvy_12", "zmuvy_13", "zmuvy_14", 
	"zmuvy_15", "zmuvy_16", "zmuvy_17", "zmuvy_18", "zmuvy_19",
	"zmuvy_20", "zmuvy_21", "zmuvy_22", "zmuvy_23", "zmuvy_24", 
	"zmuvy_25", "zmuvy_26", "zmuvy_27", "zmuvy_28", "zmuvy_29",
	"zmuvy_30", "zmuvy_31", "zmuvy_32", "zmuvy_33", "zmuvy_34", 
	"zmuvy_35", "zmuvy_36", "zmuvy_37", "zmuvy_38", "zmuvy_39",
	"zmuvy_40", "zmuvy_41", "zmuvy_42", "zmuvy_43", "zmuvy_44", 
	"zmuvy_45", "zmuvy_46", "zmuvy_47", "zmuvy_48", "zmuvy_49",
        "zmuvy_50", "zmuvy_51", "zmuvy_52", "zmuvy_53", "zmuvy_54", 
	"zmuvy_55", "zmuvy_56", "zmuvy_57", "zmuvy_58", "zmuvy_59",
	"zmuvy_60", "zmuvy_61", "zmuvy_62", "zmuvy_63", "zmuvy_64", 
	"zmuvy_65", "zmuvy_66", "zmuvy_67",

	"zmuva_0",  "zmuva_1",  "zmuva_2",  "zmuva_3",  "zmuva_4",  
	"zmuva_5",  "zmuva_6",  "zmuva_7",  "zmuva_8",  "zmuva_9", 
	"zmuva_10", "zmuva_11", "zmuva_12", "zmuva_13", "zmuva_14", 
	"zmuva_15", "zmuva_16", "zmuva_17", "zmuva_18", "zmuva_19",
	"zmuva_20", "zmuva_21", "zmuva_22", "zmuva_23", "zmuva_24", 
	"zmuva_25", "zmuva_26", "zmuva_27", "zmuva_28", "zmuva_29",
	"zmuva_30", "zmuva_31", "zmuva_32", "zmuva_33", "zmuva_34", 
	"zmuva_35", "zmuva_36", "zmuva_37", "zmuva_38", "zmuva_39",
	"zmuva_40", "zmuva_41", "zmuva_42", "zmuva_43", "zmuva_44", 
	"zmuva_45", "zmuva_46", "zmuva_47", "zmuva_48", "zmuva_49",
        "zmuva_50", "zmuva_51", "zmuva_52", "zmuva_53", "zmuva_54", 
	"zmuva_55", "zmuva_56", "zmuva_57", "zmuva_58", "zmuva_59",
	"zmuva_60", "zmuva_61", "zmuva_62", "zmuva_63", "zmuva_64", 
	"zmuva_65", "zmuva_66", "zmuva_67"
	
	
	) :=
       lapply(.(
	x_0,  x_1,  x_2,  x_3,  x_4,  x_5,  x_6,  x_7,  x_8,  x_9, 
	x_10, x_11, x_12, x_13, x_14, x_15, x_16, x_17, x_18, x_19,
	x_20, x_21, x_22, x_23, x_24, x_25, x_26, x_27, x_28, x_29,
	x_30, x_31, x_32, x_33, x_34, x_35, x_36, x_37, x_38, x_39,
	x_40, x_41, x_42, x_43, x_44, x_45, x_46, x_47, x_48, x_49,
        x_50, x_51, x_52, x_53, x_54, x_55, x_56, x_57, x_58, x_59,
	x_60, x_61, x_62, x_63, x_64, x_65, x_66, x_67,

	y_0,  y_1,  y_2,  y_3,  y_4,  y_5,  y_6,  y_7,  y_8,  y_9, 
	y_10, y_11, y_12, y_13, y_14, y_15, y_16, y_17, y_18, y_19,
	y_20, y_21, y_22, y_23, y_24, y_25, y_26, y_27, y_28, y_29,
	y_30, y_31, y_32, y_33, y_34, y_35, y_36, y_37, y_38, y_39,
	y_40, y_41, y_42, y_43, y_44, y_45, y_46, y_47, y_48, y_49,
        y_50, y_51, y_52, y_53, y_54, y_55, y_56, y_57, y_58, y_59,
	y_60, y_61, y_62, y_63, y_64, y_65, y_66, y_67,

	a_0,  a_1,  a_2,  a_3,  a_4,  a_5,  a_6,  a_7,  a_8,  a_9, 
	a_10, a_11, a_12, a_13, a_14, a_15, a_16, a_17, a_18, a_19,
	a_20, a_21, a_22, a_23, a_24, a_25, a_26, a_27, a_28, a_29,
	a_30, a_31, a_32, a_33, a_34, a_35, a_36, a_37, a_38, a_39,
	a_40, a_41, a_42, a_43, a_44, a_45, a_46, a_47, a_48, a_49,
        a_50, a_51, a_52, a_53, a_54, a_55, a_56, a_57, a_58, a_59,
	a_60, a_61, a_62, a_63, a_64, a_65, a_66, a_67

	), function(x) ( zeromean_unitvariance(x)  ) )
	]






################################################################################
### (2.3) Smoothing data with Savitzky-Golay Filter
###
#SavitzkyGolayCoeffs <- sgolay(p=5,n=155 ,m=0)
SavitzkyGolayCoeffs <- sgolay(p=5,n=105 ,m=0)

### FUNCTON TO SMOOTH THE DATA
SGolay <- function(xinput,sgCoeffs){
  output <- filter(sgCoeffs, xinput)
  return(output)
}


xdata[,c(
	"sgzmuvx_0",  "sgzmuvx_1",  "sgzmuvx_2",  "sgzmuvx_3",  "sgzmuvx_4",  
	"sgzmuvx_5",  "sgzmuvx_6",  "sgzmuvx_7",  "sgzmuvx_8",  "sgzmuvx_9", 
	"sgzmuvx_10", "sgzmuvx_11", "sgzmuvx_12", "sgzmuvx_13", "sgzmuvx_14", 
	"sgzmuvx_15", "sgzmuvx_16", "sgzmuvx_17", "sgzmuvx_18", "sgzmuvx_19",
	"sgzmuvx_20", "sgzmuvx_21", "sgzmuvx_22", "sgzmuvx_23", "sgzmuvx_24", 
	"sgzmuvx_25", "sgzmuvx_26", "sgzmuvx_27", "sgzmuvx_28", "sgzmuvx_29",
	"sgzmuvx_30", "sgzmuvx_31", "sgzmuvx_32", "sgzmuvx_33", "sgzmuvx_34", 
	"sgzmuvx_35", "sgzmuvx_36", "sgzmuvx_37", "sgzmuvx_38", "sgzmuvx_39",
	"sgzmuvx_40", "sgzmuvx_41", "sgzmuvx_42", "sgzmuvx_43", "sgzmuvx_44", 
	"sgzmuvx_45", "sgzmuvx_46", "sgzmuvx_47", "sgzmuvx_48", "sgzmuvx_49",
        "sgzmuvx_50", "sgzmuvx_51", "sgzmuvx_52", "sgzmuvx_53", "sgzmuvx_54", 
	"sgzmuvx_55", "sgzmuvx_56", "sgzmuvx_57", "sgzmuvx_58", "sgzmuvx_59",
	"sgzmuvx_60", "sgzmuvx_61", "sgzmuvx_62", "sgzmuvx_63", "sgzmuvx_64", 
	"sgzmuvx_65", "sgzmuvx_66", "sgzmuvx_67",
	
	"sgzmuvy_0",  "sgzmuvy_1",  "sgzmuvy_2",  "sgzmuvy_3",  "sgzmuvy_4",  
	"sgzmuvy_5",  "sgzmuvy_6",  "sgzmuvy_7",  "sgzmuvy_8",  "sgzmuvy_9", 
	"sgzmuvy_10", "sgzmuvy_11", "sgzmuvy_12", "sgzmuvy_13", "sgzmuvy_14", 
	"sgzmuvy_15", "sgzmuvy_16", "sgzmuvy_17", "sgzmuvy_18", "sgzmuvy_19",
	"sgzmuvy_20", "sgzmuvy_21", "sgzmuvy_22", "sgzmuvy_23", "sgzmuvy_24", 
	"sgzmuvy_25", "sgzmuvy_26", "sgzmuvy_27", "sgzmuvy_28", "sgzmuvy_29",
	"sgzmuvy_30", "sgzmuvy_31", "sgzmuvy_32", "sgzmuvy_33", "sgzmuvy_34", 
	"sgzmuvy_35", "sgzmuvy_36", "sgzmuvy_37", "sgzmuvy_38", "sgzmuvy_39",
	"sgzmuvy_40", "sgzmuvy_41", "sgzmuvy_42", "sgzmuvy_43", "sgzmuvy_44", 
	"sgzmuvy_45", "sgzmuvy_46", "sgzmuvy_47", "sgzmuvy_48", "sgzmuvy_49",
        "sgzmuvy_50", "sgzmuvy_51", "sgzmuvy_52", "sgzmuvy_53", "sgzmuvy_54", 
	"sgzmuvy_55", "sgzmuvy_56", "sgzmuvy_57", "sgzmuvy_58", "sgzmuvy_59",
	"sgzmuvy_60", "sgzmuvy_61", "sgzmuvy_62", "sgzmuvy_63", "sgzmuvy_64", 
	"sgzmuvy_65", "sgzmuvy_66", "sgzmuvy_67",

	"sgzmuva_0",  "sgzmuva_1",  "sgzmuva_2",  "sgzmuva_3",  "sgzmuva_4",  
	"sgzmuva_5",  "sgzmuva_6",  "sgzmuva_7",  "sgzmuva_8",  "sgzmuva_9", 
	"sgzmuva_10", "sgzmuva_11", "sgzmuva_12", "sgzmuva_13", "sgzmuva_14", 
	"sgzmuva_15", "sgzmuva_16", "sgzmuva_17", "sgzmuva_18", "sgzmuva_19",
	"sgzmuva_20", "sgzmuva_21", "sgzmuva_22", "sgzmuva_23", "sgzmuva_24", 
	"sgzmuva_25", "sgzmuva_26", "sgzmuva_27", "sgzmuva_28", "sgzmuva_29",
	"sgzmuva_30", "sgzmuva_31", "sgzmuva_32", "sgzmuva_33", "sgzmuva_34", 
	"sgzmuva_35", "sgzmuva_36", "sgzmuva_37", "sgzmuva_38", "sgzmuva_39",
	"sgzmuva_40", "sgzmuva_41", "sgzmuva_42", "sgzmuva_43", "sgzmuva_44", 
	"sgzmuva_45", "sgzmuva_46", "sgzmuva_47", "sgzmuva_48", "sgzmuva_49",
        "sgzmuva_50", "sgzmuva_51", "sgzmuva_52", "sgzmuva_53", "sgzmuva_54", 
	"sgzmuva_55", "sgzmuva_56", "sgzmuva_57", "sgzmuva_58", "sgzmuva_59",
	"sgzmuva_60", "sgzmuva_61", "sgzmuva_62", "sgzmuva_63", "sgzmuva_64", 
	"sgzmuva_65", "sgzmuva_66", "sgzmuva_67"

	) 
:=lapply(
	.(
	zmuvx_0,  zmuvx_1,  zmuvx_2,  zmuvx_3,  zmuvx_4,  zmuvx_5,  zmuvx_6,  zmuvx_7, zmuvx_8, zmuvx_9, 
	zmuvx_10, zmuvx_11, zmuvx_12, zmuvx_13, zmuvx_14, zmuvx_15, zmuvx_16, zmuvx_17, zmuvx_18, zmuvx_19,
	zmuvx_20, zmuvx_21, zmuvx_22, zmuvx_23, zmuvx_24, zmuvx_25, zmuvx_26, zmuvx_27, zmuvx_28, zmuvx_29,
	zmuvx_30, zmuvx_31, zmuvx_32, zmuvx_33, zmuvx_34, zmuvx_35, zmuvx_36, zmuvx_37, zmuvx_38, zmuvx_39,
	zmuvx_40, zmuvx_41, zmuvx_42, zmuvx_43, zmuvx_44, zmuvx_45, zmuvx_46, zmuvx_47, zmuvx_48, zmuvx_49,
        zmuvx_50, zmuvx_51, zmuvx_52, zmuvx_53, zmuvx_54, zmuvx_55, zmuvx_56, zmuvx_57, zmuvx_58, zmuvx_59,
	zmuvx_60, zmuvx_61, zmuvx_62, zmuvx_63, zmuvx_64, zmuvx_65, zmuvx_66, zmuvx_67,

	zmuvy_0, zmuvy_1,  zmuvy_2,  zmuvy_3,  zmuvy_4, zmuvy_5, zmuvy_6, zmuvy_7, zmuvy_8, zmuvy_9, 
	zmuvy_10, zmuvy_11, zmuvy_12, zmuvy_13, zmuvy_14, zmuvy_15, zmuvy_16, zmuvy_17, zmuvy_18, zmuvy_19,
	zmuvy_20, zmuvy_21, zmuvy_22, zmuvy_23, zmuvy_24, zmuvy_25, zmuvy_26, zmuvy_27, zmuvy_28, zmuvy_29,
	zmuvy_30, zmuvy_31, zmuvy_32, zmuvy_33, zmuvy_34, zmuvy_35, zmuvy_36, zmuvy_37, zmuvy_38, zmuvy_39,
	zmuvy_40, zmuvy_41, zmuvy_42, zmuvy_43, zmuvy_44, zmuvy_45, zmuvy_46, zmuvy_47, zmuvy_48, zmuvy_49,
        zmuvy_50, zmuvy_51, zmuvy_52, zmuvy_53, zmuvy_54, zmuvy_55, zmuvy_56, zmuvy_57, zmuvy_58, zmuvy_59,
	zmuvy_60, zmuvy_61, zmuvy_62, zmuvy_63, zmuvy_64, zmuvy_65, zmuvy_66, zmuvy_67,

	zmuva_0, zmuva_1,  zmuva_2,  zmuva_3,  zmuva_4, zmuva_5, zmuva_6, zmuva_7, zmuva_8, zmuva_9, 
	zmuva_10, zmuva_11, zmuva_12, zmuva_13, zmuva_14, zmuva_15, zmuva_16, zmuva_17, zmuva_18, zmuva_19,
	zmuva_20, zmuva_21, zmuva_22, zmuva_23, zmuva_24, zmuva_25, zmuva_26, zmuva_27, zmuva_28, zmuva_29,
	zmuva_30, zmuva_31, zmuva_32, zmuva_33, zmuva_34, zmuva_35, zmuva_36, zmuva_37, zmuva_38, zmuva_39,
	zmuva_40, zmuva_41, zmuva_42, zmuva_43, zmuva_44, zmuva_45, zmuva_46, zmuva_47, zmuva_48, zmuva_49,
        zmuva_50, zmuva_51, zmuva_52, zmuva_53, zmuva_54, zmuva_55, zmuva_56, zmuva_57, zmuva_58, zmuva_59,
	zmuva_60, zmuva_61, zmuva_62, zmuva_63, zmuva_64, zmuva_65, zmuva_66, zmuva_67

	),
	function(x) ( SGolay(x,SavitzkyGolayCoeffs)  ))
	]




#####################################
#### 
xdata[, left_eye := sqrt(a_36^2 + a_37^2 + a_38^2 + a_39^2 + a_40^2 + a_41^2)]
xdata[, right_eye := sqrt(a_42^2 + a_43^2 + a_44^2 + a_45^2 + a_46^2 + a_47^2)]
xdata[, out_mouth := sqrt(
		a_48^2 + a_49^2 + a_50^2 + a_51^2 + a_52^2 + a_53^2 + 
		a_54^2 + a_55^2 + a_56^2 + a_57^2 + a_58^2 + a_59^2 
		)]




#####################################
#### 
xdata[, zmuva_left_eye := sqrt(zmuva_36^2 + zmuva_37^2 + zmuva_38^2 + zmuva_39^2 + zmuva_40^2 + zmuva_41^2)]
xdata[, zmuva_right_eye := sqrt(zmuva_42^2 + zmuva_43^2 + zmuva_44^2 + zmuva_45^2 + zmuva_46^2 + zmuva_47^2)]
xdata[, zmuva_out_mouth := sqrt(
		zmuva_48^2 + zmuva_49^2 + zmuva_50^2 + zmuva_51^2 + zmuva_52^2 + zmuva_53^2 + 
		zmuva_54^2 + zmuva_55^2 + zmuva_56^2 + zmuva_57^2 + zmuva_58^2 + zmuva_59^2 
		)]




#####################################
#### 
xdata[, sgzmuva_left_eye := sqrt(sgzmuva_36^2 + sgzmuva_37^2 + sgzmuva_38^2 + sgzmuva_39^2 + sgzmuva_40^2 + sgzmuva_41^2)]
xdata[, sgzmuva_right_eye := sqrt(sgzmuva_42^2 + sgzmuva_43^2 + sgzmuva_44^2 + sgzmuva_45^2 + sgzmuva_46^2 + sgzmuva_47^2)]
xdata[, sgzmuva_out_mouth := sqrt(
		sgzmuva_48^2 + sgzmuva_49^2 + sgzmuva_50^2 + sgzmuva_51^2 + sgzmuva_52^2 + sgzmuva_53^2 + 
		sgzmuva_54^2 + sgzmuva_55^2 + sgzmuva_56^2 + sgzmuva_57^2 + sgzmuva_58^2 + sgzmuva_59^2 
		)]








#################################################################################
## (4) Creating Preprossed Data Path
#

if (file.exists(outcomes_data_path)){
    setwd(file.path(outcomes_data_path))
} else {
  dir.create(outcomes_data_path, recursive=TRUE)
  setwd(file.path(outcomes_data_path))
}


################################################################################
####  (5)  Writing Data
write.table(xdata, "face_landmarks.dt", row.name=FALSE)

message('datatable file has been created at '  )
message (outcomes_data_path)





#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path


