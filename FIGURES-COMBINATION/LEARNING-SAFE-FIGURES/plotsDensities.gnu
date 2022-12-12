#!/usr/bin/gnuplot

reset

set term tikz
#set term png size 670,500

set xtics font ", 14"
set ytics font ", 14"

#set border 3 back ls 11
#set tics nomirror

#set key bottom left Left reverse samplen 1 at -10,0.6

# define grid
#set style line 12 lc rgb '#ffffff' lt 0 lw 1
#set grid back ls 12

# color line definitions
set style line 1 lc rgb '#D81B60' dt 1 lw 3 pt 6 #(species 1)
set style line 2 lc rgb '#1E88E5' dt 1 lw 3 pt 6 #(species 2)
set style line 3 lc rgb '#fcbdce' dt 1 lw 3 pt 6 #(species 3)
set style line 4 lc rgb '#004D40' dt 1 lw 3 pt 6 #(species 4)
set style line 5 lc rgb '#F5FF00' dt 1 lw 3 pt 6 #(species 5)
set style line 6 lc rgb '#D81B60' dt 2 lw 3 pt 6 #(empty space)
set style line 7 lc rgb '#1E88E5' dt 2 lw 3 pt 6 #(species 6)
set style line 8 lc rgb '#fcbdce' dt 2 lw 3 pt 6 #(species 7)
set style line 9 lc rgb '#004D40' dt 2 lw 3 pt 6 #(species 8)
set style line 10 lc rgb '#F5FF00' dt 2 lw 3  pt 6 #(species 9)
set style line 11 lc rgb 'black' pt 6 #(species 10)
set style line 13 lc rgb '#803777' lt 1 lw 4
set style line 14 lc rgb '#2f2999' lt 1 lw 4

	outname = sprintf("densities.tex")

	set out outname

set label 3 '$\sigma_i$' at 0.47,-0.03 font ", 16"
set yl'$\rho_i$' font ", 19" offset -3,0,0

set xtics 0,0.1,1
set xr[-0.05:1.3] 
set yr[0.0:0.24]
set ytics 0.04

set origin 0, 1.0
set size 1.437, 1.0
set key at 1.27,0.2 font ",14"

set arrow 1 from 0.2,-0.02 to 0,-0.02 linestyle 13
set arrow 2 from 0.8,-0.02 to 1,-0.02 linestyle 14

set label 1 'social distancing' at -0.035, -0.03 font ',12'
set label 2 'safeguard' at 0.81,-0.03 font ',12'

plot 	'statistics.dat' u 1:3:31 with errorbars ls 1 t'1h',\
	'statistics.dat' u 1:4:32 with errorbars ls 2 t'2h',\
	'statistics.dat' u 1:5:33 with errorbars ls 3 t'3h',\
	'statistics.dat' u 1:6:34 with errorbars ls 4 t'4h',\
	'statistics.dat' u 1:7:35 with errorbars ls 5 t'5h',\
	'statistics.dat' u 1:8:36 with errorbars ls 6 t'1i',\
	'statistics.dat' u 1:9:37 with errorbars ls 7 t'2i',\
	'statistics.dat' u 1:10:38 with errorbars ls 8 t'3i',\
	'statistics.dat' u 1:11:39 with errorbars ls 9 t'4i',\
	'statistics.dat' u 1:12:40 with errorbars ls 10 t'5i',\
	'statistics.dat' u 1:($2-$8-$9-$10-$11-$12):30 with errorbars ls 11 t'0',\
	'statistics.dat' u 1:($2-$8-$9-$10-$11-$12) with lp ls 11 notitle,\
	'statistics.dat' u 1:3 with lp ls 1 notitle,\
	'statistics.dat' u 1:4 with lp ls 2 notitle,\
	'statistics.dat' u 1:5 with lp ls 3 notitle,\
	'statistics.dat' u 1:6 with lp ls 4 notitle,\
	'statistics.dat' u 1:7 with lp ls 5 notitle,\
	'statistics.dat' u 1:8 with lp ls 6 notitle,\
	'statistics.dat' u 1:9 with lp ls 7 notitle,\
	'statistics.dat' u 1:10 with lp ls 8 notitle,\
	'statistics.dat' u 1:11 with lp ls 9 notitle,\
	'statistics.dat' u 1:12 with lp ls 10 notitle,\

### End multiplot
