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

set xl'$r$' font ", 32" offset 0,-1.25,0
set yl'$C_i$' font ", 32" offset -1.7,0,0

#set xl'$\Large \textit{r}$'
#set yl'$\Large C(\textit{r})$' offset -1.5,0,0

set xr[0:60]
set yr[-0.05:0.6]

g(x)=0.15

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11
set tics nomirror


# color line definitions
set style line 1 lc rgb '#1E2EDE' dt 1 lw 3.5 pt 7 ps 1.0 #(species 1)
set style line 2 lc rgb '#cfe4fa' dt 1 lw 3.5 pt 7 ps 1.0 #(species 2)
set style line 3 lc rgb '#0b0404' dt 1 lw 3.5 pt 7 ps 1.0 #(species 3)
set style line 4 lc rgb '#004D40' dt 1 lw 2.5 pt 6 ps 2.0 #(species 4)
set style line 5 lc rgb '#F5FF00' dt 1 lw 2.5 pt 6 ps 2.0 #(species 5)
set style line 6 lc rgb '#999999' lt -1 lw 2.5 pt 6 ps 2.0  #(standard)
set style line 7 lc rgb '#4D148C' dt 1 lw 2.5 pt 6 ps 2.0 #(R1)
set style line 8 lc rgb '#FCBDCE' dt 1 lw 2.5 pt 6 ps 2.0 #(R2)
set style line 10 lc rgb '#1E88E5' dt 1 lw 2.5 pt 6 ps 2.0 #(R3)
set style line 11 lc rgb '#F5FF00' dt 1 lw 2.5 pt 6 ps 2.0 #(R4)
set style line 12 lc rgb '#FF6600' dt 1 lw 2.5 pt 6 ps 2.0 #(R5)
set style line 13 lc rgb 'black' dt 2 lw 2


	outname = sprintf("cpa.tex")

	set out outname

set size 1.6, 1.0



set multiplot
#set object ellipse center .13, 0 size .4, 4
#set arrow from .1, 2.1 to screen .22, .4 front lt 3
#set samples 1000
#set grid
#set xtics .4
#set ytics 4

set label 10 '$\alpha = 0.6$' at graph 0.25,0.75 font ",20"

plot    'statistics.dat' u 1:2:3 with yerrorbars ls 1 t'1',\
	'statistics.dat' u 1:4:5 with yerrorbars ls 2 t'2',\
	'statistics.dat' u 1:6:7 with yerrorbars ls 3 t'3',\
        'statistics.dat' u 1:2 with lp ls 1 notitle,\
	'statistics.dat' u 1:4 with lp ls 2 notitle,\
	'statistics.dat' u 1:6 with lp ls 3 notitle,\
	0.15 ls 13 notitle
	
	
set origin 0.9, .5
set size .45,.45
clear
unset key
unset grid
unset object
unset arrow
unset label
set xtics 
set ytics 10
#set bmargin 1
#set tmargin 1
#set lmargin 3
#set rmargin 1

set xtics 0,0.5,1
set xr[-0.25:1.25]
set yr[18:30]
set ytics 3

set style line 9 lc rgb 'brown' lt -1 lw 2.5 pt 7 ps 1



set xl'$\alpha$' font ", 24" offset 0,-0.5,0
set yl'$l_i$' font ", 24" offset -1.7,0,0

plot 'inset.dat' u 1:2 with lp ls 1 t'l',\
     'inset.dat' u 1:4 with lp ls 2 t'l',\
     'inset.dat' u 1:6 with lp ls 3 t'l'
     
unset multiplot


#plot 'coexistence-probability.dat' u 1:2:3 with yerrorbars ls 9


