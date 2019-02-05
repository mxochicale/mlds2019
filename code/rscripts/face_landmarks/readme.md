

```
data <- xdata[,.(
      	zmuva_left_eye, zmuva_right_eye, zmuva_out_mouth,
	sgzmuva_left_eye, sgzmuva_right_eye, sgzmuva_out_mouth
 
	), by=. (participant,trial)]
```



```
> end.time - start.time
Time difference of 4.171182 hours
```

Mon Feb  4 23:28:42 GMT 2019
