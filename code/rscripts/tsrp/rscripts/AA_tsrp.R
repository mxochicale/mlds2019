###############################################################################	
#
# Recurrence plot for  Homogeneous (uniformly distributed noise)
#
#
#
#
# * If you have a question or comment that might be relevant 
#	to other people, please open an issue.
# * If you have any specific questions about the information 
#	of this repository, you can me by vising: https://mxochicale.github.io/
#
#
#
###############################################################################	
	# OUTLINE:
	# (0) Loading libraries and functions
 	# (1) Definifing paths
	# (2) Lorez Time Series
	# (3) Plotting State Spaces
	# (4) Computing Recurrence Quantification Parameters
	# (5) Plotting Recurrence Plot




#################
# Start the clock!
start.time <- Sys.time()

################################################################################
# (1) Defining paths for main_path, r_scripts_path, ..., etc.

homepath <- Sys.getenv("HOME")
r_scripts_path <- getwd()
setwd("../")
main_path <- getwd()
setwd("../../")
main_code_path <-getwd()
setwd("../")
main_repository_path <-getwd()

figures_path <- paste(main_repository_path,'/docs/figs/tsrp/src/raw-figures',sep="")






################################################################################
# (0) Loading Functions and Libraries


library(deSolve) # call deSolve first to avoid (Error in .C("unlock_solver") : )
library(data.table) # for manipulating data
library(plot3D)
library("RColorBrewer")
library(ggplot2)
library(reshape2)#for melt
library(nonlinearTseries)






################################################################################
# (1) Homogeneous (uniformly distributed noise)
## `emailing-authors/exrps.m` LINE 33:
## N=400;
## X=crp(rand(N,1),1,1,.2,'sil');


## simulate 
N <- 278
unoise = runif(N)
noise <- as.data.table(unoise)


noise [,n:= 0:(.N-1),]
setcolorder(noise, c(2,1))
names(noise) <- c('n', 'x')




#################################################################################
## (2) Computing Recurrence Quantification Parameters
##
#' @param radius Maximum distance between two phase-space points to be
#' considered a recurrence.
#
ts <- noise$x
rqa.analysis=rqa(time.series = ts, embedding.dim=1, time.lag=1,
                radius=0.5,lmin=2,vmin=2,do.plot=FALSE, distanceToBorder=2)



#################################################################################
## (3) Plotting Recurrence Plot
##
plot_path <- paste(figures_path, sep="")
if (file.exists(plot_path)){
    setwd(file.path(plot_path))
} else {
  dir.create(plot_path, recursive=TRUE)
  setwd(file.path(plot_path))
}


#### Calling `extra_rqa`
source( paste(main_code_path,'/rfunctions/extra_rqa.R',sep='') )
rm <- as.matrix(rqa.analysis$recurrence.matrix)
maxsamplerp <- dim(rm)[1]

RM <- as.data.table( melt(rm, varnames=c('a','b'),value.name='Recurrence') )


filenametag <- paste('A-',N,'.png',sep='')
filename_extension <-  paste('rp-',filenametag,sep='')  
width = 1000
height = 1000



rplot2 <-  plotOnlyRecurrencePlot(RM,maxsamplerp)
saveRP(filename_extension,width,height,rplot2)


#############################
##### TIME SERIES

pts <- ggplot(noise,aes(x = n, y = x)) + 
	geom_line(size = 1)+
	labs(x = "Samples, n", y = 'x(n)')+
	theme_bw(18) 
	

### Save Picture
width = 800
height = 400
text.factor = 1
dpi <- text.factor * 100
width.calc <- width / dpi
height.calc <- height / dpi

file_ext <- paste('ts-A.png', sep='')
ggsave(filename = file_ext,
        dpi = dpi,
        width = width.calc,
        height = height.calc,
        units = 'in',
        bg = "transparent",
        device = "png",
	pts)



#################
# Stop the clock!
end.time <- Sys.time()
end.time - start.time


################################################################################
setwd(r_scripts_path) ## go back to the r-script source path
