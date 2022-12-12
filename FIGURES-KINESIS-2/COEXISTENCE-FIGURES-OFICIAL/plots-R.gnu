#!/usr/bin/gnuplot

reset

Nx= 200
Ny= 200
Nf= 100
Ng= 4000

############## plot densities #################

set term tikz
#set term png size 640, 360 enhanced font 'Arial, 9'

set xl'\textit{m}' font ",32" offset 0,-1.0,0
set yl'Coexistence Probability' font ",22" offset -1.5,0,0

#set xr[0:1]
#set yr[0.15:0.3]

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11
#set tics nomirror


# color line definitions
set style line 1 lc rgb '#949494' lt 0 lw 4.5 pt 7 ps 1
set style line 2 lc rgb '#3399ff' lt 0 lw 4.5 pt 7 ps 1
set style line 3 lc rgb 'green' lt -1 lw 2.5 pt 7 ps 1
set style line 4 lc rgb '#FFE900' lt 0 lw 4.5 pt 7 ps 1
set style line 5 lc rgb '#028a0f' lt 0 lw 4.5 pt 7 ps 1
set style line 6 lc rgb '#fc4c4e' lt 0 lw 4.5 pt 7 ps 1
set style line 7 lc rgb '#3399ff' lt -1 lw 2.5 pt 7 ps 1
set style line 8 lc rgb '#ff3333' lt 0 lw 2.5 pt 7 ps 1


	outname = sprintf("cpr.tex")

	set out outname
	
set size 3.0, 2.0	

########## Start multiplot (2x2) ##########     

set origin 0.105, 0.147 
set size 1.6, 1.0

set arrow from 0.28,0 to 0.28,1 nohead lt 0 lw 2 lc rgb 'black'
set arrow from 0.6,0 to 0.6,1 nohead lt 0 lw 2 lc rgb 'black'

set object 1 rect from graph 0, graph 0 to graph 0.28, graph 1 back
set object 1 rect fc rgb "#e8e8e8" fillstyle solid 1.0

set object 2 rect from graph 0.28, graph 0 to graph 0.6, graph 1 back
set object 2 rect fc rgb "#f7f7f7" fillstyle solid 1.0

set object 3 rect from graph 0.6, graph 0 to graph 1, graph 1 back
set object 3 rect fc rgb "white" fillstyle solid 1.0



plot 'statistics-std.dat' u 1:2 with lp ls 1 t'std',\
      'statistics-r1.dat' u 1:2 with lp ls 2 t'R=1',\
      'statistics-r2.dat' u 1:2 with lp ls 6 t'R=2',\
      'statistics-r3.dat' u 1:2 with lp ls 4 t'R=3',\
      'statistics-r4.dat' u 1:2 with lp ls 5 t'R=4'
           

