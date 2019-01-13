#------------------------------------------------------------
# Extra Functions
#
#
#
# Miguel Xochicale [http://mxochicale.github.io]
#
#
#------------------------------------------------------------


## LOADING FUNCTIONS
#source( paste(repository_path,'/code/rfunctions/funcextras.R',sep='') )



################################################################################
################################################################################
################################################################################
#-------------------- zero mean unit variance function  --------------------------

#Sphering the data (whitening)
zeromean_unitvariance <- function ( x )
{
  # convert data as a matrix object
  x <- as.matrix(x)

  #column zero mean
  mx <- mean( x )

  zmx <-  x - matrix(rep( mx,dim(x)[1] ),ncol=dim(x)[2])

  sd_zmx <- sd(zmx)
  zmuv <- zmx/sd_zmx
  return( zmuv )
}





