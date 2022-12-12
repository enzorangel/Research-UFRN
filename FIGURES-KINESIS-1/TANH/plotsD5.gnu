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
set tics nomirror

#set key bottom left Left reverse samplen 1 at -10,0.6

# define grid
#set style line 12 lc rgb '#ffffff' lt 0 lw 1
#set grid back ls 12

# color line definitions
set style line 1 lc rgb '#999999' dt 1 lw 4.5 pt 6 ps 3.0 #(species 1)
set style line 2 lc rgb '#1E88E5' dt 1 lw 4.5 pt 6 ps 3.0 #(species 2)
set style line 3 lc rgb '#F5FF00' dt 1 lw 4.5 pt 6 ps 3.0 #(species 3)
set style line 4 lc rgb '#FF6600' dt 1 lw 4.5 pt 6 ps 3.0 #(species 4)
set style line 5 lc rgb '#4D148C' dt 1 lw 4.5 pt 6 ps 3.0 #(species 5)
set style line 6 lc rgb '#004D40' dt 1 lw 4.5 pt 6 #(empty space)
set style line 7 lc rgb 'brown' dt 1 lw 4.5 pt 6 #(species 6)
set style line 8 lc rgb '#fcbdce' dt 2 lw 4.5 pt 6 #(species 7)
set style line 9 lc rgb '#black' dt 1 lw 4.5 pt 6 #(species 8)
set style line 10 lc rgb '#999999' dt 1 lw 4.5 pt 6 ps 3.0 #(species 9)
set style line 13 lc rgb '#803777' lt 1 lw 7
set style line 14 lc rgb '#2f2999' lt 1 lw 7

	outname = sprintf("d5.tex")

	set out outname

set xl'$\mathcal{A}$' font ", 28" offset 0,-1.0,0
set yl'$m_1$' font ", 28" offset -2,0,0

set arrow 1 from -0.55, -0.115 to -1,-0.115 linestyle 13
set arrow 2 from 0.55, -0.115 to 1,-0.115 linestyle 14

set arrow 3 from 0,0 to 0,0.8 nohead linestyle 9

set label 1 'Repellent' at -0.92, -0.09 font ',16'
set label 2 'Attractant' at 0.62,-0.09 font ',16'

set xtics -1.0,0.25,1
set xr[-1.0:1.0] 
set yr[0.0:0.8]
#set ytics 0.02

g(x)=0.1718033

set object 1 rect from graph 0, graph 0 to graph 0.5, graph 1 back
set object 1 rect fc rgb "#e8e8e8" fillstyle solid 1.0

set object 2 rect from graph 0.5, graph 0 to graph 1, graph 1 back
set object 2 rect fc rgb "#f7f7f7" fillstyle solid 1.0


set size 1.6, 1.3
set key at 0.98,0.78 font ",14"

plot 	0.4*(1+tanh(-0*x)) ls 1 t'$\epsilon = 0.0$',\
	0.4*(1+tanh(-0.5*x)) ls 7 t'$\epsilon = 0.5$',\
	0.4*(1+tanh(-1*x)) ls 2 t'$\epsilon = 1.0$',\
	0.4*(1+tanh(-1.5*x)) ls 6 t'$\epsilon = 1.5$',\
	0.4*(1+tanh(-2*x)) ls 3 t'$\epsilon = 2.0$',\
	0.4*(1+tanh(-3*x)) ls 4 t'$\epsilon = 3.0$',\
	0.4*(1+tanh(-4*x)) ls 5 t'$\epsilon = 4.0$'
	

### End multiplot
