###############################################################################	
#
# plot_3DRQAEntr for openface landmarks 
# 
# Reference: 
# https://github.com/mxochicale/phd-thesis-code-data/blob/master/code/rscripts/rqa/hii/v00/Gb_rqa_topology_plots.R
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
setwd("../../../../")
repository_path <- getwd()
setwd("../")
root_path <- getwd()


################################################################################
# (1) Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
library(plot3D)

data_path <- '/data/dataset'
graphics_path <- '/tsrp/src/3DRQA'

#### Outcomes Graphics Path
outcomes_graphics_path <- paste(repository_path,'/docs/figs', graphics_path, sep="")

### DataSet Path
main_data_path <- paste(repository_path, data_path, sep="")


#################################################################################
## (2) Setting DataSets paths and reading data
setwd(main_data_path)

################################################################################
# (3) Reading data
signal_source<-'brownianmotion'
file_ext <- paste('RQA3D_', signal_source, '.dt',sep='')
RQA <- fread( file_ext, header=TRUE)











################################################################################
################################################################################
################################################################################
################################################################################
## RQA Metric Selection
rqas <- c('ENTR')
#rqas <- c('REC','DET', 'RATIO', 'ENTR')


for (rqas_k in 1:length(rqas) ) {

rqask <- rqas[rqas_k]
message('############')
message('RQA: ',rqask)

Rk <- RQA[,.(
	get(rqask)
	), by=. (source, dim, tau, eps)]



#
#
#
################################################################################
# (5.0) Creating  and Changing to PlotPath
plots_path <- paste( outcomes_graphics_path, sep='')
if (file.exists(plots_path)){
    setwd(file.path(plots_path))
} else {
  dir.create(plots_path, recursive=TRUE)
  setwd(file.path(plots_path))
}



### Save Picture
image_width = 2000
image_height = 2000
#image_bg = "transparent"
image_bg = "white"
text.factor = 1
image_dpi <- text.factor * 100
width.calc <- image_width / image_dpi
height.calc <- image_height / image_dpi
	

zlim_max<-10
EPS<-c (0.1,0.2,0.5,0.7,1.0,1.2,1.5,1.7,2,3,4,5)


message('Plotting different 3DRQA with different eps')
for (eps_k in 1:length(EPS) ) {

	recurrence_threshold<-EPS[eps_k]
	message(recurrence_threshold)


	A<-Rk[, range:= (eps== recurrence_threshold ), by=. (source, dim, tau, eps)]
	A<-A[range == TRUE] # filter only true values for the condition "eps== recurrence_threshold"
	A<-A[,range:=NULL] # delete range column

	tau_i <- length(1:10)
	dim_j <- length(1:10)
	m<-as.matrix(A[,5])
	mm<-matrix(m,tau_i,dim_j, byrow=TRUE)


filenameimage <- paste(signal_source, '_', rqask, '_', 'eps_', recurrence_threshold, '.png', sep='')
png(filenameimage,width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)

persp3D(
	x = 1:nrow(mm),
	y = 1:ncol(mm),
	z = mm,
	xlab = "dim", 
	ylab = "tau", 
	zlab = "", 
	zlim = c(0,zlim_max),
#	
#	#phi = 0, 
	phi = 30, 
#
#	#theta = 0,
#	#theta = 20,
	theta = 30,
#	#theta = 60,
#	theta = 90,
#	#theta = 120,
#	#theta = 140,
#	theta = 160,
#	#theta = 190,
#
#
	ticktype = "detailed",
	nticks = 9,
	colkey = list(length = 0.5, width = 0.8, shift = 0.0,cex.axis =4, cex.clab = 1), 
	lighting = FALSE,  #If notFALSEthe facets will be illuminated, and colors may appear more bright
#	#lphi = 90,
	clab = rqask,# label for col key
	bty = "b2", 
#	#space = 5, 
#	#d = 10, 
	cex.lab = 5,# change font size of the labels 
	cex.axis = 3,# change axis tick size to a very low size
#	#contour = list(col = "grey", side = c("z"))
	add=FALSE,
	plot=TRUE
)


dev.off()






	}
	#for (eps_k in 1:length(EPS) ) {
################################################################################







	}##end## for (rqas_k in 1:length(rqas) ) {
################################################################################
################################################################################
################################################################################
################################################################################







#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time

################################################################################
setwd(r_scripts_path) ## go back to the r-script source path


