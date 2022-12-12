#!/usr/bin/gnuplot

reset

Nx= 200
Ny= 200
Nf= 100
Ng= 4000

############## plot densities #################

set term tikz

set xl'$\tau$' font ",28" offset 0,-1.25,0
set yl'$\rho_i$'  font ", 28" offset -2,0,0

set xr[-0.05:0.55]
set yr[0.05:0.35]
set ytics 0.05

set xtics font ", 14"
set ytics font ", 14"

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11


# color line definitions
set style line 1 lc rgb 'grey' dt 1 lw 4.5 pt 6 ps 3.0
set style line 2 lc rgb '#00ff7f' lt 0 lw 2.5 pt 7 ps 1
set style line 3 lc rgb '#f43169' dt 1 lw 4.5 pt 6 ps 3.0
set style line 4 lc rgb '#ffb6c1' dt 1 lw 4.5 pt 6 ps 3.0
set style line 5 lc rgb 'blue' lt -1 lw 2.5 pt 7 ps 1
set style line 6 lc rgb '#3399ff' lt -1 lw 2.5 pt 7 ps 1
set style line 7 lc rgb '#0b0404' dt 1 lw 4.5 pt 6 ps 3.0


	outname = sprintf("M0.tex")

	set out outname

set size 1.6, 1.3
set key at 0.5,0.22 font ",14"
#set key above
#set key inside left center Left reverse
#set key left bottom Left title 'Legend' box 3
set tics nomirror

plot	'statistics-M0.dat' u 1:($2-$8-$9-$10):30 with errorbars ls 1 t'0',\
	'statistics-M0.dat' u 1:($3+$8):31 with errorbars ls 3 t'1',\
	'statistics-M0.dat' u 1:($4+$9):32 with errorbars ls 4 t'2',\
	'statistics-M0.dat' u 1:($5+$10):33 with errorbars ls 7 t'3',\
	'statistics-M0.dat' u 1:($2-$8-$9-$10) with lp ls 1 notitle,\
	'statistics-M0.dat' u 1:($3+$8) with lp ls 3 notitle,\
	'statistics-M0.dat' u 1:($4+$9) with lp ls 4 notitle,\
	'statistics-M0.dat' u 1:($5+$10) with lp ls 7 notitle


