#!/usr/bin/gnuplot

reset

Nx= 200
Ny= 200
Nf= 100
Ng= 4000

############## plot densities #################

set term tikz

set xl'$R$' font ",28" offset 0,-1.25,0
set yl'$\rho_i$'  font ", 28" offset -2,0,0

set xtics 0,1,4
set xr[-0.25:4.25]
set yr[0.05:0.4]

set xtics font ", 14"
set ytics font ", 14"

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11
set tics nomirror


# color line definitions
set style line 1 lc rgb 'grey' dt 1 lw 4.5 pt 6 ps 3.0
set style line 2 lc rgb '#00ff7f' lt 0 lw 2.5 pt 7 ps 1
set style line 3 lc rgb '#f43169' dt 1 lw 4.5 pt 6 ps 3.0
set style line 4 lc rgb '#ffb6c1' dt 1 lw 4.5 pt 6 ps 3.0
set style line 5 lc rgb 'blue' lt -1 lw 2.5 pt 7 ps 1
set style line 6 lc rgb '#3399ff' lt -1 lw 2.5 pt 7 ps 1
set style line 7 lc rgb '#0b0404' dt 1 lw 4.5 pt 6 ps 3.0



	outname = sprintf("d.tex")

	set out outname

set size 1.6, 1.3
set key at 4,0.2 font ",14"


plot 	'statistics.dat' u 1:2:9 with errorbars ls 1 t'0',\
	'statistics.dat' u 1:3:10 with errorbars ls 3 t'1',\
	'statistics.dat' u 1:4:11 with errorbars ls 4 t'2',\
	'statistics.dat' u 1:5:12 with errorbars ls 7 t'3',\
	'statistics.dat' u 1:2 with lp ls 1 notitle,\
	'statistics.dat' u 1:3 with lp ls 3 notitle,\
	'statistics.dat' u 1:4 with lp ls 4 notitle,\
	'statistics.dat' u 1:5 with lp ls 7 notitle

