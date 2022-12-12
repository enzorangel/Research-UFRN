#!/usr/bin/gnuplot

reset

set term tikz

set xtics font ", 14"
set ytics font ", 14"

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11

#set key bottom left Left reverse samplen 1 at -10,0.6

# color line definitions
set style line 1 lc rgb '#1f0318' dt 1 lw 4.5 pt 6 ps 3.0 #(species 1)
set style line 2 lc rgb '#3d9036' dt 1 lw 4.5 pt 6 ps 3.0 #(species 2)
set style line 3 lc rgb '#949075' dt 1 lw 4.5 pt 6 ps 3.0 #(species 3)
set style line 4 lc rgb '#004D40' dt 1 lw 4.5 pt 6 ps 3.0 #(species 4)
set style line 5 lc rgb '#F5FF00' dt 1 lw 4.5 pt 6 ps 3.0 #(species 5)
set style line 6 lc rgb '#D81B60' dt 2 lw 4.5 pt 6 #(empty space)
set style line 7 lc rgb '#1E88E5' dt 2 lw 4.5 pt 6 #(species 6)
set style line 8 lc rgb '#fcbdce' dt 2 lw 4.5 pt 6 #(species 7)
set style line 9 lc rgb '#004D40' dt 2 lw 4.5 pt 6 #(species 8)
set style line 10 lc rgb '#999999' dt 1 lw 4.5 pt 6 ps 3.0 #(species 9)
set style line 11 lc rgb 'black' lw 3 pt 6 #(species 10)
set style line 13 lc rgb '#803777' lt 1 lw 5
set style line 14 lc rgb '#2f2999' lt 1 lw 5

	outname = sprintf("sr0.tex")

	set out outname


set xl'$\beta$' font ", 28" offset 0,-1.25,0
set yl'$\zeta_i$' font ", 28" offset -2,0,0

set xtics 1,1,10
set xr[0.75:10.25]
set yr[0.043:0.11]
#set ytics 0.01

set tics nomirror

set size 1.6, 1.0
set key at 10,0.1 font ",14"

plot 	'statistics.dat' u 1:13:41 with errorbars ls 2 t'1',\
	'statistics.dat' u 1:14:42 with errorbars ls 3 t'2',\
	'statistics.dat' u 1:15:43 with errorbars ls 1 t'3',\
	'statistics.dat' u 1:13 with lp ls 2 notitle,\
	'statistics.dat' u 1:14 with lp ls 3 notitle,\
	'statistics.dat' u 1:15 with lp ls 1 notitle
	

### End multiplot
