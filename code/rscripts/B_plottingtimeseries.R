###############################################################################	
#
# Time series plots for the openface landmarks 
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
	# (3) Plotting (PLOTTING_TIMESERIES = TRUE/FALSE)
		# (3.1) Creating and changing plotting paths
		# (3.2) Plots features
		# (3.3) Plots data from openface



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


feature_path <- '/dataset'
graphics_path <- '/timeseries'

### Outcomes Data Path
outcomes_graphics_path <- paste(repository_path,'/docs/figs', graphics_path, sep="")

### DataSet Path
data_path <- paste(repository_path,'/data', feature_path, sep="")



################################################################################
# (1) Setting DataSets paths and reading data
setwd(data_path)


################################################################################
# (2) Reading data
file_ext <- "rawopenfacedata.dt"
xdata <- fread( file_ext, header=TRUE)



################################################################################
# (3) Creating Preprossed Data Path

if (file.exists(outcomes_graphics_path)){
    setwd(file.path(outcomes_graphics_path))
} else {
  dir.create(outcomes_graphics_path, recursive=TRUE)
  setwd(file.path(outcomes_graphics_path))
}




#######################################################################
#######################################################################
#######################################################################
#######################################################################
#################
# (3.2) Plots Features
tag <- 'openface-timeseries'
image_width <- 3000
image_height <- 3000
image_dpi <- 300
image_bg <- "transparent"

plotlinewidth <- 1



#####################
## (3.3) Plots Data from OpenFace

#Confidence and success
plot <- ggplot(xdata, aes(x=frame) ) +	
	geom_line( aes(y=confidence, col='confidence'), size=plotlinewidth )+
	geom_line( aes(y=as.numeric(success), col='success'), size=plotlinewidth )+
	facet_grid(trial ~ participant )+
  	theme_bw(20) +	
	ylab('Raw Values') + 
	xlab('Sample')+
	labs(colour = 'Feature')


