


# rendering  PDF in inkscape

1. GO TO PRINT
2. GENERAL > print to a file and select path, name and output format PDF
3. RENDERING>BITMAP (300dpi default)
4. PRINT





# converting pdf to image


```
convert -verbose -density 50 -trim print_version_A1.pdf -quality 100 -flatten -sharpen 0x1.0 finalversion_jpg.jpg
```


# svg to png

```
inkscape --export-png vfinal.png drawing.svg
inkscape --export-png v02.png drawing.svg
inkscape --export-png v01.png drawing.svg
inkscape --export-png v00.png drawing.svg

```


# poster final version

![poster](/main/vfinal.png)


