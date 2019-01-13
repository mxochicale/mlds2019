#!/bin/bash
#usage
# sh svg2pdf.sh filename

ifile=$1
inkscape --export-pdf $ifile.pdf $ifile.svg



