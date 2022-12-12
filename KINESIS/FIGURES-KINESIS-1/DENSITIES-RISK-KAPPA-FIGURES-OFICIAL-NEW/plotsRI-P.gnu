#!/usr/bin/gnuplot

reset

Nx= 200
Ny= 200
Nf= 100
Ng= 4000

############## plot densities #################

set term tikz

set xl'$\kappa$' font ",16" offset 0,-1.0,0
set yl'$\langle\,\zeta_i\,\rangle(\%)$'  font ", 18" offset -1.7,0,0

set xr[-0.25:4.25]
#set yr[0.0:3.9]

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11
#set tics nomirror


# color line definitions
set style line 1 lc rgb 'gray' lt 0 lw 2.5 pt 7 ps 1
set style line 2 lc rgb '#00ff7f' lt 0 lw 2.5 pt 7 ps 1
set style line 3 lc rgb '#FF8000' lt 0 lw 2.5 pt 7 ps 1
set style line 4 lc rgb '#000066' lt 0 lw 2.5 pt 7 ps 1
set style line 5 lc rgb 'blue' lt -1 lw 2.5 pt 7 ps 1
set style line 6 lc rgb '#3399ff' lt -1 lw 2.5 pt 7 ps 1
set style line 7 lc rgb '#00FFFF' lt 0 lw 2.5 pt 7 ps 1


	outname = sprintf("rp.tex")

	set out outname

set size 1.6, 1.0
set key at 4,3


plot 'statistics.dat' u 1:($6)*100:($13)*100 with errorbars ls 3 t'species 1',\
	'statistics.dat' u 1:($7)*100:($14)*100 with errorbars ls 4 t'species 2',\
	'statistics.dat' u 1:($8)*100:($15)*100 with errorbars ls 7 t'species 3',\
	'statistics.dat' u 1:($6)*100 with lp ls 3 notitle,\
	'statistics.dat' u 1:($7)*100 with lp ls 4 notitle,\
	'statistics.dat' u 1:($8)*100 with lp ls 7 notitle


