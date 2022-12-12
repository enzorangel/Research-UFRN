#!/usr/bin/gnuplot

reset

Nx= 500
Ny= 500
Nf= 200
Ng= 2000



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

set xr[(Nx/2):Nx]
set yr[0:(Ny/2)]

set cbrange[0.0:1.0]







load 'jet.pal'

do for[i=0:Nf]{

	dataname = sprintf("database/surge%d.dat",i)
	imagename = sprintf("plots/2surge%d.png",i)

	set out imagename

	plot dataname u 1:2:3 matrix with image notitle
}
