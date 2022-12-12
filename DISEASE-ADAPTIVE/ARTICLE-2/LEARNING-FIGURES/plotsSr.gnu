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
set style line 1 lc rgb '#D81B60' dt 1 lw 4.5 pt 6 ps 3.0 #(species 1)
set style line 2 lc rgb '#1E88E5' dt 1 lw 4.5 pt 6 ps 3.0 #(species 2)
set style line 3 lc rgb '#1E2EDE' dt 1 lw 4.5 pt 6 ps 3.0 #(species 3)
set style line 4 lc rgb '#ff6600' dt 1 lw 4.5 pt 6 ps 3.0 #(species 4)
set style line 5 lc rgb '#F5FF00' dt 1 lw 4.5 pt 6 ps 3.0 #(species 5)
set style line 6 lc rgb '#D81B60' dt 2 lw 4.5 pt 6 #(empty space)
set style line 7 lc rgb '#1E88E5' dt 2 lw 4.5 pt 6 #(species 6)
set style line 8 lc rgb '#fcbdce' dt 2 lw 4.5 pt 6 #(species 7)
set style line 9 lc rgb '#004D40' dt 2 lw 4.5 pt 6 #(species 8)
set style line 10 lc rgb '#999999' dt 1 lw 4.5 pt 6 ps 3.0 #(species 9)
set style line 11 lc rgb 'black' pt 6 #(species 10)
set style line 13 lc rgb '#803777' lt 1 lw 7
set style line 14 lc rgb '#2f2999' lt 1 lw 7

	outname = sprintf("sr.tex")

	set out outname


set xl'$\varepsilon$' font ", 28" offset 0,-1.25,0
set yl'$\tilde{\zeta_1}(\%)$' font ", 28" offset -2,0,0

set xtics 0,0.1,1
set xr[-0.05:1.05] 
set yr[-8:120]
set ytics 15

set size 1.6, 1.0
set key at 0.2,100 font ",14"
set tics nomirror

plot 	'statistics-R3.dat' u 1:((($13-0.0217453)/0.0217453)*100):41 with errorbars ls 4 t'$R=3$',\
	'statistics-R5.dat' u 1:((($13-0.0141961)/0.0141961)*100):41 with errorbars ls 3 t'$R=5$',\
	'statistics-R3.dat' u 1:((($13-0.0217453)/0.0217453)*100) with lp ls 4 notitle,\
	'statistics-R5.dat' u 1:((($13-0.0141961)/0.0141961)*100) with lp ls 3 notitle,\
	

### End multiplot
