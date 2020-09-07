#!/bin/bash
# In Eeschema use File->Plot to generate an svg drawing of the schematic.
#   This writes a foo.svg with the same name as the *.sch file.
#   IE: TPDD_Cable.svg
# Then run this with that svg filename as the only argument to crop away the whitespace.
#   IE" ./crop_svg.sh TPDD_Cable.svg
#
echo "Inkscape will appear to be idle for about 20 seconds."
echo "Just wait and it will crop, save, and exit by itself."
inkscape --verb=FitCanvasToDrawing --verb=FileSave --verb=FileQuit "${@}"
