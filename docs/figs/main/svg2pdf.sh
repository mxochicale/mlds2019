#!/bin/bash
#usage
# sh svg2.sh filename

ifile=$1
inkscape --export-pdf $ifile.pdf $ifile.svg



