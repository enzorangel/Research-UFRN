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
set style line 3 lc rgb '#fcbdce' dt 1 lw 4.5 pt 6 ps 3.0 #(species 3)
set style line 4 lc rgb '#004D40' dt 1 lw 4.5 pt 6 ps 3.0 #(species 4)
set style line 5 lc rgb '#F5FF00' dt 1 lw 4.5 pt 6 ps 3.0 #(species 5)
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


set xl'$\beta$' font ", 28" offset 0,-1.25,0
set yl'$\rho_i$' font ", 28" offset -2,0,0

set xtics 0,0.1,1
set xr[-0.03:1.03] 
#set ytics 0.04
set yr[0.05:0.31]

set tics nomirror

set object 1 rect from graph 0, graph 0 to graph 0.311, graph 1 back
set object 1 rect fc rgb "#e8e8e8" fillstyle solid 1.0

set object 2 rect from graph 0.311, graph 0 to graph 0.783, graph 1 back
set object 2 rect fc rgb "#f7f7f7" fillstyle solid 1.0

set object 3 rect from graph 0.783, graph 0 to graph 1, graph 1 back
set object 3 rect fc rgb "white" fillstyle solid 1.0

set size 1.6, 1.3
set key at 0.2,0.22 font ",14"

plot 	'statistics.dat' u 1:($2-$8-$9-$10-$11-$12):30 with errorbars ls 10 t'0',\
	'statistics.dat' u 1:($3+$8):31 with errorbars ls 1 t'1',\
	'statistics.dat' u 1:($4+$9):32 with errorbars ls 2 t'2',\
	'statistics.dat' u 1:($5+$10):33 with errorbars ls 3 t'3',\
	'statistics.dat' u 1:($6+$11):34 with errorbars ls 4 t'4',\
	'statistics.dat' u 1:($7+$12):35 with errorbars ls 5 t'5',\
	'statistics.dat' u 1:($2-$8-$9-$10-$11-$12) with lp ls 10 notitle,\
	'statistics.dat' u 1:($3+$8) with lp ls 1 notitle,\
	'statistics.dat' u 1:($4+$9) with lp ls 2 notitle,\
	'statistics.dat' u 1:($5+$10) with lp ls 3 notitle,\
	'statistics.dat' u 1:($6+$11) with lp ls 4 notitle,\
	'statistics.dat' u 1:($7+$12) with lp ls 5 notitle,\

### End multiplot
