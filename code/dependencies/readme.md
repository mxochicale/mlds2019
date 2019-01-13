R installation and dependencies
---

# installing R

Follow [this instructions](https://github.com/mxochicale/R/blob/master/upgradeR/installation-ubuntu1604.md) to install R in Ubuntu 16.04 

# Installing dependencies

## 1. 

install dependencies by running `packages-dependencies.sh`
```
sh packages-dependencies.sh
```

## 2.
R packages

```
R
source(paste(getwd(),"/install-basic-packages.R", sep=""), echo=FALSE)
```


## 3.
 install nonlinearTseries with R script `install_nonlinearTseries.R`
```
R
source(paste(getwd(),"/install-nonlinearTseries.R", sep=""), echo=FALSE)
```


## 4.

then clone personal nonlinearTseries repository
```
cd
cd github
git clone https://github.com/mxochicale/nonlinearTseries
```



