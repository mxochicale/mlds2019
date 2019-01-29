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
setwd("../../")
repository_path <- getwd()
setwd("../")
github_path <- getwd()


################################################################################
# (1) Loading Functions and Libraries and Setting up digits
library(data.table) # for manipulating data
library(plot3D)


feature_path <- '/dataset'
graphics_path <- '/rqaentr/first_proposal'

#### Outcomes Data Path
outcomes_graphics_path <- paste(repository_path,'/docs/figs', graphics_path, sep="")

### DataSet Path
data_path <- paste(repository_path,'/data', feature_path, sep="")


################################################################################
# (2) Setting DataSets paths and reading data
setwd(data_path)

################################################################################
# (3) Reading data
file_ext <- "RQA3D.dt"
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
	), by=. (Participant, Trial, Axis, dim, tau, eps)]






################################################################################
################################################################################
################################################################################
################################################################################
	## (4.2.1) Trial Selection

			
	#trials <- c('Trial1')
	trials <- c('Trial1','Trial2', 'Trial3')
	
	#########################################################
	for (trial_k in 1:length(trials) ) {

	trialk <- trials[trial_k]
	message('   Trial: ', trialk)
	#awdata <- wdata

	TRk <-  Rk[ Trial %in% trialk ]
	


#################################################################################
#################################################################################
#################################################################################
#################################################################################
				### (4.2.4) Axis Selection

				axis <- c('sgzmuvx_0')
				#axis <- c('sgzmuvx_0', 'sgzmuvx_1',  'sgzmuvx_2',  'sgzmuvx_3',  'sgzmuvx_4')


				####### Axis
				for (axis_k in c(1:length(axis)  )){ #for (axis_k in c(1:length(axis))){
				axisk<- axis[axis_k]
				message('            Axis: ',axisk)

				ATRk <-  TRk[ Axis %in% axisk ]

























				Leps <- length( seq(0.1,5.0,0.1) ) ## << taken from LINE ~210 in 'C_RQAEntr.R'
				epsilons <- ATRk$eps[1:Leps]

				epsi_j <- length(epsilons)
				dims_i <- dim(ATRk)[1]/epsi_j
				m<-as.matrix(ATRk[,7])

				mm<-matrix(m,dims_i,epsi_j, byrow=TRUE)




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
	

filenameimage <- paste(rqask, '_', trialk, '_', axisk, '.png', sep='')
png(filenameimage,width=image_width, height=image_height, units="px", res=image_dpi, bg=image_bg)




persp3D(
	x = 1:nrow(mm),
	y = 1:ncol(mm),
	z = mm,
	xlab = "(dims,taus)", 
	ylab = "eps_thr", 
	zlab = "", 
	
	#phi = 0, 
	phi = 30, 

	#theta = 0,
	#theta = 20,
	theta = 30,
	#theta = 60,
	#theta = 90,
	#theta = 120,
	#theta = 140,
	#theta = 160,
	#theta = 190,


	ticktype = "detailed",
	nticks = 9,
	colkey = list(length = 0.5, width = 0.8, shift = 0.0,cex.axis = 1.5, cex.clab = 2), 
	lighting = FALSE,  #If notFALSEthe facets will be illuminated, and colors may appear more bright
	#lphi = 90,
	clab = rqask,
	bty = "b2", 
	plot = TRUE,
	#space = 5, 
	#d = 10, 
	cex.lab = 3,# change font size of the labels 
	cex.axis = 1e-9# change axis tick size to a very low size
	#contour = list(col = "grey", side = c("z"))
)




dev.off()



				}##end##for (axis_k in c(1:length(axis)  )){ 
#################################################################################
#################################################################################
#################################################################################
#################################################################################







	}
	#for (trial_k in 1:length(trials) ) {
################################################################################
################################################################################
################################################################################
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


