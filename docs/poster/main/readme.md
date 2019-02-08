poster
---



# rendering  PDF in inkscape

1. GO TO PRINT
2. GENERAL > print to a file and select path, name and output format PDF
3. RENDERING>BITMAP (300dpi default)
4. PRINT



# converting pdf to jpg


```
convert -verbose -density 50 -trim print_A1.pdf -quality 100 -flatten -sharpen 0x1.0 poster.jpg
```


# svg to png

```
inkscape --export-png poster.png poster.svg

```


# poster final version

![poster](/docs/poster/main/poster.png)


