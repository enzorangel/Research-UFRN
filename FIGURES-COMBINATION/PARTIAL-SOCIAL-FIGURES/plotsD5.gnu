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
set style line 1 lc rgb '#FF6600' dt 1 lw 4.5 pt 6 ps 3.0 #(species 1)
set style line 2 lc rgb '#660099' dt 1 lw 4.5 pt 6 ps 3.0 #(species 2)
set style line 3 lc rgb '#F090FF' dt 1 lw 4.5 pt 6 ps 3.0 #(species 3)
set style line 4 lc rgb '#39ff14' dt 1 lw 4.5 pt 6 ps 3.0 #(species 4)
set style line 5 lc rgb '#AF8866' dt 1 lw 4.5 pt 6 ps 3.0 #(species 5)
set style line 6 lc rgb '#D81B60' dt 2 lw 4.5 pt 6 #(empty space)
set style line 7 lc rgb '#1E88E5' dt 2 lw 4.5 pt 6 #(species 6)
set style line 8 lc rgb '#fcbdce' dt 2 lw 4.5 pt 6 #(species 7)
set style line 9 lc rgb '#004D40' dt 2 lw 4.5 pt 6 #(species 8)
set style line 10 lc rgb '#999999' dt 1 lw 4.5 pt 6 ps 3.0 #(species 9)
set style line 11 lc rgb 'black' pt 6 #(species 10)
set style line 13 lc rgb '#803777' lt 1 lw 7
set style line 14 lc rgb '#2f2999' lt 1 lw 7

	outname = sprintf("d5.tex")

	set out outname

set xl '$\gamma$' font ", 28" offset 0,-1.25,0
set yl'$\rho_1$' font ", 28" offset -2,0,0

set arrow 1 from 0.2, 0.16 to 0,0.16 linestyle 13
set arrow 2 from 0.8, 0.16 to 1,0.16 linestyle 14

set label 1 'Social Distance' at 0.79, 0.155 font ',15'
set label 2 'Safeguard' at 0.03,0.155 font ',15'

set xtics 0,0.1,1
set xr[-0.05:1.05] 
set yr[0.17:0.27]
set ytics 0.015

set tics nomirror

set origin 0, 1.0
set size 1.6, 1.3
set key at 0.6,0.22 font ",14"

plot 	'statistics-0.dat' u (1.0-$1):($3+$8):31 with errorbars ls 1 t'$\eta=0.00$',\
	'statistics-25.dat' u (1.0-$1):($3+$8):31 with errorbars ls 2 t'$\eta=0.25$',\
	'statistics-50.dat' u (1.0-$1):($3+$8):31 with errorbars ls 3 t'$\eta=0.50$',\
	'statistics-75.dat' u (1.0-$1):($3+$8):31 with errorbars ls 4 t'$\eta=0.75$',\
	'statistics-100.dat' u (1.0-$1):($3+$8):31 with errorbars ls 5 t'$\eta=1.00$',\
	'statistics-0.dat' u (1.0-$1):($3+$8) with lp ls 1 notitle,\
	'statistics-25.dat' u (1.0-$1):($3+$8) with lp ls 2 notitle,\
	'statistics-50.dat' u (1.0-$1):($3+$8) with lp ls 3 notitle,\
	'statistics-75.dat' u (1.0-$1):($3+$8) with lp ls 4 notitle,\
	'statistics-100.dat' u (1.0-$1):($3+$8) with lp ls 5 notitle,\

### End multiplot