png(filename= paste(tag,"_confidence_success.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()


#
## Gaze 0
#plot <- ggplot(xdata, aes(x=frame) ) +	
#  	geom_line( aes(y=gaze_0_x, color='gaze_0_x'), size=plotlinewidth)+
#  	geom_line( aes(y=gaze_0_y, color='gaze_0_y'), size=plotlinewidth)+
#  	geom_line( aes(y=gaze_0_z, color='gaze_0_z'), size=plotlinewidth)+
#  	facet_grid(trial ~ participant )+
#  	theme_bw(20) +
#
#	ylab('Raw Values') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#png(filename= paste(tag,"_gaze_0_xyz.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#
#
## Gaze 1
#plot <- ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=gaze_1_x, color='gaze_1_x'), size=plotlinewidth)+
#  geom_line( aes(y=gaze_1_y, color='gaze_1_y'), size=plotlinewidth)+
#  geom_line( aes(y=gaze_1_z, color='gaze_1_z'), size=plotlinewidth)+
#  facet_grid(trial ~ participant)+
#	theme_bw(20) +
#
#	ylab('Raw Values') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#png(filename= paste(tag,"_gaze_1_xyz.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#



## Pose estimation with respect to the camera


plot <- ggplot(xdata, aes(x=frame) ) +	
   geom_line( aes(y=pose_Tx, col='pose_Tx'), size=plotlinewidth)+
   geom_line( aes(y=pose_Ty, col='pose_Ty'), size=plotlinewidth)+

	facet_grid(trial ~ participant )+
  	theme_bw(20) +

	#coord_cartesian(xlim=NULL, ylim=c(-50,50))+
	ylab('Location of the head with respect to the camera [millimetre]') + 
	xlab('Sample')+
	labs(colour = 'Feature')

png(filename= paste(tag,"_pose_TxTy.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()



plot <- ggplot(xdata, aes(x=frame) ) +	
   geom_line( aes(y=pose_Tz, col='pose_Tz'), size=plotlinewidth)+

	facet_grid(trial ~ participant )+
  	theme_bw(20) +

	#coord_cartesian(xlim=NULL, ylim=c(800,1200))+
	ylab('Location of the head with respect to the camera [millimetre]') + 
	xlab('Sample')+
	labs(colour = 'Feature')

png(filename= paste(tag,"_pose_Tz.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()




plot <- ggplot(xdata, aes(x=frame) ) +	
   geom_line( aes(y=pose_Rx, col='pose_Rx'), size=plotlinewidth)+
   geom_line( aes(y=pose_Ry, col='pose_Ry'), size=plotlinewidth)+
   geom_line( aes(y=pose_Rz, col='pose_Rz'), size=plotlinewidth)+

	facet_grid(trial ~ participant )+
  	theme_bw(20) +

	coord_cartesian(xlim=NULL, ylim=c(-0.5,0.5))+
	ylab('Rotation of the head [Radians]') + 
	xlab('Sample')+
	labs(colour = 'Feature')

png(filename= paste(tag,"_pose_RxRyRz.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()



#
#
##x_48, x_49, x_50, x_51, x_52, x_53, x_54, x_55, x_56, x_57, x_58, x_59, x_60, x_61, x_62, x_63, x_64, x_65, x_66, x_67, 
#plot <-	ggplot(xdata, aes(x=frame) ) +	
# 	geom_line( aes(y=x_48, col='x_48'), size=plotlinewidth)+
# 	geom_line( aes(y=x_49, col='x_49'), size=plotlinewidth)+
# 	geom_line( aes(y=x_50, col='x_50'), size=plotlinewidth)+
# 	geom_line( aes(y=x_51, col='x_51'), size=plotlinewidth)+
# 	geom_line( aes(y=x_52, col='x_52'), size=plotlinewidth)+
# 	geom_line( aes(y=x_53, col='x_53'), size=plotlinewidth)+
# 	geom_line( aes(y=x_54, col='x_54'), size=plotlinewidth)+
# 	geom_line( aes(y=x_55, col='x_55'), size=plotlinewidth)+
# 	geom_line( aes(y=x_56, col='x_56'), size=plotlinewidth)+
# 	geom_line( aes(y=x_57, col='x_57'), size=plotlinewidth)+
# 	geom_line( aes(y=x_58, col='x_58'), size=plotlinewidth)+
# 	geom_line( aes(y=x_59, col='x_59'), size=plotlinewidth)+
# 	geom_line( aes(y=x_60, col='x_60'), size=plotlinewidth)+
# 	geom_line( aes(y=x_61, col='x_61'), size=plotlinewidth)+
# 	geom_line( aes(y=x_62, col='x_62'), size=plotlinewidth)+
# 	geom_line( aes(y=x_63, col='x_63'), size=plotlinewidth)+
# 	geom_line( aes(y=x_64, col='x_64'), size=plotlinewidth)+
# 	geom_line( aes(y=x_65, col='x_65'), size=plotlinewidth)+
# 	geom_line( aes(y=x_66, col='x_66'), size=plotlinewidth)+
# 	geom_line( aes(y=x_67, col='x_67'), size=plotlinewidth)+
#
#
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#
#	coord_cartesian(xlim=NULL, ylim=NULL)+
#	ylab('Landmarks Location in 2D [Pixels]') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_x_48_to_x_67_mouth.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
###y_48, y_49, y_50, y_51, y_52, y_53, y_54, y_55, y_56, y_57, y_58, y_59, y_60, y_61, y_62, y_63, y_64, y_65, y_66, y_67, 
#plot <-	ggplot(xdata, aes(x=frame) ) +	
# 	geom_line( aes(y=y_48, col='y_48'), size=plotlinewidth)+
# 	geom_line( aes(y=y_49, col='y_49'), size=plotlinewidth)+
# 	geom_line( aes(y=y_50, col='y_50'), size=plotlinewidth)+
# 	geom_line( aes(y=y_51, col='y_51'), size=plotlinewidth)+
# 	geom_line( aes(y=y_52, col='y_52'), size=plotlinewidth)+
# 	geom_line( aes(y=y_53, col='y_53'), size=plotlinewidth)+
# 	geom_line( aes(y=y_54, col='y_54'), size=plotlinewidth)+
# 	geom_line( aes(y=y_55, col='y_55'), size=plotlinewidth)+
# 	geom_line( aes(y=y_56, col='y_56'), size=plotlinewidth)+
# 	geom_line( aes(y=y_57, col='y_57'), size=plotlinewidth)+
# 	geom_line( aes(y=y_58, col='y_58'), size=plotlinewidth)+
# 	geom_line( aes(y=y_59, col='y_59'), size=plotlinewidth)+
# 	geom_line( aes(y=y_60, col='y_60'), size=plotlinewidth)+
# 	geom_line( aes(y=y_61, col='y_61'), size=plotlinewidth)+
# 	geom_line( aes(y=y_62, col='y_62'), size=plotlinewidth)+
# 	geom_line( aes(y=y_63, col='y_63'), size=plotlinewidth)+
# 	geom_line( aes(y=y_64, col='y_64'), size=plotlinewidth)+
# 	geom_line( aes(y=y_65, col='y_65'), size=plotlinewidth)+
# 	geom_line( aes(y=y_66, col='y_66'), size=plotlinewidth)+
# 	geom_line( aes(y=y_67, col='y_67'), size=plotlinewidth)+
#
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#
#	coord_cartesian(xlim=NULL, ylim=NULL)+
#	ylab('Landmarks Location in 2D [Pixels]') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_y_48_to_y_67_mouth.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#
#
##
###x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7, x_8, x_9, x_10, x_11, x_12, x_13, x_14, x_15, x_16, 
#plot <-	ggplot(xdata, aes(x=frame) ) +	
# 	geom_line( aes(y=x_0, col='x_00'), size=plotlinewidth)+
# 	geom_line( aes(y=x_1, col='x_01'), size=plotlinewidth)+
# 	geom_line( aes(y=x_2, col='x_02'), size=plotlinewidth)+
# 	geom_line( aes(y=x_3, col='x_03'), size=plotlinewidth)+
# 	geom_line( aes(y=x_4, col='x_04'), size=plotlinewidth)+
# 	geom_line( aes(y=x_5, col='x_05'), size=plotlinewidth)+
# 	geom_line( aes(y=x_6, col='x_06'), size=plotlinewidth)+
# 	geom_line( aes(y=x_7, col='x_07'), size=plotlinewidth)+
# 	geom_line( aes(y=x_8, col='x_08'), size=plotlinewidth)+
# 	geom_line( aes(y=x_9, col='x_09'), size=plotlinewidth)+
# 	geom_line( aes(y=x_10, col='x_10'), size=plotlinewidth)+
# 	geom_line( aes(y=x_11, col='x_11'), size=plotlinewidth)+
# 	geom_line( aes(y=x_12, col='x_12'), size=plotlinewidth)+
# 	geom_line( aes(y=x_13, col='x_13'), size=plotlinewidth)+
# 	geom_line( aes(y=x_14, col='x_14'), size=plotlinewidth)+
# 	geom_line( aes(y=x_15, col='x_15'), size=plotlinewidth)+
# 	geom_line( aes(y=x_16, col='x_16'), size=plotlinewidth)+
#
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#
#	coord_cartesian(xlim=NULL, ylim=NULL)+
#	ylab('Landmarks Location in 2D [Pixels]') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#png(filename= paste(tag,"_x_01_to_x_16_roundface.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#
##
###y_0, y_1, y_2, y_3, y_4, y_5, y_6, y_7, y_8, y_9, y_10, y_11, y_12, y_13, y_14, y_15, y_16, 
#plot <-	ggplot(xdata, aes(x=frame) ) +	
# 	geom_line( aes(y=y_0, col='y_00'), size=plotlinewidth)+
# 	geom_line( aes(y=y_1, col='y_01'), size=plotlinewidth)+
# 	geom_line( aes(y=y_2, col='y_02'), size=plotlinewidth)+
# 	geom_line( aes(y=y_3, col='y_03'), size=plotlinewidth)+
# 	geom_line( aes(y=y_4, col='y_04'), size=plotlinewidth)+
# 	geom_line( aes(y=y_5, col='y_05'), size=plotlinewidth)+
# 	geom_line( aes(y=y_6, col='y_06'), size=plotlinewidth)+
# 	geom_line( aes(y=y_7, col='y_07'), size=plotlinewidth)+
# 	geom_line( aes(y=y_8, col='y_08'), size=plotlinewidth)+
# 	geom_line( aes(y=y_9, col='y_09'), size=plotlinewidth)+
# 	geom_line( aes(y=y_10, col='y_10'), size=plotlinewidth)+
# 	geom_line( aes(y=y_11, col='y_11'), size=plotlinewidth)+
# 	geom_line( aes(y=y_12, col='y_12'), size=plotlinewidth)+
# 	geom_line( aes(y=y_13, col='y_13'), size=plotlinewidth)+
# 	geom_line( aes(y=y_14, col='y_14'), size=plotlinewidth)+
# 	geom_line( aes(y=y_15, col='y_15'), size=plotlinewidth)+
# 	geom_line( aes(y=y_16, col='y_16'), size=plotlinewidth)+
#
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#
#	coord_cartesian(xlim=NULL, ylim=NULL)+
#	ylab('Landmarks Location in 2D [Pixels]') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#png(filename= paste(tag,"_y_01_to_y_16_roundface.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
##
###x_17, x_18, x_19, x_20, x_21, x_22, x_23, x_24, x_25, x_26
#plot <-	ggplot(xdata, aes(x=frame) ) +	
# 	geom_line( aes(y=x_17, col='x_17'), size=plotlinewidth)+
# 	geom_line( aes(y=x_18, col='x_18'), size=plotlinewidth)+
# 	geom_line( aes(y=x_19, col='x_19'), size=plotlinewidth)+
# 	geom_line( aes(y=x_20, col='x_20'), size=plotlinewidth)+
# 	geom_line( aes(y=x_21, col='x_21'), size=plotlinewidth)+
# 	geom_line( aes(y=x_22, col='x_22'), size=plotlinewidth)+
# 	geom_line( aes(y=x_23, col='x_23'), size=plotlinewidth)+
# 	geom_line( aes(y=x_24, col='x_24'), size=plotlinewidth)+
# 	geom_line( aes(y=x_25, col='x_25'), size=plotlinewidth)+
# 	geom_line( aes(y=x_26, col='x_26'), size=plotlinewidth)+
#
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#
#	coord_cartesian(xlim=NULL, ylim=NULL)+
#	ylab('Landmarks Location in 2D [Pixels]') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#png(filename= paste(tag,"_x_17_to_x_26_eyerbrows.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#
#
#
##
###y_17, y_18, y_19, y_20, y_21, y_22, y_23, y_24, y_25, y_26, 
#plot <-	ggplot(xdata, aes(x=frame) ) +	
# 	geom_line( aes(y=y_17, col='y_17'), size=plotlinewidth)+
# 	geom_line( aes(y=y_18, col='y_18'), size=plotlinewidth)+
# 	geom_line( aes(y=y_19, col='y_19'), size=plotlinewidth)+
# 	geom_line( aes(y=y_20, col='y_20'), size=plotlinewidth)+
# 	geom_line( aes(y=y_21, col='y_21'), size=plotlinewidth)+
# 	geom_line( aes(y=y_22, col='y_22'), size=plotlinewidth)+
# 	geom_line( aes(y=y_23, col='y_23'), size=plotlinewidth)+
# 	geom_line( aes(y=y_24, col='y_24'), size=plotlinewidth)+
# 	geom_line( aes(y=y_25, col='y_25'), size=plotlinewidth)+
# 	geom_line( aes(y=y_26, col='y_26'), size=plotlinewidth)+
#
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	
#	coord_cartesian(xlim=NULL, ylim=NULL)+
#	ylab('Landmarks Location in 2D [Pixels]') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#png(filename= paste(tag,"_y_17_to_y_26_eyerbrows.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#
#
#
#
#
#
#
#
#



##x_0,...x_67, 
plot <-	ggplot(xdata, aes(x=frame) ) +	
 	geom_line( aes(y=x_0, col='x_00'), size=plotlinewidth)+
 	geom_line( aes(y=x_1, col='x_01'), size=plotlinewidth)+
 	geom_line( aes(y=x_2, col='x_02'), size=plotlinewidth)+
 	geom_line( aes(y=x_3, col='x_03'), size=plotlinewidth)+
 	geom_line( aes(y=x_4, col='x_04'), size=plotlinewidth)+
 	geom_line( aes(y=x_5, col='x_05'), size=plotlinewidth)+
 	geom_line( aes(y=x_6, col='x_06'), size=plotlinewidth)+
 	geom_line( aes(y=x_7, col='x_07'), size=plotlinewidth)+
 	geom_line( aes(y=x_8, col='x_08'), size=plotlinewidth)+
 	geom_line( aes(y=x_9, col='x_09'), size=plotlinewidth)+
 	geom_line( aes(y=x_10, col='x_10'), size=plotlinewidth)+
 	geom_line( aes(y=x_11, col='x_11'), size=plotlinewidth)+
 	geom_line( aes(y=x_12, col='x_12'), size=plotlinewidth)+
 	geom_line( aes(y=x_13, col='x_13'), size=plotlinewidth)+
 	geom_line( aes(y=x_14, col='x_14'), size=plotlinewidth)+
 	geom_line( aes(y=x_15, col='x_15'), size=plotlinewidth)+
 	geom_line( aes(y=x_16, col='x_16'), size=plotlinewidth)+
 	geom_line( aes(y=x_17, col='x_17'), size=plotlinewidth)+
 	geom_line( aes(y=x_18, col='x_18'), size=plotlinewidth)+
 	geom_line( aes(y=x_19, col='x_19'), size=plotlinewidth)+
 	geom_line( aes(y=x_20, col='x_20'), size=plotlinewidth)+
 	geom_line( aes(y=x_21, col='x_21'), size=plotlinewidth)+
 	geom_line( aes(y=x_22, col='x_22'), size=plotlinewidth)+
 	geom_line( aes(y=x_23, col='x_23'), size=plotlinewidth)+
 	geom_line( aes(y=x_24, col='x_24'), size=plotlinewidth)+
 	geom_line( aes(y=x_25, col='x_25'), size=plotlinewidth)+
 	geom_line( aes(y=x_26, col='x_26'), size=plotlinewidth)+
 	geom_line( aes(y=x_27, col='x_27'), size=plotlinewidth)+
 	geom_line( aes(y=x_28, col='x_28'), size=plotlinewidth)+
 	geom_line( aes(y=x_29, col='x_29'), size=plotlinewidth)+
 	geom_line( aes(y=x_30, col='x_30'), size=plotlinewidth)+
 	geom_line( aes(y=x_31, col='x_31'), size=plotlinewidth)+
 	geom_line( aes(y=x_32, col='x_32'), size=plotlinewidth)+
 	geom_line( aes(y=x_33, col='x_33'), size=plotlinewidth)+
 	geom_line( aes(y=x_34, col='x_34'), size=plotlinewidth)+
 	geom_line( aes(y=x_35, col='x_35'), size=plotlinewidth)+
 	geom_line( aes(y=x_36, col='x_36'), size=plotlinewidth)+
 	geom_line( aes(y=x_37, col='x_37'), size=plotlinewidth)+
 	geom_line( aes(y=x_38, col='x_38'), size=plotlinewidth)+
 	geom_line( aes(y=x_39, col='x_39'), size=plotlinewidth)+
 	geom_line( aes(y=x_40, col='x_40'), size=plotlinewidth)+
 	geom_line( aes(y=x_41, col='x_41'), size=plotlinewidth)+
 	geom_line( aes(y=x_42, col='x_42'), size=plotlinewidth)+
 	geom_line( aes(y=x_43, col='x_43'), size=plotlinewidth)+
 	geom_line( aes(y=x_44, col='x_44'), size=plotlinewidth)+
 	geom_line( aes(y=x_45, col='x_45'), size=plotlinewidth)+
 	geom_line( aes(y=x_46, col='x_46'), size=plotlinewidth)+
	geom_line( aes(y=x_47, col='x_47'), size=plotlinewidth)+
 	geom_line( aes(y=x_48, col='x_48'), size=plotlinewidth)+
 	geom_line( aes(y=x_49, col='x_49'), size=plotlinewidth)+
 	geom_line( aes(y=x_50, col='x_50'), size=plotlinewidth)+
 	geom_line( aes(y=x_51, col='x_51'), size=plotlinewidth)+
 	geom_line( aes(y=x_52, col='x_52'), size=plotlinewidth)+
 	geom_line( aes(y=x_53, col='x_53'), size=plotlinewidth)+
 	geom_line( aes(y=x_54, col='x_54'), size=plotlinewidth)+
 	geom_line( aes(y=x_55, col='x_55'), size=plotlinewidth)+
 	geom_line( aes(y=x_56, col='x_56'), size=plotlinewidth)+
 	geom_line( aes(y=x_57, col='x_57'), size=plotlinewidth)+
 	geom_line( aes(y=x_58, col='x_58'), size=plotlinewidth)+
 	geom_line( aes(y=x_59, col='x_59'), size=plotlinewidth)+
 	geom_line( aes(y=x_60, col='x_60'), size=plotlinewidth)+
 	geom_line( aes(y=x_61, col='x_61'), size=plotlinewidth)+
 	geom_line( aes(y=x_62, col='x_62'), size=plotlinewidth)+
 	geom_line( aes(y=x_63, col='x_63'), size=plotlinewidth)+
 	geom_line( aes(y=x_64, col='x_64'), size=plotlinewidth)+
 	geom_line( aes(y=x_65, col='x_65'), size=plotlinewidth)+
 	geom_line( aes(y=x_66, col='x_66'), size=plotlinewidth)+
 	geom_line( aes(y=x_67, col='x_67'), size=plotlinewidth)+



	coord_cartesian(xlim=NULL, ylim=NULL)+
	facet_grid(trial ~ participant )+
  	theme_bw(20) +
	ylab('Landmarks Location in 2D (x_N) [Pixels]') + 
	xlab('Sample')+
	labs(colour = 'Feature') + 
	theme(legend.position="none")

png(filename= paste(tag,"_x_all.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()








##y_0,...y_16, 
plot <-	ggplot(xdata, aes(x=frame) ) +	
 	geom_line( aes(y=y_0, col='y_00'), size=plotlinewidth)+
 	geom_line( aes(y=y_1, col='y_01'), size=plotlinewidth)+
 	geom_line( aes(y=y_2, col='y_02'), size=plotlinewidth)+
 	geom_line( aes(y=y_3, col='y_03'), size=plotlinewidth)+
 	geom_line( aes(y=y_4, col='y_04'), size=plotlinewidth)+
 	geom_line( aes(y=y_5, col='y_05'), size=plotlinewidth)+
 	geom_line( aes(y=y_6, col='y_06'), size=plotlinewidth)+
 	geom_line( aes(y=y_7, col='y_07'), size=plotlinewidth)+
 	geom_line( aes(y=y_8, col='y_08'), size=plotlinewidth)+
 	geom_line( aes(y=y_9, col='y_09'), size=plotlinewidth)+
 	geom_line( aes(y=y_10, col='y_10'), size=plotlinewidth)+
 	geom_line( aes(y=y_11, col='y_11'), size=plotlinewidth)+
 	geom_line( aes(y=y_12, col='y_12'), size=plotlinewidth)+
 	geom_line( aes(y=y_13, col='y_13'), size=plotlinewidth)+
 	geom_line( aes(y=y_14, col='y_14'), size=plotlinewidth)+
 	geom_line( aes(y=y_15, col='y_15'), size=plotlinewidth)+
 	geom_line( aes(y=y_16, col='y_16'), size=plotlinewidth)+
 	geom_line( aes(y=y_17, col='y_17'), size=plotlinewidth)+
 	geom_line( aes(y=y_18, col='y_18'), size=plotlinewidth)+
 	geom_line( aes(y=y_19, col='y_19'), size=plotlinewidth)+
 	geom_line( aes(y=y_20, col='y_20'), size=plotlinewidth)+
 	geom_line( aes(y=y_21, col='y_21'), size=plotlinewidth)+
 	geom_line( aes(y=y_22, col='y_22'), size=plotlinewidth)+
 	geom_line( aes(y=y_23, col='y_23'), size=plotlinewidth)+
 	geom_line( aes(y=y_24, col='y_24'), size=plotlinewidth)+
 	geom_line( aes(y=y_25, col='y_25'), size=plotlinewidth)+
 	geom_line( aes(y=y_26, col='y_26'), size=plotlinewidth)+
 	geom_line( aes(y=y_27, col='y_27'), size=plotlinewidth)+
 	geom_line( aes(y=y_28, col='y_28'), size=plotlinewidth)+
 	geom_line( aes(y=y_29, col='y_29'), size=plotlinewidth)+
 	geom_line( aes(y=y_30, col='y_30'), size=plotlinewidth)+
 	geom_line( aes(y=y_31, col='y_31'), size=plotlinewidth)+
 	geom_line( aes(y=y_32, col='y_32'), size=plotlinewidth)+
 	geom_line( aes(y=y_33, col='y_33'), size=plotlinewidth)+
 	geom_line( aes(y=y_34, col='y_34'), size=plotlinewidth)+
 	geom_line( aes(y=y_35, col='y_35'), size=plotlinewidth)+
 	geom_line( aes(y=y_36, col='y_36'), size=plotlinewidth)+
 	geom_line( aes(y=y_37, col='y_37'), size=plotlinewidth)+
 	geom_line( aes(y=y_38, col='y_38'), size=plotlinewidth)+
 	geom_line( aes(y=y_39, col='y_39'), size=plotlinewidth)+
 	geom_line( aes(y=y_40, col='y_40'), size=plotlinewidth)+
 	geom_line( aes(y=y_41, col='y_41'), size=plotlinewidth)+
 	geom_line( aes(y=y_42, col='y_42'), size=plotlinewidth)+
 	geom_line( aes(y=y_43, col='y_43'), size=plotlinewidth)+
 	geom_line( aes(y=y_44, col='y_44'), size=plotlinewidth)+
 	geom_line( aes(y=y_45, col='y_45'), size=plotlinewidth)+
 	geom_line( aes(y=y_46, col='y_46'), size=plotlinewidth)+
	geom_line( aes(y=y_47, col='y_47'), size=plotlinewidth)+
 	geom_line( aes(y=y_48, col='y_48'), size=plotlinewidth)+
 	geom_line( aes(y=y_49, col='y_49'), size=plotlinewidth)+
 	geom_line( aes(y=y_50, col='y_50'), size=plotlinewidth)+
 	geom_line( aes(y=y_51, col='y_51'), size=plotlinewidth)+
 	geom_line( aes(y=y_52, col='y_52'), size=plotlinewidth)+
 	geom_line( aes(y=y_53, col='y_53'), size=plotlinewidth)+
 	geom_line( aes(y=y_54, col='y_54'), size=plotlinewidth)+
 	geom_line( aes(y=y_55, col='y_55'), size=plotlinewidth)+
 	geom_line( aes(y=y_56, col='y_56'), size=plotlinewidth)+
 	geom_line( aes(y=y_57, col='y_57'), size=plotlinewidth)+
 	geom_line( aes(y=y_58, col='y_58'), size=plotlinewidth)+
 	geom_line( aes(y=y_59, col='y_59'), size=plotlinewidth)+
 	geom_line( aes(y=y_60, col='y_60'), size=plotlinewidth)+
 	geom_line( aes(y=y_61, col='y_61'), size=plotlinewidth)+
 	geom_line( aes(y=y_62, col='y_62'), size=plotlinewidth)+
 	geom_line( aes(y=y_63, col='y_63'), size=plotlinewidth)+
 	geom_line( aes(y=y_64, col='y_64'), size=plotlinewidth)+
 	geom_line( aes(y=y_65, col='y_65'), size=plotlinewidth)+
 	geom_line( aes(y=y_66, col='y_66'), size=plotlinewidth)+
 	geom_line( aes(y=y_67, col='y_67'), size=plotlinewidth)+


	coord_cartesian(xlim=NULL, ylim=NULL)+
	facet_grid(trial ~ participant )+
  	theme_bw(20) +
	ylab('Landmarks Location in 2D (y_N) [Pixels]') + 
	xlab('Sample')+
	labs(colour = 'Feature') + 
	theme(legend.position="none")

png(filename= paste(tag,"_y_all.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()








##X_0,...X_16, 
plot <-	ggplot(xdata, aes(x=frame) ) +	
 	geom_line( aes(y=X_0, col='X_00'), size=plotlinewidth)+
 	geom_line( aes(y=X_1, col='X_01'), size=plotlinewidth)+
 	geom_line( aes(y=X_2, col='X_02'), size=plotlinewidth)+
 	geom_line( aes(y=X_3, col='X_03'), size=plotlinewidth)+
 	geom_line( aes(y=X_4, col='X_04'), size=plotlinewidth)+
 	geom_line( aes(y=X_5, col='X_05'), size=plotlinewidth)+
 	geom_line( aes(y=X_6, col='X_06'), size=plotlinewidth)+
 	geom_line( aes(y=X_7, col='X_07'), size=plotlinewidth)+
 	geom_line( aes(y=X_8, col='X_08'), size=plotlinewidth)+
 	geom_line( aes(y=X_9, col='X_09'), size=plotlinewidth)+
 	geom_line( aes(y=X_10, col='X_10'), size=plotlinewidth)+
 	geom_line( aes(y=X_11, col='X_11'), size=plotlinewidth)+
 	geom_line( aes(y=X_12, col='X_12'), size=plotlinewidth)+
 	geom_line( aes(y=X_13, col='X_13'), size=plotlinewidth)+
 	geom_line( aes(y=X_14, col='X_14'), size=plotlinewidth)+
 	geom_line( aes(y=X_15, col='X_15'), size=plotlinewidth)+
 	geom_line( aes(y=X_16, col='X_16'), size=plotlinewidth)+
 	geom_line( aes(y=X_17, col='X_17'), size=plotlinewidth)+
 	geom_line( aes(y=X_18, col='X_18'), size=plotlinewidth)+
 	geom_line( aes(y=X_19, col='X_19'), size=plotlinewidth)+
 	geom_line( aes(y=X_20, col='X_20'), size=plotlinewidth)+
 	geom_line( aes(y=X_21, col='X_21'), size=plotlinewidth)+
 	geom_line( aes(y=X_22, col='X_22'), size=plotlinewidth)+
 	geom_line( aes(y=X_23, col='X_23'), size=plotlinewidth)+
 	geom_line( aes(y=X_24, col='X_24'), size=plotlinewidth)+
 	geom_line( aes(y=X_25, col='X_25'), size=plotlinewidth)+
 	geom_line( aes(y=X_26, col='X_26'), size=plotlinewidth)+
 	geom_line( aes(y=X_27, col='X_27'), size=plotlinewidth)+
 	geom_line( aes(y=X_28, col='X_28'), size=plotlinewidth)+
 	geom_line( aes(y=X_29, col='X_29'), size=plotlinewidth)+
 	geom_line( aes(y=X_30, col='X_30'), size=plotlinewidth)+
 	geom_line( aes(y=X_31, col='X_31'), size=plotlinewidth)+
 	geom_line( aes(y=X_32, col='X_32'), size=plotlinewidth)+
 	geom_line( aes(y=X_33, col='X_33'), size=plotlinewidth)+
 	geom_line( aes(y=X_34, col='X_34'), size=plotlinewidth)+
 	geom_line( aes(y=X_35, col='X_35'), size=plotlinewidth)+
 	geom_line( aes(y=X_36, col='X_36'), size=plotlinewidth)+
 	geom_line( aes(y=X_37, col='X_37'), size=plotlinewidth)+
 	geom_line( aes(y=X_38, col='X_38'), size=plotlinewidth)+
 	geom_line( aes(y=X_39, col='X_39'), size=plotlinewidth)+
 	geom_line( aes(y=X_40, col='X_40'), size=plotlinewidth)+
 	geom_line( aes(y=X_41, col='X_41'), size=plotlinewidth)+
 	geom_line( aes(y=X_42, col='X_42'), size=plotlinewidth)+
 	geom_line( aes(y=X_43, col='X_43'), size=plotlinewidth)+
 	geom_line( aes(y=X_44, col='X_44'), size=plotlinewidth)+
 	geom_line( aes(y=X_45, col='X_45'), size=plotlinewidth)+
 	geom_line( aes(y=X_46, col='X_46'), size=plotlinewidth)+
	geom_line( aes(y=X_47, col='X_47'), size=plotlinewidth)+
 	geom_line( aes(y=X_48, col='X_48'), size=plotlinewidth)+
 	geom_line( aes(y=X_49, col='X_49'), size=plotlinewidth)+
 	geom_line( aes(y=X_50, col='X_50'), size=plotlinewidth)+
 	geom_line( aes(y=X_51, col='X_51'), size=plotlinewidth)+
 	geom_line( aes(y=X_52, col='X_52'), size=plotlinewidth)+
 	geom_line( aes(y=X_53, col='X_53'), size=plotlinewidth)+
 	geom_line( aes(y=X_54, col='X_54'), size=plotlinewidth)+
 	geom_line( aes(y=X_55, col='X_55'), size=plotlinewidth)+
 	geom_line( aes(y=X_56, col='X_56'), size=plotlinewidth)+
 	geom_line( aes(y=X_57, col='X_57'), size=plotlinewidth)+
 	geom_line( aes(y=X_58, col='X_58'), size=plotlinewidth)+
 	geom_line( aes(y=X_59, col='X_59'), size=plotlinewidth)+
 	geom_line( aes(y=X_60, col='X_60'), size=plotlinewidth)+
 	geom_line( aes(y=X_61, col='X_61'), size=plotlinewidth)+
 	geom_line( aes(y=X_62, col='X_62'), size=plotlinewidth)+
 	geom_line( aes(y=X_63, col='X_63'), size=plotlinewidth)+
 	geom_line( aes(y=X_64, col='X_64'), size=plotlinewidth)+
 	geom_line( aes(y=X_65, col='X_65'), size=plotlinewidth)+
 	geom_line( aes(y=X_66, col='X_66'), size=plotlinewidth)+
 	geom_line( aes(y=X_67, col='X_67'), size=plotlinewidth)+



	coord_cartesian(xlim=NULL, ylim=NULL)+
	facet_grid(trial ~ participant )+
  	theme_bw(20) +
	ylab('Landmarks Location in 3D (X_N) [Milimetres]') + 
	xlab('Sample')+
	labs(colour = 'Feature')+
	theme(legend.position="none")

png(filename= paste(tag,"_X_all.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()


##Y_0,...Y_16, 
plot <-	ggplot(xdata, aes(x=frame) ) +	
 	geom_line( aes(y=Y_0, col='Y_00'), size=plotlinewidth)+
 	geom_line( aes(y=Y_1, col='Y_01'), size=plotlinewidth)+
 	geom_line( aes(y=Y_2, col='Y_02'), size=plotlinewidth)+
 	geom_line( aes(y=Y_3, col='Y_03'), size=plotlinewidth)+
 	geom_line( aes(y=Y_4, col='Y_04'), size=plotlinewidth)+
 	geom_line( aes(y=Y_5, col='Y_05'), size=plotlinewidth)+
 	geom_line( aes(y=Y_6, col='Y_06'), size=plotlinewidth)+
 	geom_line( aes(y=Y_7, col='Y_07'), size=plotlinewidth)+
 	geom_line( aes(y=Y_8, col='Y_08'), size=plotlinewidth)+
 	geom_line( aes(y=Y_9, col='Y_09'), size=plotlinewidth)+
 	geom_line( aes(y=Y_10, col='Y_10'), size=plotlinewidth)+
 	geom_line( aes(y=Y_11, col='Y_11'), size=plotlinewidth)+
 	geom_line( aes(y=Y_12, col='Y_12'), size=plotlinewidth)+
 	geom_line( aes(y=Y_13, col='Y_13'), size=plotlinewidth)+
 	geom_line( aes(y=Y_14, col='Y_14'), size=plotlinewidth)+
 	geom_line( aes(y=Y_15, col='Y_15'), size=plotlinewidth)+
 	geom_line( aes(y=Y_16, col='Y_16'), size=plotlinewidth)+
 	geom_line( aes(y=Y_17, col='Y_17'), size=plotlinewidth)+
 	geom_line( aes(y=Y_18, col='Y_18'), size=plotlinewidth)+
 	geom_line( aes(y=Y_19, col='Y_19'), size=plotlinewidth)+
 	geom_line( aes(y=Y_20, col='Y_20'), size=plotlinewidth)+
 	geom_line( aes(y=Y_21, col='Y_21'), size=plotlinewidth)+
 	geom_line( aes(y=Y_22, col='Y_22'), size=plotlinewidth)+
 	geom_line( aes(y=Y_23, col='Y_23'), size=plotlinewidth)+
 	geom_line( aes(y=Y_24, col='Y_24'), size=plotlinewidth)+
 	geom_line( aes(y=Y_25, col='Y_25'), size=plotlinewidth)+
 	geom_line( aes(y=Y_26, col='Y_26'), size=plotlinewidth)+
 	geom_line( aes(y=Y_27, col='Y_27'), size=plotlinewidth)+
 	geom_line( aes(y=Y_28, col='Y_28'), size=plotlinewidth)+
 	geom_line( aes(y=Y_29, col='Y_29'), size=plotlinewidth)+
 	geom_line( aes(y=Y_30, col='Y_30'), size=plotlinewidth)+
 	geom_line( aes(y=Y_31, col='Y_31'), size=plotlinewidth)+
 	geom_line( aes(y=Y_32, col='Y_32'), size=plotlinewidth)+
 	geom_line( aes(y=Y_33, col='Y_33'), size=plotlinewidth)+
 	geom_line( aes(y=Y_34, col='Y_34'), size=plotlinewidth)+
 	geom_line( aes(y=Y_35, col='Y_35'), size=plotlinewidth)+
 	geom_line( aes(y=Y_36, col='Y_36'), size=plotlinewidth)+
 	geom_line( aes(y=Y_37, col='Y_37'), size=plotlinewidth)+
 	geom_line( aes(y=Y_38, col='Y_38'), size=plotlinewidth)+
 	geom_line( aes(y=Y_39, col='Y_39'), size=plotlinewidth)+
 	geom_line( aes(y=Y_40, col='Y_40'), size=plotlinewidth)+
 	geom_line( aes(y=Y_41, col='Y_41'), size=plotlinewidth)+
 	geom_line( aes(y=Y_42, col='Y_42'), size=plotlinewidth)+
 	geom_line( aes(y=Y_43, col='Y_43'), size=plotlinewidth)+
 	geom_line( aes(y=Y_44, col='Y_44'), size=plotlinewidth)+
 	geom_line( aes(y=Y_45, col='Y_45'), size=plotlinewidth)+
 	geom_line( aes(y=Y_46, col='Y_46'), size=plotlinewidth)+
	geom_line( aes(y=Y_47, col='Y_47'), size=plotlinewidth)+
 	geom_line( aes(y=Y_48, col='Y_48'), size=plotlinewidth)+
 	geom_line( aes(y=Y_49, col='Y_49'), size=plotlinewidth)+
 	geom_line( aes(y=Y_50, col='Y_50'), size=plotlinewidth)+
 	geom_line( aes(y=Y_51, col='Y_51'), size=plotlinewidth)+
 	geom_line( aes(y=Y_52, col='Y_52'), size=plotlinewidth)+
 	geom_line( aes(y=Y_53, col='Y_53'), size=plotlinewidth)+
 	geom_line( aes(y=Y_54, col='Y_54'), size=plotlinewidth)+
 	geom_line( aes(y=Y_55, col='Y_55'), size=plotlinewidth)+
 	geom_line( aes(y=Y_56, col='Y_56'), size=plotlinewidth)+
 	geom_line( aes(y=Y_57, col='Y_57'), size=plotlinewidth)+
 	geom_line( aes(y=Y_58, col='Y_58'), size=plotlinewidth)+
 	geom_line( aes(y=Y_59, col='Y_59'), size=plotlinewidth)+
 	geom_line( aes(y=Y_60, col='Y_60'), size=plotlinewidth)+
 	geom_line( aes(y=Y_61, col='Y_61'), size=plotlinewidth)+
 	geom_line( aes(y=Y_62, col='Y_62'), size=plotlinewidth)+
 	geom_line( aes(y=Y_63, col='Y_63'), size=plotlinewidth)+
 	geom_line( aes(y=Y_64, col='Y_64'), size=plotlinewidth)+
 	geom_line( aes(y=Y_65, col='Y_65'), size=plotlinewidth)+
 	geom_line( aes(y=Y_66, col='Y_66'), size=plotlinewidth)+
 	geom_line( aes(y=Y_67, col='Y_67'), size=plotlinewidth)+



	coord_cartesian(xlim=NULL, ylim=NULL)+
	facet_grid(trial ~ participant )+
  	theme_bw(20) +
	ylab('Landmarks Location in 3D (Y_N) [Milimetres]') + 
	xlab('Sample')+
	labs(colour = 'Feature')+
	theme(legend.position="none")

png(filename= paste(tag,"_Y_all.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()



##Z_0,...Z_16, 
plot <-	ggplot(xdata, aes(x=frame) ) +	
 	geom_line( aes(y=Z_0, col='Z_00'), size=plotlinewidth)+
 	geom_line( aes(y=Z_1, col='Z_01'), size=plotlinewidth)+
 	geom_line( aes(y=Z_2, col='Z_02'), size=plotlinewidth)+
 	geom_line( aes(y=Z_3, col='Z_03'), size=plotlinewidth)+
 	geom_line( aes(y=Z_4, col='Z_04'), size=plotlinewidth)+
 	geom_line( aes(y=Z_5, col='Z_05'), size=plotlinewidth)+
 	geom_line( aes(y=Z_6, col='Z_06'), size=plotlinewidth)+
 	geom_line( aes(y=Z_7, col='Z_07'), size=plotlinewidth)+
 	geom_line( aes(y=Z_8, col='Z_08'), size=plotlinewidth)+
 	geom_line( aes(y=Z_9, col='Z_09'), size=plotlinewidth)+
 	geom_line( aes(y=Z_10, col='Z_10'), size=plotlinewidth)+
 	geom_line( aes(y=Z_11, col='Z_11'), size=plotlinewidth)+
 	geom_line( aes(y=Z_12, col='Z_12'), size=plotlinewidth)+
 	geom_line( aes(y=Z_13, col='Z_13'), size=plotlinewidth)+
 	geom_line( aes(y=Z_14, col='Z_14'), size=plotlinewidth)+
 	geom_line( aes(y=Z_15, col='Z_15'), size=plotlinewidth)+
 	geom_line( aes(y=Z_16, col='Z_16'), size=plotlinewidth)+
 	geom_line( aes(y=Z_17, col='Z_17'), size=plotlinewidth)+
 	geom_line( aes(y=Z_18, col='Z_18'), size=plotlinewidth)+
 	geom_line( aes(y=Z_19, col='Z_19'), size=plotlinewidth)+
 	geom_line( aes(y=Z_20, col='Z_20'), size=plotlinewidth)+
 	geom_line( aes(y=Z_21, col='Z_21'), size=plotlinewidth)+
 	geom_line( aes(y=Z_22, col='Z_22'), size=plotlinewidth)+
 	geom_line( aes(y=Z_23, col='Z_23'), size=plotlinewidth)+
 	geom_line( aes(y=Z_24, col='Z_24'), size=plotlinewidth)+
 	geom_line( aes(y=Z_25, col='Z_25'), size=plotlinewidth)+
 	geom_line( aes(y=Z_26, col='Z_26'), size=plotlinewidth)+
 	geom_line( aes(y=Z_27, col='Z_27'), size=plotlinewidth)+
 	geom_line( aes(y=Z_28, col='Z_28'), size=plotlinewidth)+
 	geom_line( aes(y=Z_29, col='Z_29'), size=plotlinewidth)+
 	geom_line( aes(y=Z_30, col='Z_30'), size=plotlinewidth)+
 	geom_line( aes(y=Z_31, col='Z_31'), size=plotlinewidth)+
 	geom_line( aes(y=Z_32, col='Z_32'), size=plotlinewidth)+
 	geom_line( aes(y=Z_33, col='Z_33'), size=plotlinewidth)+
 	geom_line( aes(y=Z_34, col='Z_34'), size=plotlinewidth)+
 	geom_line( aes(y=Z_35, col='Z_35'), size=plotlinewidth)+
 	geom_line( aes(y=Z_36, col='Z_36'), size=plotlinewidth)+
 	geom_line( aes(y=Z_37, col='Z_37'), size=plotlinewidth)+
 	geom_line( aes(y=Z_38, col='Z_38'), size=plotlinewidth)+
 	geom_line( aes(y=Z_39, col='Z_39'), size=plotlinewidth)+
 	geom_line( aes(y=Z_40, col='Z_40'), size=plotlinewidth)+
 	geom_line( aes(y=Z_41, col='Z_41'), size=plotlinewidth)+
 	geom_line( aes(y=Z_42, col='Z_42'), size=plotlinewidth)+
 	geom_line( aes(y=Z_43, col='Z_43'), size=plotlinewidth)+
 	geom_line( aes(y=Z_44, col='Z_44'), size=plotlinewidth)+
 	geom_line( aes(y=Z_45, col='Z_45'), size=plotlinewidth)+
 	geom_line( aes(y=Z_46, col='Z_46'), size=plotlinewidth)+
	geom_line( aes(y=Z_47, col='Z_47'), size=plotlinewidth)+
 	geom_line( aes(y=Z_48, col='Z_48'), size=plotlinewidth)+
 	geom_line( aes(y=Z_49, col='Z_49'), size=plotlinewidth)+
 	geom_line( aes(y=Z_50, col='Z_50'), size=plotlinewidth)+
 	geom_line( aes(y=Z_51, col='Z_51'), size=plotlinewidth)+
 	geom_line( aes(y=Z_52, col='Z_52'), size=plotlinewidth)+
 	geom_line( aes(y=Z_53, col='Z_53'), size=plotlinewidth)+
 	geom_line( aes(y=Z_54, col='Z_54'), size=plotlinewidth)+
 	geom_line( aes(y=Z_55, col='Z_55'), size=plotlinewidth)+
 	geom_line( aes(y=Z_56, col='Z_56'), size=plotlinewidth)+
 	geom_line( aes(y=Z_57, col='Z_57'), size=plotlinewidth)+
 	geom_line( aes(y=Z_58, col='Z_58'), size=plotlinewidth)+
 	geom_line( aes(y=Z_59, col='Z_59'), size=plotlinewidth)+
 	geom_line( aes(y=Z_60, col='Z_60'), size=plotlinewidth)+
 	geom_line( aes(y=Z_61, col='Z_61'), size=plotlinewidth)+
 	geom_line( aes(y=Z_62, col='Z_62'), size=plotlinewidth)+
 	geom_line( aes(y=Z_63, col='Z_63'), size=plotlinewidth)+
 	geom_line( aes(y=Z_64, col='Z_64'), size=plotlinewidth)+
 	geom_line( aes(y=Z_65, col='Z_65'), size=plotlinewidth)+
 	geom_line( aes(y=Z_66, col='Z_66'), size=plotlinewidth)+
 	geom_line( aes(y=Z_67, col='Z_67'), size=plotlinewidth)+



	coord_cartesian(xlim=NULL, ylim=NULL)+
	facet_grid(trial ~ participant )+
  	theme_bw(20) +
	ylab('Landmarks Location in 3D (Z_N)  [Milimetres]') + 
	xlab('Sample')+
	labs(colour = 'Feature')+
	theme(legend.position="none")

png(filename= paste(tag,"_Z_all.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()



# 
##p_0, p_1, p_2, p_3, p_4, p_5, p_6, p_7, p_8, p_9, p_10, p_11, p_12, p_13, p_14, p_15, p_16, 
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=p_0, col='p_00'), size=plotlinewidth)+
#  geom_line( aes(y=p_1, col='p_01'), size=plotlinewidth)+
#  geom_line( aes(y=p_2, col='p_02'), size=plotlinewidth)+
#  geom_line( aes(y=p_3, col='p_03'), size=plotlinewidth)+
#  geom_line( aes(y=p_4, col='p_04'), size=plotlinewidth)+
#  geom_line( aes(y=p_5, col='p_05'), size=plotlinewidth)+
#  geom_line( aes(y=p_6, col='p_06'), size=plotlinewidth)+
#  geom_line( aes(y=p_7, col='p_07'), size=plotlinewidth)+
#  geom_line( aes(y=p_8, col='p_08'), size=plotlinewidth)+
#  geom_line( aes(y=p_9, col='p_09'), size=plotlinewidth)+
#  geom_line( aes(y=p_10, col='p_10'), size=plotlinewidth)+
#  geom_line( aes(y=p_11, col='p_11'), size=plotlinewidth)+
#  geom_line( aes(y=p_12, col='p_12'), size=plotlinewidth)+
#  geom_line( aes(y=p_13, col='p_13'), size=plotlinewidth)+
#  geom_line( aes(y=p_14, col='p_14'), size=plotlinewidth)+
#  geom_line( aes(y=p_15, col='p_15'), size=plotlinewidth)+
#  geom_line( aes(y=p_16, col='p_16'), size=plotlinewidth)+
#
#	coord_cartesian(xlim=NULL, ylim=NULL)+
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('non-rigid shape parameters') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#png(filename= paste(tag,"_p0top16_nonrigidparameters.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#
##p_17, p_18, p_19, p_20, p_21, p_22, p_23, p_24, p_25, p_26, p_27, p_28, p_29, p_30, p_31, p_32, p_33, 
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=p_17, col='p_17'), size=plotlinewidth)+
#  geom_line( aes(y=p_18, col='p_18'), size=plotlinewidth)+
#  geom_line( aes(y=p_19, col='p_19'), size=plotlinewidth)+
#  geom_line( aes(y=p_20, col='p_20'), size=plotlinewidth)+
#  geom_line( aes(y=p_21, col='p_21'), size=plotlinewidth)+
#  geom_line( aes(y=p_22, col='p_22'), size=plotlinewidth)+
#  geom_line( aes(y=p_23, col='p_23'), size=plotlinewidth)+
#  geom_line( aes(y=p_24, col='p_24'), size=plotlinewidth)+
#  geom_line( aes(y=p_25, col='p_25'), size=plotlinewidth)+
#  geom_line( aes(y=p_26, col='p_26'), size=plotlinewidth)+
#  geom_line( aes(y=p_27, col='p_27'), size=plotlinewidth)+
#  geom_line( aes(y=p_28, col='p_28'), size=plotlinewidth)+
#  geom_line( aes(y=p_29, col='p_29'), size=plotlinewidth)+
#  geom_line( aes(y=p_30, col='p_30'), size=plotlinewidth)+
#  geom_line( aes(y=p_31, col='p_31'), size=plotlinewidth)+
#  geom_line( aes(y=p_32, col='p_32'), size=plotlinewidth)+
#  geom_line( aes(y=p_33, col='p_33'), size=plotlinewidth)+
# 
#	coord_cartesian(xlim=NULL, ylim=NULL)+
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('non-rigid shape parameters') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#png(filename= paste(tag,"_p17top33_nonrigidparameters.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#
#
##p_0, p_1, p_2, p_3, p_4, p_5, p_6, p_7, p_8, p_9, p_10, p_11, p_12, p_13, p_14, p_15, p_16, p_17, p_18, p_19, p_20, p_21, p_22, p_23, p_24, p_25, p_26, p_27, p_28, p_29, p_30, p_31, p_32, p_33, 
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=p_0, col='p_00'), size=plotlinewidth)+
#  geom_line( aes(y=p_1, col='p_01'), size=plotlinewidth)+
#  geom_line( aes(y=p_2, col='p_02'), size=plotlinewidth)+
#  geom_line( aes(y=p_3, col='p_03'), size=plotlinewidth)+
#  geom_line( aes(y=p_4, col='p_04'), size=plotlinewidth)+
#  geom_line( aes(y=p_5, col='p_05'), size=plotlinewidth)+
#  geom_line( aes(y=p_6, col='p_06'), size=plotlinewidth)+
#  geom_line( aes(y=p_7, col='p_07'), size=plotlinewidth)+
#  geom_line( aes(y=p_8, col='p_08'), size=plotlinewidth)+
#  geom_line( aes(y=p_9, col='p_09'), size=plotlinewidth)+
#  geom_line( aes(y=p_10, col='p_10'), size=plotlinewidth)+
#  geom_line( aes(y=p_11, col='p_11'), size=plotlinewidth)+
#  geom_line( aes(y=p_12, col='p_12'), size=plotlinewidth)+
#  geom_line( aes(y=p_13, col='p_13'), size=plotlinewidth)+
#  geom_line( aes(y=p_14, col='p_14'), size=plotlinewidth)+
#  geom_line( aes(y=p_15, col='p_15'), size=plotlinewidth)+
#  geom_line( aes(y=p_16, col='p_16'), size=plotlinewidth)+
#  geom_line( aes(y=p_17, col='p_17'), size=plotlinewidth)+
#  geom_line( aes(y=p_18, col='p_18'), size=plotlinewidth)+
#  geom_line( aes(y=p_19, col='p_19'), size=plotlinewidth)+
#  geom_line( aes(y=p_20, col='p_20'), size=plotlinewidth)+
#  geom_line( aes(y=p_21, col='p_21'), size=plotlinewidth)+
#  geom_line( aes(y=p_22, col='p_22'), size=plotlinewidth)+
#  geom_line( aes(y=p_23, col='p_23'), size=plotlinewidth)+
#  geom_line( aes(y=p_24, col='p_24'), size=plotlinewidth)+
#  geom_line( aes(y=p_25, col='p_25'), size=plotlinewidth)+
#  geom_line( aes(y=p_26, col='p_26'), size=plotlinewidth)+
#  geom_line( aes(y=p_27, col='p_27'), size=plotlinewidth)+
#  geom_line( aes(y=p_28, col='p_28'), size=plotlinewidth)+
#  geom_line( aes(y=p_29, col='p_29'), size=plotlinewidth)+
#  geom_line( aes(y=p_30, col='p_30'), size=plotlinewidth)+
#  geom_line( aes(y=p_31, col='p_31'), size=plotlinewidth)+
#  geom_line( aes(y=p_32, col='p_32'), size=plotlinewidth)+
#  geom_line( aes(y=p_33, col='p_33'), size=plotlinewidth)+
# 
#	coord_cartesian(xlim=NULL, ylim=NULL)+
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('non-rigid shape parameters') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#png(filename= paste(tag,"_p0top33_nonrigidparameters.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#
###p_tx, p_ty, 
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=p_tx, col='p_tx'), size=plotlinewidth)+
#  geom_line( aes(y=p_ty, col='p_ty'), size=plotlinewidth)+
# 
#	coord_cartesian(xlim=NULL, ylim=NULL)+
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('Translation terms of the Point Distrubution Model') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#png(filename= paste(tag,"_ptxy_pdm.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
###p_scale, p_rx, p_ry, p_rz 
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=p_scale, col='p_scale'), size=plotlinewidth)+
#  geom_line( aes(y=p_rx, col='p_rx'), size=plotlinewidth)+
#  geom_line( aes(y=p_ry, col='p_ry'), size=plotlinewidth)+
#  geom_line( aes(y=p_rz, col='p_rz'), size=plotlinewidth)+
# 
#	coord_cartesian(xlim=NULL, ylim=NULL)+
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('scale and rotation terms of the Point Distrubution Model') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#png(filename= paste(tag,"_pscalerxyz_pdm.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#
#
#

# The presense (0 absent, 1 present) of 18 AUs:
# `AU01_c, AU02_c, AU04_c, AU05_c, AU06_c, AU07_c, AU09_c, AU10_c, AU12_c, AU14_c, AU15_c, AU17_c, AU20_c, AU23_c, AU25_c, AU26_c, AU28_c, AU45_c`
plot <-	ggplot(xdata, aes(x=frame) ) +	
  geom_line( aes(y=as.numeric(AU01_c), col='AU01_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU02_c), col='AU02_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU04_c), col='AU04_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU05_c), col='AU05_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU06_c), col='AU06_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU07_c), col='AU07_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU09_c), col='AU09_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU10_c), col='AU10_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU12_c), col='AU12_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU14_c), col='AU14_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU15_c), col='AU15_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU17_c), col='AU17_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU20_c), col='AU20_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU23_c), col='AU23_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU25_c), col='AU25_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU26_c), col='AU26_c'), size=plotlinewidth)+ 
  geom_line( aes(y=as.numeric(AU28_c), col='AU28_c'), size=plotlinewidth)+
  geom_line( aes(y=as.numeric(AU45_c), col='AU45_c'), size=plotlinewidth)+
  

	coord_cartesian(xlim=NULL, ylim=c(-0.5,1.5))+ 
	facet_grid(trial ~ participant )+
  	theme_bw(20) +
	ylab('AU presence (0 absent, 1 present)') + 
	xlab('Sample')+
	labs(colour = 'Feature')


png(filename= paste(tag,"_AU_presence.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()





# The intensity (from 0 to 5) of 18 AUs:
# `AU01_r, AU02_r, AU04_r, AU05_r, AU06_r, AU07_r, AU09_r, AU10_r, AU12_r, AU14_r, AU15_r, AU17_r, AU20_r, AU23_r, AU25_r, AU26_r, AU45_r`
plot <-	ggplot(xdata, aes(x=frame) ) +	
  geom_line( aes(y=AU01_r, col='AU01_r'), size=plotlinewidth)+
  geom_line( aes(y=AU02_r, col='AU02_r'), size=plotlinewidth)+
  geom_line( aes(y=AU04_r, col='AU04_r'), size=plotlinewidth)+
  geom_line( aes(y=AU05_r, col='AU05_r'), size=plotlinewidth)+
  geom_line( aes(y=AU06_r, col='AU06_r'), size=plotlinewidth)+
  geom_line( aes(y=AU07_r, col='AU07_r'), size=plotlinewidth)+
  geom_line( aes(y=AU09_r, col='AU09_r'), size=plotlinewidth)+
  geom_line( aes(y=AU10_r, col='AU10_r'), size=plotlinewidth)+
  geom_line( aes(y=AU12_r, col='AU12_r'), size=plotlinewidth)+
  geom_line( aes(y=AU14_r, col='AU14_r'), size=plotlinewidth)+
  geom_line( aes(y=AU15_r, col='AU15_r'), size=plotlinewidth)+
  geom_line( aes(y=AU17_r, col='AU17_r'), size=plotlinewidth)+
  geom_line( aes(y=AU20_r, col='AU20_r'), size=plotlinewidth)+
  geom_line( aes(y=AU23_r, col='AU23_r'), size=plotlinewidth)+
  geom_line( aes(y=AU25_r, col='AU25_r'), size=plotlinewidth)+
  geom_line( aes(y=AU26_r, col='AU26_r'), size=plotlinewidth)+ 
  geom_line( aes(y=AU45_r, col='AU45_r'), size=plotlinewidth)+
  

	coord_cartesian(xlim=NULL, ylim=NULL )+ 
	facet_grid(trial ~ participant)+
  	theme_bw(20) +
	ylab('AU intensity (from 0 to 5)') + 
	xlab('Sample')+
	labs(colour = 'Feature')


png(filename= paste(tag,"_AU_intensity.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()


#
#
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU01_c), col='AU01_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU01_r, col='AU01_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU01_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU02_c), col='AU02_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU02_r, col='AU02_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU02_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU04_c), col='AU04_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU04_r, col='AU04_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU04_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU05_c), col='AU05_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU05_r, col='AU05_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU05_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU06_c), col='AU06_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU06_r, col='AU06_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU06_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU07_c), col='AU07_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU07_r, col='AU07_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU07_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU09_c), col='AU09_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU09_r, col='AU09_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU09_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU10_c), col='AU10_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU10_r, col='AU10_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU10_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU12_c), col='AU12_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU12_r, col='AU12_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU12_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU14_c), col='AU14_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU14_r, col='AU14_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU14_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU15_c), col='AU15_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU15_r, col='AU15_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU15_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU17_c), col='AU17_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU17_r, col='AU17_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU17_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU20_c), col='AU20_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU20_r, col='AU20_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU20_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU23_c), col='AU23_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU23_r, col='AU23_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU23_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU25_c), col='AU25_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU25_r, col='AU25_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU25_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU26_c), col='AU26_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU26_r, col='AU26_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU26_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#
#######################################
#plot <-	ggplot(xdata, aes(x=frame) ) +	
#  geom_line( aes(y=as.numeric(AU45_c), col='AU45_c'), size=plotlinewidth)+
#  geom_line( aes(y=AU45_r, col='AU45_r'), size=plotlinewidth)+
#  
#
#	coord_cartesian(xlim=NULL, ylim=NULL )+ 
#	facet_grid(participant ~ . )+
#  	theme_bw(20) +
#	ylab('AU_c presence (0 absent, 1 present); AU_r intensity (from 0 to 5)') + 
#	xlab('Sample')+
#	labs(colour = 'Feature')
#
#
#
#png(filename= paste(tag,"_AU45_cr.png",sep=''),
#   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
#print(plot)
#dev.off()
#




