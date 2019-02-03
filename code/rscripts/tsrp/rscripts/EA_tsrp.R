###############################################################################	
#
# Recurrence plot for Lorenz
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
# (1) Lorenz Time Series
#r = 28;
#b = 8/3;
#s = 10;
#dy(1) = -s * (y(1) - y(2));
#dy(2) = -y(1)*y(3) + r*y(1) -y(2);
#dy(3) = y(1)*y(2) - b*y(3);
#
## `emailing-authors/exrps.m` LINE 4-5:
## [t, x] = ode45('lorenz',[1 50], [1.6186 1.8792 17.617]);
## X=crp2([x(1:1500,1),x(1:1500,2),x(1:1500,3)],1,1,5,'euc','non','sil');

Lorenz <- function(t, state, parameters){
	  with(as.list( c(state,parameters)),
	      {
	      #rate of change
	      dX <- sigma*(Y-X)
	      dY <- rho*X - X*Z - Y
	      dZ <- X*Y - beta*Z

	      # return the rate of change
	      list( c(dX, dY, dZ) )
	      }
	  )# end with(as.list...
}

#define controlling parameters
# rho     - Scaled Rayleigh number.
# sigma   - Prandtl number.
# beta   - Geometry ascpet ratio.
parameters <- c(rho=28, sigma= 10, beta=8/3)

#define initial state
state <- c(X=1.6186, Y=1.8792, Z=17.617)


# define integrations times
# times <- seq(0,100, by=0.001)
#times <- seq(0,100, by=0.01)
#times <- seq(0,5, by=0.01)#501 samples
#times <- seq(1,50, by=0.01)#5001 samples
times <- seq(0,50, by=0.05)


N <- length(times)-1


#perform the integration and assign it to variable 'out'
out <- ode(y=state, times= times, func=Lorenz, parms=parameters)


lorenzdt <- as.data.table(out)

fsNNtmp <-function(x) {list("Lorenz")}
lorenzdt[,c("type"):=fsNNtmp(), ]
lorenzdt[,sample:=seq(.N)]
setcolorder(lorenzdt, c(5,6,1:4))


#window data 
maxN <- 278
windowframe = (N-maxN):N;
#windowframe = 0:maxN
lorenzdt <- lorenzdt[,.SD[windowframe]]


xn<- lorenzdt$X



#################################################################################
## (2) Computing Recurrence Quantification Parameters
##
rqa.analysis=rqa(time.series = xn, embedding.dim=1, time.lag=1,
                radius=0.5, lmin=2, vmin=2, do.plot=FALSE, distanceToBorder=2)



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

### Calling `extra_rqa`
source( paste(main_code_path,'/rfunctions/extra_rqa.R',sep='') )

rm <- as.matrix(rqa.analysis$recurrence.matrix)
maxsamplerp <- dim(rm)[1]

RM <- as.data.table( melt(rm, varnames=c('a','b'),value.name='Recurrence') )

filenametag <- paste('E-',maxN,'.png',sep='')
filename_extension <-  paste('rp-',filenametag,sep='')  
width = 1000
height = 1000


rplot2 <-  plotOnlyRecurrencePlot(RM, maxsamplerp)
saveRP(filename_extension, width, height, rplot2)



#############################
##### TIME SERIES


pts <- ggplot(lorenzdt,aes(x = sample, y = X)) + 
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

file_ext <- paste('ts-E.png', sep='')
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
