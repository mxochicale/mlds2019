###############################################################################	
#
# RQAEntr 
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
setwd("../../../../")
repository_path <- getwd()
setwd("../")
root_path <- getwd()

data_path <- paste(repository_path,'/data/dataset',sep="")

#### Outcomes Graphics Path
graphics_path <- '/tsrp/src/3DRQA'
outcomes_graphics_path <- paste(repository_path,'/docs/figs', graphics_path, sep="")



################################################################################
# (1) Loading Functions and Libraries and Setting up digits


library(deSolve) # call deSolve first to avoid (Error in .C("unlock_solver") : )
library(data.table) # for manipulating data
library(ggplot2) # for plotting 
library(signal)# for butterworth filter and sgolay
library(RColorBrewer)

library(devtools)
load_all( paste(root_path, '/nonlinearTseries', sep='' ))


################################################################################
# (1) Lorenz Time Series


a<-NULL# rqas
signal_source<-'lorenz'

#r = 28;
#b = 8/3;
#s = 10;
#dy(1) = -s * (y(1) - y(2));
#dy(2) = -y(1)*y(3) + r*y(1) -y(2);
#dy(3) = y(1)*y(2) - b*y(3);
#
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



################################################################################
################################################################################
#  UNIFORM TIME DELAY EMBEDDING
################################################################################
################################################################################

#dimensions <- c(6)
#delays <- c(8)

#dimensions <- c(6,7)
#delays <- c(8,9)

#dimensions <- c(5, 6, 7)
#delays <- c(7, 8, 9)
#
#dimensions <- c(5, 6, 7, 8, 9, 10)
#delays <- c(5, 6, 7, 8, 9, 10)
#

dimensions <- seq(1,10)
delays <- seq(1,10)


################################################################################
for (dim_i in (1:100000)[dimensions]){
    	for (tau_j in (1:100000)[delays]){
		message('>> Embedding parameters:  m=',dim_i,' tau=',d=tau_j)
      	


################################################################################
# Recurrence Quantification Analysis
################################################################################

		#epsilons <- c(0.9, 1.0, 1.1)
		#epsilons <- c(0.9, 1.0, 1.1, 1.2)
		epsilons <- seq(0.1,5.0,0.1)

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
				rqaa$REC, 
				rqaa$ENTR
			)
		)
		)

	fss <- function(x) { signal_source }
       	rqas[,c("source"):= fss(), ]

	fD <- function(x) { dim_i }
       	rqas[,c("dim"):= fD(), ]

	fT <- function(x) { tau_j }
       	rqas[,c("tau"):= fT(), ]

	fEp <- function(x) { epsilon_k }
       	rqas[,c("eps"):= fEp(), ]

	a <- rbind(a,rqas) #accumulating

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



















#################################################################################
## () Rename col names and change order
#
rqacn <- c('REC', 'ENTR')

names(a)[1:2] <- rqacn
setcolorder(  a,c( 3,4,5,6, 1,2)  )



################################################################################
####  (8)  Writing Data 
###############################################################################
if (file.exists(data_path)){
    setwd(file.path(data_path))
} else {
  dir.create(data_path, recursive=TRUE)
  setwd(file.path(data_path))
}

file_ext <- paste('RQA3D_', signal_source, '.dt',sep='')
write.table(a, file_ext, row.name=FALSE)



################################################################################
# (5.0) Creating  and Changing to PlotPath
plots_path <- paste( outcomes_graphics_path, sep='')
if (file.exists(plots_path)){
    setwd(file.path(plots_path))
} else {
  dir.create(plots_path, recursive=TRUE)
  setwd(file.path(plots_path))
}



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

file_ext <- paste(signal_source,'_ts.png', sep='')
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

