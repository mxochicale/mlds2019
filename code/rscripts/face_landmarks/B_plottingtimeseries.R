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
setwd("../../../")
repository_path <- getwd()


feature_path <- '/dataset'
graphics_path <- '/timeseries/preprocessed'

### Outcomes Data Path
outcomes_graphics_path <- paste(repository_path,'/docs/figs', graphics_path, sep="")

### DataSet Path
data_path <- paste(repository_path,'/data', feature_path, sep="")



################################################################################
# (1) Setting DataSets paths and reading data
setwd(data_path)


################################################################################
# (2) Reading data
file_ext <- "face_landmarks.dt"
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
tag <- 'facelanmarks-timeseries'
image_width <- 3000
image_height <- 3000
image_dpi <- 300
image_bg <- "transparent"

plotlinewidth <- 1



#####################
## (3.3) Plots Data from OpenFace


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


##a_0,...a_67, 
plot <-	ggplot(xdata, aes(x=timestamp) ) +	
 	geom_line( aes(y=a_0, col='a_00'), size=plotlinewidth)+
 	geom_line( aes(y=a_1, col='a_01'), size=plotlinewidth)+
 	geom_line( aes(y=a_2, col='a_02'), size=plotlinewidth)+
 	geom_line( aes(y=a_3, col='a_03'), size=plotlinewidth)+
 	geom_line( aes(y=a_4, col='a_04'), size=plotlinewidth)+
 	geom_line( aes(y=a_5, col='a_05'), size=plotlinewidth)+
 	geom_line( aes(y=a_6, col='a_06'), size=plotlinewidth)+
 	geom_line( aes(y=a_7, col='a_07'), size=plotlinewidth)+
 	geom_line( aes(y=a_8, col='a_08'), size=plotlinewidth)+
 	geom_line( aes(y=a_9, col='a_09'), size=plotlinewidth)+
 	geom_line( aes(y=a_10, col='a_10'), size=plotlinewidth)+
 	geom_line( aes(y=a_11, col='a_11'), size=plotlinewidth)+
 	geom_line( aes(y=a_12, col='a_12'), size=plotlinewidth)+
 	geom_line( aes(y=a_13, col='a_13'), size=plotlinewidth)+
 	geom_line( aes(y=a_14, col='a_14'), size=plotlinewidth)+
 	geom_line( aes(y=a_15, col='a_15'), size=plotlinewidth)+
 	geom_line( aes(y=a_16, col='a_16'), size=plotlinewidth)+
 	geom_line( aes(y=a_17, col='a_17'), size=plotlinewidth)+
 	geom_line( aes(y=a_18, col='a_18'), size=plotlinewidth)+
 	geom_line( aes(y=a_19, col='a_19'), size=plotlinewidth)+
 	geom_line( aes(y=a_20, col='a_20'), size=plotlinewidth)+
 	geom_line( aes(y=a_21, col='a_21'), size=plotlinewidth)+
 	geom_line( aes(y=a_22, col='a_22'), size=plotlinewidth)+
 	geom_line( aes(y=a_23, col='a_23'), size=plotlinewidth)+
 	geom_line( aes(y=a_24, col='a_24'), size=plotlinewidth)+
 	geom_line( aes(y=a_25, col='a_25'), size=plotlinewidth)+
 	geom_line( aes(y=a_26, col='a_26'), size=plotlinewidth)+
 	geom_line( aes(y=a_27, col='a_27'), size=plotlinewidth)+
 	geom_line( aes(y=a_28, col='a_28'), size=plotlinewidth)+
 	geom_line( aes(y=a_29, col='a_29'), size=plotlinewidth)+
 	geom_line( aes(y=a_30, col='a_30'), size=plotlinewidth)+
 	geom_line( aes(y=a_31, col='a_31'), size=plotlinewidth)+
 	geom_line( aes(y=a_32, col='a_32'), size=plotlinewidth)+
 	geom_line( aes(y=a_33, col='a_33'), size=plotlinewidth)+
 	geom_line( aes(y=a_34, col='a_34'), size=plotlinewidth)+
 	geom_line( aes(y=a_35, col='a_35'), size=plotlinewidth)+
 	geom_line( aes(y=a_36, col='a_36'), size=plotlinewidth)+
 	geom_line( aes(y=a_37, col='a_37'), size=plotlinewidth)+
 	geom_line( aes(y=a_38, col='a_38'), size=plotlinewidth)+
 	geom_line( aes(y=a_39, col='a_39'), size=plotlinewidth)+
 	geom_line( aes(y=a_40, col='a_40'), size=plotlinewidth)+
 	geom_line( aes(y=a_41, col='a_41'), size=plotlinewidth)+
 	geom_line( aes(y=a_42, col='a_42'), size=plotlinewidth)+
 	geom_line( aes(y=a_43, col='a_43'), size=plotlinewidth)+
 	geom_line( aes(y=a_44, col='a_44'), size=plotlinewidth)+
 	geom_line( aes(y=a_45, col='a_45'), size=plotlinewidth)+
 	geom_line( aes(y=a_46, col='a_46'), size=plotlinewidth)+
	geom_line( aes(y=a_47, col='a_47'), size=plotlinewidth)+
 	geom_line( aes(y=a_48, col='a_48'), size=plotlinewidth)+
 	geom_line( aes(y=a_49, col='a_49'), size=plotlinewidth)+
 	geom_line( aes(y=a_50, col='a_50'), size=plotlinewidth)+
 	geom_line( aes(y=a_51, col='a_51'), size=plotlinewidth)+
 	geom_line( aes(y=a_52, col='a_52'), size=plotlinewidth)+
 	geom_line( aes(y=a_53, col='a_53'), size=plotlinewidth)+
 	geom_line( aes(y=a_54, col='a_54'), size=plotlinewidth)+
 	geom_line( aes(y=a_55, col='a_55'), size=plotlinewidth)+
 	geom_line( aes(y=a_56, col='a_56'), size=plotlinewidth)+
 	geom_line( aes(y=a_57, col='a_57'), size=plotlinewidth)+
 	geom_line( aes(y=a_58, col='a_58'), size=plotlinewidth)+
 	geom_line( aes(y=a_59, col='a_59'), size=plotlinewidth)+
 	geom_line( aes(y=a_60, col='a_60'), size=plotlinewidth)+
 	geom_line( aes(y=a_61, col='a_61'), size=plotlinewidth)+
 	geom_line( aes(y=a_62, col='a_62'), size=plotlinewidth)+
 	geom_line( aes(y=a_63, col='a_63'), size=plotlinewidth)+
 	geom_line( aes(y=a_64, col='a_64'), size=plotlinewidth)+
 	geom_line( aes(y=a_65, col='a_65'), size=plotlinewidth)+
 	geom_line( aes(y=a_66, col='a_66'), size=plotlinewidth)+
 	geom_line( aes(y=a_67, col='a_67'), size=plotlinewidth)+



	coord_cartesian(xlim=NULL, ylim=NULL)+
	facet_grid(trial ~ participant )+
  	theme_bw(20) +
	ylab('Landmarks Location in 2D (a_N) [Pixels]') + 
	xlab('Sample')+
	labs(colour = 'Feature') + 
	theme(legend.position="none")

