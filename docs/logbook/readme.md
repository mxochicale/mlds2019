LogBook
---


Symposium on Machine Learning and Dynamical Systems 
Imperial College London   
Feb. 11-13, 2019   




# 14th - 20th January 2019

* [x] polished abstract 
	Tue Jan 15 17:53:56 GMT 2019

* [x] update of R in Ubuntu 1404
	* B script took like around 60 minutes to finish
	* C script less than 5 minutes
	
	Tue Jan 15 18:45:29 GMT 2019



# 21th - 27th January 2018


* [x] polished

```
├── A_dataset.R
├── B_plottingtimeseries.R
├── C_RQAEntr.R
```
and added

```
└── D_plot_3DRQAEntr.R
```

Also added:


```
mlds2019/docs/figs/rqaentr$ tree
.
└── ENTR_Trial1_sgzmuvx_0.png
```

	Thu 24 Jan 17:34:03 GMT 2019


```
├── C_RQAEntr.R

data <- xdata[,.(
	sgzmuvx_0
dimensions <- seq(1,10)
delays <- seq(1,10)

		epsilons <- seq(0.1,5.0,0.1)

 852K Jan 24 18:30 RQA3D.dt
Time difference of 57.89195 mins
```

Thu 24 Jan 18:54:20 GMT 2019






# 28th Jan - 3th Feb 2019

## Tue Jan 29 15:24:13 GMT 2019


```
	code/rscripts/E_plot_3DRQAEntr.R
	docs/figs/rqaentr/first_proposal/
	docs/figs/rqaentr/second_proposal/
```

## Fri Feb  1 20:42:04 GMT 2019

```
	code/rscripts/tsrp/rscripts/AA_tsrp.R
	code/rscripts/tsrp/rscripts/AB_RQAEntr.R
	code/rscripts/tsrp/rscripts/AC_plot_3DRQAEntr.R
	code/rscripts/tsrp/rscripts/BA_tsrp.R
	code/rscripts/tsrp/rscripts/BB_RQAEntr.R
	code/rscripts/tsrp/rscripts/BC_plot_3DRQAEntr.R
	code/rscripts/tsrp/rscripts/CA_tsrp.R
	code/rscripts/tsrp/rscripts/CB_RQAEntr.R
	code/rscripts/tsrp/rscripts/CC_plot_3DRQAEntr.R
	code/rscripts/tsrp/rscripts/DA_tsrp.R
	code/rscripts/tsrp/rscripts/DB_RQAEntr.R
	code/rscripts/tsrp/rscripts/DC_plot_3DRQAEntr.R

```



```
/data/dataset$ tree -s
.
├── [     284288]  RQA3D_brownianmotion.dt
├── [     256385]  RQA3D_logisticmap.dt
├── [     223294]  RQA3D_sinewaves.dt
└── [     221641]  RQA3D_uniformnoise.dt
```

## Sun Feb  3 20:34:22 GMT 2019

lorenz time series

```
	code/rscripts/tsrp/rscripts/EA_tsrp.R
	code/rscripts/tsrp/rscripts/EB_RQAEntr.R
	code/rscripts/tsrp/rscripts/EC_plot_3DRQAEntr.R
	data/dataset/RQA3D_lorenz.dt
	docs/figs/tsrp/src/3DRQA/lorenz_ENTR_eps_0.1.png
	docs/figs/tsrp/src/3DRQA/lorenz_ENTR_eps_0.2.png
	docs/figs/tsrp/src/3DRQA/lorenz_ENTR_eps_0.5.png
	docs/figs/tsrp/src/3DRQA/lorenz_ENTR_eps_0.7.png
	docs/figs/tsrp/src/3DRQA/lorenz_ENTR_eps_1.2.png
	docs/figs/tsrp/src/3DRQA/lorenz_ENTR_eps_1.5.png
	docs/figs/tsrp/src/3DRQA/lorenz_ENTR_eps_1.7.png
	docs/figs/tsrp/src/3DRQA/lorenz_ENTR_eps_1.png
	docs/figs/tsrp/src/3DRQA/lorenz_ENTR_eps_2.png
	docs/figs/tsrp/src/3DRQA/lorenz_ENTR_eps_3.png
	docs/figs/tsrp/src/3DRQA/lorenz_ENTR_eps_4.png
	docs/figs/tsrp/src/3DRQA/lorenz_ENTR_eps_5.png
	docs/figs/tsrp/src/3DRQA/lorenz_ts.png
	docs/figs/tsrp/src/raw-figures/rp-E-278.png
	docs/figs/tsrp/src/raw-figures/ts-E.png
```






# 4th - 10th Feb 2019




# Symposium 

* [ ] Monday 11th February 2019

* [ ] Tuesday 12th February 2019

* [ ] Wednesday 13th February 2019




# TODO list

* [ ] define the same range of variation of colours in 3drqa plots
	Fri Feb  1 20:42:55 GMT 2019




* [ ] files for images and dateset should have the ranges for each file
* [x] experiment with limitated axis of 3D axis!
	sorted out with `E_plot`
	Tue Jan 29 15:24:58 GMT 2019 
* [ ] * create a plot for an average of the 67 values
	* create a plot for a landmark near the eye or mouth


Thu 24 Jan 19:02:22 GMT 2019