plotlinewidth_z <- 0.5
alpha_z <- 0.9


plotlinewidth_sg <- 1.5
alpha_sg <- 0.25


plot <- ggplot(xdata, aes(x=frame))+  
	geom_line( aes(y=zmuvpose_Tx, col='zmuvpose_Tx'),  size=plotlinewidth_z, alpha= alpha_z)+
	geom_line( aes(y=sgzmuvpose_Tx, col='sgzmuvpose_Tx'),  size=plotlinewidth_sg, alpha= alpha_sg)+
	geom_line( aes(y=zmuvpose_Ty, col='zmuvpose_Ty'),  size=plotlinewidth_z, alpha= alpha_z)+
	geom_line( aes(y=sgzmuvpose_Ty, col='sgzmuvpose_Ty'),  size=plotlinewidth_sg, alpha= alpha_sg)+
	geom_line( aes(y=zmuvpose_Tz, col='zmuvpose_Tz'),  size=plotlinewidth_z, alpha= alpha_z)+
	geom_line( aes(y=sgzmuvpose_Tz, col='sgzmuvpose_Tz'),  size=plotlinewidth_sg, alpha= alpha_sg)+


        theme_bw(15)+
	facet_grid(trial ~ participant )+
	coord_cartesian(xlim=NULL, ylim=NULL  )+
	ylab('ZeroMeanUnitVariance and Satikzky-Golay zmuv') + 
	xlab('Sample')+
	labs(colour = 'Features')


