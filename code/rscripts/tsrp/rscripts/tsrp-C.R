###############################################################################	
#
# Recurrence plot for drift (logistic map xi+1 = 4xi(1-xi) ) 
# corrupted with a linearly increasing term ( 0.01*(1:150) )
# 
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

figures_path <- paste(main_path,'/raw-figures',sep="")


################################################################################
# (0) Loading Functions and Libraries

library(data.table) # for manipulating data
library(plot3D)
library("RColorBrewer")
library(ggplot2)
library(reshape2)#for melt
library(nonlinearTseries)



################################################################################
# (1) Logistic Map
## `emailing-authors/exrps.m` LINE 46-49:
##x=.617; 
##for i=2:500; 
##   x(i)=4*x(i-1)*(1-x(i-1)); 
##end
##X=crp(x(201:200+150)+.01*[1:150],1,1,.2,'sil');

#N=150
#epsilon 0.2 sigma


logistic.map <- function(r, x, N, M){
  ## r: bifurcation parameter
  ## x: initial value
  ## N: Number of iteration
  ## M: Number of iteration points to be returned
  z <- 1:N
  z[1] <- x
  for(i in c(1:(N-1))){
    z[i+1] <- r *z[i]  * (1 - z[i])
  }
  ## Return the last M iterations 
  z[c((N-M):N)]
}
#REF: https://www.r-bloggers.com/logistic-map-feigenbaum-diagram/

r <- 4
x <- 0.617
N <- 350
M <- 150
lm <- logistic.map(r, x, N, M)
lm <- lm  +  0.01*(1:(1+M))


tsn <- as.data.table(lm)
tsn [,n:= 0:(.N-1),]
setcolorder(tsn, c(2,1))



#################################################################################
## (2) Computing Recurrence Quantification Parameters
##
#' @param radius Maximum distance between two phase-space points to be
#' considered a recurrence.
#
ts <- lm
rqa.analysis=rqa(time.series = ts, embedding.dim=1, time.lag=1,
                radius=0.2,lmin=2,vmin=2,do.plot=FALSE,distanceToBorder=2)


#################################################################################
## (3) Plotting Recurrence Plot
# #
plot_path <- paste(figures_path, sep="")
if (file.exists(plot_path)){
    setwd(file.path(plot_path))
} else {
  dir.create(plot_path, recursive=TRUE)
  setwd(file.path(plot_path))
}


### Calling `extra_rqa`
source( paste(main_code_path,'/rfunctions/extra_rqa.R',sep='') )


rm <- as.matrix(rqa.analysis$recurrence.matrix)
maxsamplerp <- dim(rm)[1]
RM <- as.data.table( melt(rm, varnames=c('a','b'),value.name='Recurrence') )

filenametag <- paste('C-',M, '.png',sep='')
filename_extension <-  paste('rp-',filenametag,sep='')  
width = 1000
height = 1000


rplot2 <-  plotOnlyRecurrencePlot(RM,maxsamplerp)
saveRP(filename_extension,width,height,rplot2)


#############################
##### TIME SERIES


pts <- ggplot(tsn,aes(x = n, y = lm)) + 
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

file_ext <- paste('ts-C.png', sep='')
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