png(filename= paste(tag,"_a_all.png",sep=''),
   width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()










plotlinewidth_z <- 0.5
alpha_z <- 0.9

plotlinewidth_sg <- 1.5
alpha_sg <- 0.25


plot <- ggplot(xdata, aes(x=timestamp))+  
geom_line( aes(y=zmuva_0, col='zmuva_0'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_1, col='zmuva_1'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_2, col='zmuva_2'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_3, col='zmuva_3'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_4, col='zmuva_4'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_5, col='zmuva_5'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_6, col='zmuva_6'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_7, col='zmuva_7'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_8, col='zmuva_8'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_9, col='zmuva_9'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_10, col='zmuva_10'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_11, col='zmuva_11'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_12, col='zmuva_12'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_13, col='zmuva_13'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_14, col='zmuva_14'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_15, col='zmuva_15'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_16, col='zmuva_16'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_17, col='zmuva_17'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_18, col='zmuva_18'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_19, col='zmuva_19'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_20, col='zmuva_20'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_21, col='zmuva_21'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_22, col='zmuva_22'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_23, col='zmuva_23'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_24, col='zmuva_24'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_25, col='zmuva_25'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_26, col='zmuva_26'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_27, col='zmuva_27'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_28, col='zmuva_28'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_29, col='zmuva_29'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_30, col='zmuva_30'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_31, col='zmuva_31'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_32, col='zmuva_32'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_33, col='zmuva_33'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_34, col='zmuva_34'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_35, col='zmuva_35'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_36, col='zmuva_36'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_37, col='zmuva_37'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_38, col='zmuva_38'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_39, col='zmuva_39'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_40, col='zmuva_40'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_41, col='zmuva_41'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_42, col='zmuva_42'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_43, col='zmuva_43'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_44, col='zmuva_44'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_45, col='zmuva_45'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_46, col='zmuva_46'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_47, col='zmuva_47'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_48, col='zmuva_48'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_49, col='zmuva_49'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_50, col='zmuva_50'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_51, col='zmuva_51'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_52, col='zmuva_52'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_53, col='zmuva_53'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_54, col='zmuva_54'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_55, col='zmuva_55'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_56, col='zmuva_56'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_57, col='zmuva_57'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_58, col='zmuva_58'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_59, col='zmuva_59'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_60, col='zmuva_60'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_61, col='zmuva_61'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_62, col='zmuva_62'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_63, col='zmuva_63'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_64, col='zmuva_64'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_65, col='zmuva_65'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_66, col='zmuva_66'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_67, col='zmuva_67'),  size=plotlinewidth_z, alpha= alpha_z)+

geom_line( aes(y=sgzmuva_0, col='sgzmuva_0'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_1, col='sgzmuva_1'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_2, col='sgzmuva_2'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_3, col='sgzmuva_3'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_4, col='sgzmuva_4'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_5, col='sgzmuva_5'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_6, col='sgzmuva_6'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_7, col='sgzmuva_7'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_8, col='sgzmuva_8'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_9, col='sgzmuva_9'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_10, col='sgzmuva_10'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_11, col='sgzmuva_11'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_12, col='sgzmuva_12'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_13, col='sgzmuva_13'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_14, col='sgzmuva_14'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_15, col='sgzmuva_15'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_16, col='sgzmuva_16'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_17, col='sgzmuva_17'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_18, col='sgzmuva_18'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_19, col='sgzmuva_19'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_20, col='sgzmuva_20'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_21, col='sgzmuva_21'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_22, col='sgzmuva_22'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_23, col='sgzmuva_23'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_24, col='sgzmuva_24'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_25, col='sgzmuva_25'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_26, col='sgzmuva_26'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_27, col='sgzmuva_27'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_28, col='sgzmuva_28'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_29, col='sgzmuva_29'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_30, col='sgzmuva_30'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_31, col='sgzmuva_31'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_32, col='sgzmuva_32'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_33, col='sgzmuva_33'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_34, col='sgzmuva_34'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_35, col='sgzmuva_35'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_36, col='sgzmuva_36'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_37, col='sgzmuva_37'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_38, col='sgzmuva_38'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_39, col='sgzmuva_39'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_40, col='sgzmuva_40'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_41, col='sgzmuva_41'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_42, col='sgzmuva_42'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_43, col='sgzmuva_43'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_44, col='sgzmuva_44'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_45, col='sgzmuva_45'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_46, col='sgzmuva_46'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_47, col='sgzmuva_47'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_48, col='sgzmuva_48'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_49, col='sgzmuva_49'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_50, col='sgzmuva_50'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_51, col='sgzmuva_51'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_52, col='sgzmuva_52'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_53, col='sgzmuva_53'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_54, col='sgzmuva_54'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_55, col='sgzmuva_55'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_56, col='sgzmuva_56'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_57, col='sgzmuva_57'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_58, col='sgzmuva_58'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_59, col='sgzmuva_59'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_60, col='sgzmuva_60'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_61, col='sgzmuva_61'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_62, col='sgzmuva_62'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_63, col='sgzmuva_63'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_64, col='sgzmuva_64'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_65, col='sgzmuva_65'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_66, col='sgzmuva_66'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_67, col='sgzmuva_67'),  size=plotlinewidth_sg, alpha= alpha_sg)+

theme_bw(15)+
theme(legend.position="none")+
facet_grid(trial ~ participant )+
coord_cartesian(xlim=NULL, ylim=NULL  )+
ylab('ZeroMeanUnitVariance and Satikzky-Golay zmuv') + 
xlab('Sample')+
labs(colour = 'Features')


png(filename= paste(tag,"_sg-zmuv-a.png",sep=''),
width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()




plotlinewidth_z <- 2.5
alpha_z <- 0.9

plotlinewidth_sg <- 1.5
alpha_sg <- 0.25


plot <- ggplot(xdata, aes(x=timestamp))+  
geom_line( aes(y=left_eye, col='left_eye'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=right_eye, col='right_eye'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=out_mouth, col='out_mouth'),  size=plotlinewidth_z, alpha= alpha_z)+

theme_bw(20)+
facet_grid(trial ~ participant )+
coord_cartesian(xlim=NULL, ylim=NULL  )+
ylab('ZeroMeanUnitVariance with Satikzky-Golay') + 
xlab('Time')+
labs(colour = '')
#theme(legend.position="none")+

png(filename= paste(tag,"_raw-eyes-mouth.png",sep=''),
width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()












plotlinewidth_z <- 1.0
alpha_z <- 0.5

plotlinewidth_sg <- 2.0
alpha_sg <- 0.8


plot <- ggplot(xdata, aes(x=timestamp))+  
geom_line( aes(y=sgzmuva_left_eye, col='sgzmuva_left_eye'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_right_eye, col='sgzmuva_right_eye'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_out_mouth, col='sgzmuva_out_mouth'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=zmuva_left_eye, col='zmuva_left_eye'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_right_eye, col='zmuva_right_eye'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_out_mouth, col='zmuva_out_mouth'),  size=plotlinewidth_z, alpha= alpha_z)+



theme_bw(20)+
facet_grid(trial ~ participant )+
coord_cartesian(xlim=NULL, ylim=NULL  )+
ylab('ZeroMeanUnitVariance with Satikzky-Golay') + 
xlab('Time')+
labs(colour = '')
#theme(legend.position="none")+

png(filename= paste(tag,"_sg-zmuv-eyes-mouth-legends.png",sep=''),
width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()



plotlinewidth_z <- 1.0
alpha_z <- 0.5

plotlinewidth_sg <- 2.0
alpha_sg <- 0.8


plot <- ggplot(xdata, aes(x=timestamp))+  
geom_line( aes(y=sgzmuva_left_eye, col='sgzmuva_left_eye'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_right_eye, col='sgzmuva_right_eye'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=sgzmuva_out_mouth, col='sgzmuva_out_mouth'),  size=plotlinewidth_sg, alpha= alpha_sg)+
geom_line( aes(y=zmuva_left_eye, col='zmuva_left_eye'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_right_eye, col='zmuva_right_eye'),  size=plotlinewidth_z, alpha= alpha_z)+
geom_line( aes(y=zmuva_out_mouth, col='zmuva_out_mouth'),  size=plotlinewidth_z, alpha= alpha_z)+



theme_bw(20)+
facet_grid(trial ~ participant )+
coord_cartesian(xlim=NULL, ylim=NULL  )+
ylab('ZeroMeanUnitVariance with Satikzky-Golay') + 
xlab('Time')+
labs(colour = '')+
theme(legend.position="none")

png(filename= paste(tag,"_sg-zmuv-eyes-mouth-no-legends.png",sep=''),
width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)
print(plot)
dev.off()








#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path


