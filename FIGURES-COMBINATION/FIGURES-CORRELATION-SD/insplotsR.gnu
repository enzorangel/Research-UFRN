#!/usr/bin/gnuplot

reset

Nx= 200
Ny= 200
Nf= 100
Ng= 4000

############## plot densities #################





set term tikz
#set term png size 640, 360 enhanced font 'Arial, 9'

set xtics font ", 15"
set ytics font ", 15"

set xl'$r$' font ", 24" offset 0,-1.25,0
set yl'$C_i$' font ", 24" offset -1.7,0,0

#set xl'$\Large \textit{r}$'
#set yl'$\Large C(\textit{r})$' offset -1.5,0,0

set xr[0:60]
set yr[-0.05:0.5]
set ytics 0.1

g(x)=0.15

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11
set tics nomirror


# color line definitions
set style line 1 lc rgb '#D81B60' dt 1 lw 2.5 pt 6 ps 2.0 #(species 1)
set style line 2 lc rgb '#1E88E5' dt 1 lw 2.5 pt 6 ps 2.0 #(species 2)
set style line 3 lc rgb '#fcbdce' dt 1 lw 2.5 pt 6 ps 2.0 #(species 3)
set style line 4 lc rgb '#004D40' dt 1 lw 2.5 pt 6 ps 2.0 #(species 4)
set style line 5 lc rgb '#F5FF00' dt 1 lw 2.5 pt 6 ps 2.0 #(species 5)
set style line 6 lc rgb '#999999' lt -1 lw 2.5 pt 6 ps 2.0  #(standard)
set style line 7 lc rgb '#4D148C' dt 1 lw 2.5 pt 6 ps 2.0 #(R1)
set style line 8 lc rgb '#FCBDCE' dt 1 lw 2.5 pt 6 ps 2.0 #(R2)
set style line 10 lc rgb '#1E88E5' dt 1 lw 2.5 pt 6 ps 2.0 #(R3)
set style line 11 lc rgb '#F5FF00' dt 1 lw 2.5 pt 6 ps 2.0 #(R4)
set style line 12 lc rgb '#FF6600' dt 1 lw 2.5 pt 6 ps 2.0 #(R5)
set style line 13 lc rgb 'black' dt 2 lw 2


	outname = sprintf("cp.tex")

	set out outname

set size 1.6, 1.3



set multiplot
#set object ellipse center .13, 0 size .4, 4
#set arrow from .1, 2.1 to screen .22, .4 front lt 3
#set samples 1000
#set grid
#set xtics .4
#set ytics 4

plot    'statisticsR3.dat' u 1:2:3 with yerrorbars ls 1 t'1',\
	'statisticsR3.dat' u 1:4:5 with yerrorbars ls 2 t'2',\
	'statisticsR3.dat' u 1:6:7 with yerrorbars ls 3 t'3',\
	'statisticsR3.dat' u 1:8:9 with yerrorbars ls 4 t'4',\
	'statisticsR3.dat' u 1:10:11 with yerrorbars ls 5 t'5',\
	'statistics-std.dat' u 1:2:3 with yerrorbars ls 6 t'std',\
	'statistics-std.dat' u 1:2 with lp ls 6 notitle,\
        'statisticsR3.dat' u 1:2 with lp ls 1 notitle,\
	'statisticsR3.dat' u 1:4 with lp ls 2 notitle,\
	'statisticsR3.dat' u 1:6 with lp ls 3 notitle,\
	'statisticsR3.dat' u 1:8 with lp ls 4 notitle,\
	'statisticsR3.dat' u 1:10 with lp ls 5 notitle,\
	0.15 ls 13 notitle
	
	
set origin 0.9, .75
set size .45,.45
clear
unset key
unset grid
unset object
unset arrow
set xtics 
set ytics 10
#set bmargin 1
#set tmargin 1
#set lmargin 3
#set rmargin 1

set xr[-0.5:5.5]
set yr[3:36]

set style line 9 lc rgb 'brown' lt -1 lw 2.5 pt 7 ps 1



set xl'$R$' font ", 16" offset 0,-1.25,0
set yl'$l_i$' font ", 16" offset -1.7,0,0

plot 'autocorrelation-sd.dat' u 1:2:3 with yerrorbars ls 1 t'l',\
     'autocorrelation-sd.dat' u 1:4:5 with yerrorbars ls 2 t'l',\
     'autocorrelation-sd.dat' u 1:6:7 with yerrorbars ls 3 t'l',\
     'autocorrelation-sd.dat' u 1:8:9 with yerrorbars ls 4 t'l',\
     'autocorrelation-sd.dat' u 1:10:11 with yerrorbars ls 5 t'l',\
     'autocorrelation-sd.dat' u 1:2 with lp ls 1 notitle,\
     'autocorrelation-sd.dat' u 1:4 with lp ls 2 notitle,\
     'autocorrelation-sd.dat' u 1:6 with lp ls 3 notitle,\
     'autocorrelation-sd.dat' u 1:8 with lp ls 4 notitle,\
     'autocorrelation-sd.dat' u 1:10 with lp ls 5 notitle
     
unset multiplot


#plot 'coexistence-probability.dat' u 1:2:3 with yerrorbars ls 9


