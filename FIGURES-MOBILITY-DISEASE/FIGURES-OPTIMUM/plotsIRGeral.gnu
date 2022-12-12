#!/usr/bin/gnuplot

reset

set term tikz
#set term png size 670,500

set xtics font ", 14"
set ytics font ", 14"

#set xr[-0.25:1.25] 
#set yr[0.0:0.6]

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11
#set tics nomirror

#set key bottom left Left reverse samplen 1 at -10,0.6

# define grid
#set style line 12 lc rgb '#ffffff' lt 0 lw 1
#set grid back ls 12

# color line definitions
set style line 1 lc rgb '#1f0318' dt 1 lw 4.5 pt 6 ps 3.0 #(species 1)
set style line 2 lc rgb '#3d9036' dt 1 lw 4.5 pt 6 ps 3.0 #(species 2)
set style line 3 lc rgb '#949075' dt 1 lw 4.5 pt 6 ps 3.0 #(species 3)
set style line 4 lc rgb '#004D40' dt 1 lw 4.5 pt 6 ps 3.0 #(species 4)
set style line 5 lc rgb '#F5FF00' dt 1 lw 4.5 pt 6 ps 3.0 #(species 5)
set style line 6 lc rgb '#D81B60' dt 1 lw 4.5 pt 6 ps 3.0 #(empty space)
set style line 7 lc rgb '#1E88E5' dt 1 lw 4.5 pt 6 ps 3.0 #(species 6)
set style line 8 lc rgb '#fcbdce' dt 1 lw 4.5 pt 6 ps 3.0 #(species 7)
set style line 9 lc rgb '#004D40' dt 1 lw 4.5 pt 6 ps 3.0 #(species 8)
set style line 10 lc rgb '#999999' dt 1 lw 4.5 pt 6 ps 3.0 #(species 9)
set style line 11 lc rgb 'black' lw 3 pt 6 #(species 10)
set style line 13 lc rgb '#803777' lt 1 lw 4
set style line 14 lc rgb '#2f2999' lt 1 lw 4

	outname = sprintf("ir.tex")

	set out outname



set xl'$\nu$' font ", 28" offset 0,-1.25,0
set yl'$\chi_i(\%)$' font ", 28" offset -2,0,0

set xtics 0,0.1,1
#set xr[-0.025:1.025]
#set yr[22:33]
#set ytics 1.5

set tics nomirror


set size 1.6, 1.0
#set key at 0.2,31.5 font ",14"

plot 	'statistics-m0p1.dat' u (1-$1):($18*100):46 with errorbars ls 1 t'1',\
	'statistics-m0p2.dat' u (1-$1):($18*100):46 with errorbars ls 2 t'2',\
	'statistics-m0p3.dat' u (1-$1):($18*100):46 with errorbars ls 3 t'3',\
	'statistics-m0p4.dat' u (1-$1):($18*100):46 with errorbars ls 4 t'4',\
	'statistics-m0p5.dat' u (1-$1):($18*100):46 with errorbars ls 5 t'5',\
	'statistics-m0p6.dat' u (1-$1):($18*100):46 with errorbars ls 6 t'6',\
	'statistics-m0p7.dat' u (1-$1):($18*100):46 with errorbars ls 7 t'7',\
	'statistics-m0p8.dat' u (1-$1):($18*100):46 with errorbars ls 8 t'8',\
	'statistics-m0p9.dat' u (1-$1):($18*100):46 with errorbars ls 9 t'9',\
	'statistics-m0p1.dat' u (1-$1):($18*100) with lp ls 1 notitle,\
	'statistics-m0p2.dat' u (1-$1):($18*100) with lp ls 2 notitle,\
	'statistics-m0p3.dat' u (1-$1):($18*100) with lp ls 3 notitle,\
	'statistics-m0p4.dat' u (1-$1):($18*100) with lp ls 4 notitle,\
	'statistics-m0p5.dat' u (1-$1):($18*100) with lp ls 5 notitle,\
	'statistics-m0p6.dat' u (1-$1):($18*100) with lp ls 6 notitle,\
	'statistics-m0p7.dat' u (1-$1):($18*100) with lp ls 7 notitle,\
	'statistics-m0p8.dat' u (1-$1):($18*100) with lp ls 8 notitle,\
	'statistics-m0p9.dat' u (1-$1):($18*100) with lp ls 9 notitle


### End multiplot
