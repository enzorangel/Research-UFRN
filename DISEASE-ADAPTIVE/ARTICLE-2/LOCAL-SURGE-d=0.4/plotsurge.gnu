#!/usr/bin/gnuplot

reset

Nx= 500
Ny= 500
Nf= 20
Ng= 500



set colorbox

################ plot grid #####################
#set size ratio -1
set term png size 416,401 crop

unset xtics
unset ytics
unset key
unset colorbox
unset border
unset grid
unset xl
unset yl

set xr[0:Nx]
set yr[0:Ny]

set cbrange[0.25:0.8]







#load 'jet.pal'
load 'turbo.pal'

do for[i=0:Nf]{

	dataname = sprintf("database/surge%d.dat",i)
	imagename = sprintf("plots/surge%d.png",i)

	set out imagename

	plot dataname u 1:2:3 matrix with image notitle
}
