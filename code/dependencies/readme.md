
# R

## 1. installing and dependencies R

run:

```
sh A_install-R.sh
```

* version: R version 3.4.4 (2018-03-15) -- "Someone to Lean On"


## 2. install basic R packages
Run `B_install-basic-packages.R` for package dependecies
```
R
source(paste(getwd(),"/B_install-basic-packages.R", sep=""), echo=FALSE)
```


## 3. nonlinearTseries package


* install nonlinearTseries with R script `install_nonlinearTseries.R`
```
R
source(paste(getwd(),"/C_install-nonlinearTseries.R", sep=""), echo=FALSE)
```

* then clone personal nonlinearTseries repository at

Current path for this readme.md: `github_path/mlds2019/code/dependencies`

```
cd ../../../
git clone https://github.com/mxochicale/nonlinearTseries
```




