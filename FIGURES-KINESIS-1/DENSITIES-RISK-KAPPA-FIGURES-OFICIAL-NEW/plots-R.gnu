#!/usr/bin/gnuplot

reset

Nx= 200
Ny= 200
Nf= 100
Ng= 4000

############## plot densities #################

set term tikz

set xl'$\kappa$' font ",16" offset 0,-1.0,0
#set yl'$\langle\,(\rho_i-\rho_0)/\rho_0\,\rangle (\%)$'  font ", 18" offset -1.7,0,0
set yl'$\langle\,\epsilon_i\,\rangle (\%)$'  font ", 18" offset -1.7,0,0

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


	outname = sprintf("dr.tex")

	set out outname

set size 1.6, 1.0
set key at 4,-10.0


plot 	'statistics.dat' u 1:(100*(($3-0.297662)/0.297662)):10 with errorbars ls 3 t'species 1',\
	'statistics.dat' u 1:(100*(($4-0.297662)/0.297662)):11 with errorbars ls 4 t'species 2',\
	'statistics.dat' u 1:(100*(($5-0.297662)/0.297662)):12 with errorbars ls 7 t'species 3',\
	'statistics.dat' u 1:(100*(($2-0.107709)/0.107709)):9 with errorbars ls 1 t'empty spaces',\
	'statistics.dat' u 1:(100*(($2-0.107709)/0.107709)) with lp ls 1 notitle,\
	'statistics.dat' u 1:(100*(($3-0.297662)/0.297662)) with lp ls 3 notitle,\
	'statistics.dat' u 1:(100*(($4-0.297662)/0.297662)) with lp ls 4 notitle,\
	'statistics.dat' u 1:(100*(($5-0.297662)/0.297662)) with lp ls 7 notitle,\
        0 notitle


