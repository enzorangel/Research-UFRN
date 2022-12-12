#!/usr/bin/gnuplot

reset

Nx= 200
Ny= 200
Nf= 100
Ng= 4000

############## plot densities #################

set term tikz

set xl'$\epsilon$' font ",28" offset 0,-1.25,0
set yl'$\zeta_i\,(\%)$'  font ", 28" offset -2,0,0
#set y2l'$\xi_i\,(\%)$'  font ", 18" offset 5,0.031

set xr[-0.25:4.25]
set yr[2.2:4]

set xtics font ", 14"
set ytics font ", 14"

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11
set tics nomirror


# color line definitions
set style line 1 lc rgb 'gray' lt 0 lw 2.5 pt 7 ps 1
set style line 2 lc rgb '#00ff7f' lt 0 lw 2.5 pt 7 ps 1
set style line 3 lc rgb '#f43169' dt 1 lw 4.5 pt 6 ps 3.0
set style line 4 lc rgb '#ffb6c1' dt 1 lw 4.5 pt 6 ps 3.0
set style line 5 lc rgb 'blue' lt -1 lw 2.5 pt 7 ps 1
set style line 6 lc rgb '#3399ff' lt -1 lw 2.5 pt 7 ps 1
set style line 7 lc rgb '#0b0404' dt 1 lw 4.5 pt 6 ps 3.0

	outname = sprintf("r.tex")

	set out outname

set size 1.6, 1.3
set key at 4,2.8 font ",14"

#set label '40' at 4.35,0.0389081 center tc rgb "black"
#set label '35' at 4.35,0.037518525 center tc rgb "black"
#set label '30' at 4.35,0.03612895 center tc rgb "black"
#set label '25' at 4.35,0.034739375 center tc rgb "black"
#set label '20' at 4.35,0.0333498 center tc rgb "black"
#set label '15' at 4.35,0.031960225 center tc rgb "black"
#set label '10' at 4.35,0.03057065 center tc rgb "black"
#set label '5' at 4.35,0.029181075 center tc rgb "black"
#set label '0' at 4.35,0.0277915 center tc rgb "black"
#set label '-5' at 4.35,0.026401925 center tc rgb "black"
#set label '-10' at 4.35,0.02501235 center tc rgb "black"
#set label '-15' at 4.35,0.023622775 center tc rgb "black"

#set y2range [-15:40]
#set y2tics border


plot 'statistics.dat' u 1:(100*$6):(100*$13) with errorbars axes x1y1 ls 3 t'1',\
	'statistics.dat' u 1:(100*$7):(100*$14) with errorbars axes x1y1 ls 4 t'2',\
	'statistics.dat' u 1:(100*$8):(100*$15) with errorbars axes x1y1 ls 7 t'3',\
	'statistics.dat' u 1:(100*$6) with lp ls 3 notitle,\
	'statistics.dat' u 1:(100*$7) with lp ls 4 notitle,\
	'statistics.dat' u 1:(100*$8) with lp ls 7 notitle


