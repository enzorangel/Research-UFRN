#!/usr/bin/gnuplot

reset

Nx= 200
Ny= 200
Nf= 100
Ng= 4000

############## plot densities #################

set term tikz
#set term png size 640, 360 enhanced font 'Arial, 9'

set xl'$\alpha$' font ",16" offset 0,-1.0,0
set yl'$\rho_i$'  font ", 18" offset -1.7,0,0
#set y2l'$\epsilon\,(\%)$'  font ", 18" offset 5,0,0

set xr[-0.1:1.1]
set yr[0.05:0.4]

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11
#set tics nomirror


# color line definitions
set style line 1 lc rgb 'grey' lt 0 lw 2.5 pt 7 ps 1
set style line 2 lc rgb '#00ff7f' lt 0 lw 2.5 pt 7 ps 1
set style line 3 lc rgb '#f43169' lt 0 lw 2.5 pt 7 ps 1
set style line 4 lc rgb '#f7d9d0' lt 0 lw 2.5 pt 7 ps 1
set style line 5 lc rgb 'blue' lt -1 lw 2.5 pt 7 ps 1
set style line 6 lc rgb '#3399ff' lt -1 lw 2.5 pt 7 ps 1
set style line 7 lc rgb '#0b0404' lt 0 lw 2.5 pt 7 ps 1


	outname = sprintf("learning.tex")

	set out outname

set size 1.6, 1.0
set key at 1,0.2

#set label '25' at 1.13,0.37207625 center tc rgb "black"
#set label '20' at 1.13,0.3571932 center tc rgb "black"
#set label '15' at 1.13,0.34231015 center tc rgb "black"
#set label '10' at 1.13,0.3274271 center tc rgb "black"
#set label '5' at 1.13,0.31254405 center tc rgb "black"
#set label '0' at 1.13,0.297661 center tc rgb "black"
#set label '-5' at 1.13,0.28277795 center tc rgb "black"
#set label '-10' at 1.13,0.2678949 center tc rgb "black"
#set label '-15' at 1.13,0.25301185 center tc rgb "black"
#set label '-20' at 1.13,0.2381288 center tc rgb "black"
#set label '-25' at 1.13,0.22324575 center tc rgb "black"


plot    'statistics.dat' u 1:2:9 with yerrorbars ls 1 t '1',\
	'statistics.dat' u 1:3:10 with yerrorbars ls 3 t '1',\
	'statistics.dat' u 1:4:11 with yerrorbars ls 4 t '2',\
	'statistics.dat' u 1:5:12 with yerrorbars ls 7 t '3',\
	'statistics.dat' u 1:2 with lp ls 1 notitle,\
		'statistics.dat' u 1:3 with lp ls 3 notitle,\
		'statistics.dat' u 1:4 with lp ls 4 notitle,\
		'statistics.dat' u 1:5 with lp ls 7 notitle
