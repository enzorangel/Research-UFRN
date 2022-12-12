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
set style line 1 lc rgb 'yellow' dt 1 lw 4.5 pt 6 ps 3.0 #(species 1)
set style line 2 lc rgb '#FFE200' dt 1 lw 4.5 pt 6 ps 3.0 #(species 2)
set style line 3 lc rgb '#4D1839' dt 1 lw 4.5 pt 6 ps 3.0 #(species 3)
set style line 4 lc rgb '#4D148C' dt 1 lw 4.5 pt 6 ps 3.0 #(species 4)
set style line 5 lc rgb 'green' dt 1 lw 4.5 pt 6 ps 3.0 #(species 5)
set style line 6 lc rgb '#74B72E' dt 1 lw 4.5 pt 6 ps 3.0 #(empty space)
set style line 7 lc rgb 'pink' dt 1 lw 4.5 pt 6 ps 3.0 #(species 6)
set style line 8 lc rgb '#FD3096' dt 1 lw 4.5 pt 6 ps 3.0 #(species 7)
set style line 9 lc rgb 'purple' dt 1 lw 4.5 pt 6 ps 3.0 #(species 8)
set style line 10 lc rgb '#999999' dt 1 lw 4.5 pt 6 ps 3.0 #(species 9)
set style line 11 lc rgb 'black' lw 3 pt 6 #(species 10)
set style line 13 lc rgb 'grey' lt 1 lw 4
set style line 14 lc rgb '#2f2999' lt 1 lw 4

	outname = sprintf("ir.tex")

	set out outname



set xl'$\nu$' font ", 28" offset 0,-1.25,0
#set yl'$\mathcal{I}(\%)$' font ", 28" offset -2,0,0
set yl'$\tilde{\chi}(\%)$' font ", 28" offset -2,0,0

set xtics 0,0.1,1
#set xr[-0.025:1.025]
#set yr[22:33]
#set ytics 1.5

set tics nomirror


set size 1.6, 1.0
set key at 0.25,-5 font ",14"

plot 	'statistics-m0p2.dat' u (1-$1):(($18-0.702282)*100/0.702282):($46*100) with errorbars ls 8 t'$m=0.2$',\
	'statistics-m0p4.dat' u (1-$1):(($18-0.448846)*100/0.448846):($46*100) with errorbars ls 6 t'$m=0.4$',\
	'statistics-m0p6.dat' u (1-$1):(($18-0.275241)*100/0.275241):($46*100) with errorbars ls 4 t'$m=0.6$',\
	'statistics-m0p8.dat' u (1-$1):(($18-0.132701)*100/0.132701):($46*100) with errorbars ls 2 t'$m=0.8$',\
	'statistics-m0p2.dat' u (1-$1):(($18-0.702282)*100/0.702282) with lp ls 8 notitle,\
	'statistics-m0p4.dat' u (1-$1):(($18-0.448846)*100/0.448846) with lp ls 6 notitle,\
	'statistics-m0p6.dat' u (1-$1):(($18-0.275241)*100/0.275241) with lp ls 4 notitle,\
	'statistics-m0p8.dat' u (1-$1):(($18-0.132701)*100/0.132701) with lp ls 2 notitle,\
	0 ls 13 notitle


### End multiplot