png(filename= paste(tag,"_sg-zmuv-poseTx.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()





plotlinewidth_z <- 0.5
alpha_z <- 0.9


plotlinewidth_sg <- 1.5
alpha_sg <- 0.25


plot <- ggplot(xdata, aes(x=frame))+  
geom_line( aes(y=zmuvx_0, col='zmuvx_0'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_1, col='zmuvx_1'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_2, col='zmuvx_2'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_3, col='zmuvx_3'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_4, col='zmuvx_4'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_5, col='zmuvx_5'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_6, col='zmuvx_6'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_7, col='zmuvx_7'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_8, col='zmuvx_8'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_9, col='zmuvx_9'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_10, col='zmuvx_10'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_11, col='zmuvx_11'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_12, col='zmuvx_12'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_13, col='zmuvx_13'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_14, col='zmuvx_14'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_15, col='zmuvx_15'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_16, col='zmuvx_16'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_17, col='zmuvx_17'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_18, col='zmuvx_18'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_19, col='zmuvx_19'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_20, col='zmuvx_20'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_21, col='zmuvx_21'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_22, col='zmuvx_22'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_23, col='zmuvx_23'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_24, col='zmuvx_24'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_25, col='zmuvx_25'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_26, col='zmuvx_26'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_27, col='zmuvx_27'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_28, col='zmuvx_28'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_29, col='zmuvx_29'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_30, col='zmuvx_30'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_31, col='zmuvx_31'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_32, col='zmuvx_32'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_33, col='zmuvx_33'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_34, col='zmuvx_34'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_35, col='zmuvx_35'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_36, col='zmuvx_36'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_37, col='zmuvx_37'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_38, col='zmuvx_38'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_39, col='zmuvx_39'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_40, col='zmuvx_40'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_41, col='zmuvx_41'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_42, col='zmuvx_42'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_43, col='zmuvx_43'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_44, col='zmuvx_44'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_45, col='zmuvx_45'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_46, col='zmuvx_46'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_47, col='zmuvx_47'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_48, col='zmuvx_48'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_49, col='zmuvx_49'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_50, col='zmuvx_50'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_51, col='zmuvx_51'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_52, col='zmuvx_52'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_53, col='zmuvx_53'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_54, col='zmuvx_54'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_55, col='zmuvx_55'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_56, col='zmuvx_56'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_57, col='zmuvx_57'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_58, col='zmuvx_58'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_59, col='zmuvx_59'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_60, col='zmuvx_60'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_61, col='zmuvx_61'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_62, col='zmuvx_62'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_63, col='zmuvx_63'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_64, col='zmuvx_64'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_65, col='zmuvx_65'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_66, col='zmuvx_66'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvx_67, col='zmuvx_67'),  size=plotlinewidth_z, alpha= alpha_z)+

geom_line( aes(y=sgzmuvx_0, col='sgzmuvx_0'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_1, col='sgzmuvx_1'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_2, col='sgzmuvx_2'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_3, col='sgzmuvx_3'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_4, col='sgzmuvx_4'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_5, col='sgzmuvx_5'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_6, col='sgzmuvx_6'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_7, col='sgzmuvx_7'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_8, col='sgzmuvx_8'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_9, col='sgzmuvx_9'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_10, col='sgzmuvx_10'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_11, col='sgzmuvx_11'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_12, col='sgzmuvx_12'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_13, col='sgzmuvx_13'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_14, col='sgzmuvx_14'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_15, col='sgzmuvx_15'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_16, col='sgzmuvx_16'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_17, col='sgzmuvx_17'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_18, col='sgzmuvx_18'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_19, col='sgzmuvx_19'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_20, col='sgzmuvx_20'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_21, col='sgzmuvx_21'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_22, col='sgzmuvx_22'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_23, col='sgzmuvx_23'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_24, col='sgzmuvx_24'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_25, col='sgzmuvx_25'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_26, col='sgzmuvx_26'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_27, col='sgzmuvx_27'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_28, col='sgzmuvx_28'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_29, col='sgzmuvx_29'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_30, col='sgzmuvx_30'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_31, col='sgzmuvx_31'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_32, col='sgzmuvx_32'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_33, col='sgzmuvx_33'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_34, col='sgzmuvx_34'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_35, col='sgzmuvx_35'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_36, col='sgzmuvx_36'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_37, col='sgzmuvx_37'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_38, col='sgzmuvx_38'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_39, col='sgzmuvx_39'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_40, col='sgzmuvx_40'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_41, col='sgzmuvx_41'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_42, col='sgzmuvx_42'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_43, col='sgzmuvx_43'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_44, col='sgzmuvx_44'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_45, col='sgzmuvx_45'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_46, col='sgzmuvx_46'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_47, col='sgzmuvx_47'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_48, col='sgzmuvx_48'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_49, col='sgzmuvx_49'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_50, col='sgzmuvx_50'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_51, col='sgzmuvx_51'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_52, col='sgzmuvx_52'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_53, col='sgzmuvx_53'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_54, col='sgzmuvx_54'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_55, col='sgzmuvx_55'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_56, col='sgzmuvx_56'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_57, col='sgzmuvx_57'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_58, col='sgzmuvx_58'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_59, col='sgzmuvx_59'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_60, col='sgzmuvx_60'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_61, col='sgzmuvx_61'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_62, col='sgzmuvx_62'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_63, col='sgzmuvx_63'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_64, col='sgzmuvx_64'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_65, col='sgzmuvx_65'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_66, col='sgzmuvx_66'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvx_67, col='sgzmuvx_67'),  size=plotlinewidth_sg, alpha= alpha_sg)+

theme_bw(15)+
theme(legend.position="none")+
facet_grid(trial ~ participant )+
coord_cartesian(xlim=NULL, ylim=NULL  )+
ylab('ZeroMeanUnitVariance and Satikzky-Golay zmuv') + 
xlab('Sample')+
labs(colour = 'Features')

png(filename= paste(tag,"_sg-zmuv-x.png",sep=''),
width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()




plotlinewidth_z <- 0.5
alpha_z <- 0.9

plotlinewidth_sg <- 1.5
alpha_sg <- 0.25


plot <- ggplot(xdata, aes(x=frame))+  
geom_line( aes(y=zmuvy_0, col='zmuvy_0'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_1, col='zmuvy_1'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_2, col='zmuvy_2'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_3, col='zmuvy_3'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_4, col='zmuvy_4'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_5, col='zmuvy_5'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_6, col='zmuvy_6'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_7, col='zmuvy_7'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_8, col='zmuvy_8'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_9, col='zmuvy_9'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_10, col='zmuvy_10'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_11, col='zmuvy_11'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_12, col='zmuvy_12'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_13, col='zmuvy_13'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_14, col='zmuvy_14'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_15, col='zmuvy_15'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_16, col='zmuvy_16'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_17, col='zmuvy_17'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_18, col='zmuvy_18'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_19, col='zmuvy_19'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_20, col='zmuvy_20'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_21, col='zmuvy_21'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_22, col='zmuvy_22'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_23, col='zmuvy_23'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_24, col='zmuvy_24'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_25, col='zmuvy_25'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_26, col='zmuvy_26'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_27, col='zmuvy_27'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_28, col='zmuvy_28'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_29, col='zmuvy_29'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_30, col='zmuvy_30'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_31, col='zmuvy_31'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_32, col='zmuvy_32'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_33, col='zmuvy_33'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_34, col='zmuvy_34'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_35, col='zmuvy_35'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_36, col='zmuvy_36'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_37, col='zmuvy_37'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_38, col='zmuvy_38'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_39, col='zmuvy_39'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_40, col='zmuvy_40'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_41, col='zmuvy_41'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_42, col='zmuvy_42'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_43, col='zmuvy_43'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_44, col='zmuvy_44'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_45, col='zmuvy_45'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_46, col='zmuvy_46'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_47, col='zmuvy_47'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_48, col='zmuvy_48'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_49, col='zmuvy_49'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_50, col='zmuvy_50'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_51, col='zmuvy_51'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_52, col='zmuvy_52'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_53, col='zmuvy_53'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_54, col='zmuvy_54'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_55, col='zmuvy_55'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_56, col='zmuvy_56'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_57, col='zmuvy_57'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_58, col='zmuvy_58'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_59, col='zmuvy_59'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_60, col='zmuvy_60'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_61, col='zmuvy_61'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_62, col='zmuvy_62'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_63, col='zmuvy_63'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_64, col='zmuvy_64'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_65, col='zmuvy_65'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_66, col='zmuvy_66'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuvy_67, col='zmuvy_67'),  size=plotlinewidth_z, alpha= alpha_z)+

geom_line( aes(y=sgzmuvy_0, col='sgzmuvy_0'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_1, col='sgzmuvy_1'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_2, col='sgzmuvy_2'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_3, col='sgzmuvy_3'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_4, col='sgzmuvy_4'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_5, col='sgzmuvy_5'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_6, col='sgzmuvy_6'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_7, col='sgzmuvy_7'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_8, col='sgzmuvy_8'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_9, col='sgzmuvy_9'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_10, col='sgzmuvy_10'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_11, col='sgzmuvy_11'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_12, col='sgzmuvy_12'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_13, col='sgzmuvy_13'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_14, col='sgzmuvy_14'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_15, col='sgzmuvy_15'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_16, col='sgzmuvy_16'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_17, col='sgzmuvy_17'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_18, col='sgzmuvy_18'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_19, col='sgzmuvy_19'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_20, col='sgzmuvy_20'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_21, col='sgzmuvy_21'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_22, col='sgzmuvy_22'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_23, col='sgzmuvy_23'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_24, col='sgzmuvy_24'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_25, col='sgzmuvy_25'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_26, col='sgzmuvy_26'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_27, col='sgzmuvy_27'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_28, col='sgzmuvy_28'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_29, col='sgzmuvy_29'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_30, col='sgzmuvy_30'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_31, col='sgzmuvy_31'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_32, col='sgzmuvy_32'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_33, col='sgzmuvy_33'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_34, col='sgzmuvy_34'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_35, col='sgzmuvy_35'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_36, col='sgzmuvy_36'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_37, col='sgzmuvy_37'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_38, col='sgzmuvy_38'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_39, col='sgzmuvy_39'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_40, col='sgzmuvy_40'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_41, col='sgzmuvy_41'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_42, col='sgzmuvy_42'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_43, col='sgzmuvy_43'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_44, col='sgzmuvy_44'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_45, col='sgzmuvy_45'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_46, col='sgzmuvy_46'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_47, col='sgzmuvy_47'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_48, col='sgzmuvy_48'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_49, col='sgzmuvy_49'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_50, col='sgzmuvy_50'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_51, col='sgzmuvy_51'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_52, col='sgzmuvy_52'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_53, col='sgzmuvy_53'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_54, col='sgzmuvy_54'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_55, col='sgzmuvy_55'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_56, col='sgzmuvy_56'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_57, col='sgzmuvy_57'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_58, col='sgzmuvy_58'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_59, col='sgzmuvy_59'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_60, col='sgzmuvy_60'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_61, col='sgzmuvy_61'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_62, col='sgzmuvy_62'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_63, col='sgzmuvy_63'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_64, col='sgzmuvy_64'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_65, col='sgzmuvy_65'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_66, col='sgzmuvy_66'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuvy_67, col='sgzmuvy_67'),  size=plotlinewidth_sg, alpha= alpha_sg)+

theme_bw(15)+
theme(legend.position="none")+
facet_grid(trial ~ participant )+
coord_cartesian(xlim=NULL, ylim=NULL  )+
ylab('ZeroMeanUnitVariance and Satikzky-Golay zmuv') + 
xlab('Sample')+
labs(colour = 'Features')


png(filename= paste(tag,"_sg-zmuv-y.png",sep=''),
width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()






#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path


