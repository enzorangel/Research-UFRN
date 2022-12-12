#!/usr/bin/gnuplot

reset

set term tikz
#set term png size 670,500

#set xtics font ", 14"
#set ytics font ", 14"

#set xl't\,(generations)' font ", 16" offset 0,-1.25,0
#set yl'$\zeta_i\,(\%)$' font ", 19" offset -1.5,0,0

#set xr[0:5000] 
#set yr[0.5:8]


# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11
#set tics nomirror

#set key bottom left Left reverse samplen 1 at -10,0.6

# define grid
#set style line 12 lc rgb '#2f4f4f' lt 0 lw 1
#set grid back ls 12

# color line definitions
set style line 1 lc rgb '#D81B60' dt 1 lw 4.5 pt 6 ps 3.0 #(species 1)
set style line 2 lc rgb '#1E88E5' dt 1 lw 4.5 pt 6 ps 3.0 #(species 2)
set style line 3 lc rgb '#fcbdce' dt 1 lw 4.5 pt 6 ps 3.0 #(species 3)
set style line 4 lc rgb '#004D40' dt 1 lw 4.5 pt 6 ps 3.0 #(species 4)
set style line 5 lc rgb '#F5FF00' dt 1 lw 4.5 pt 6 ps 3.0 #(species 5)
set style line 6 lc rgb 'black' lt 1 lw 4.0 pt 5 ps 1.0 #  black	(empty space)

    
	outname = sprintf("risk.tex")

	set out outname

set size 2.8, 2.0

################################# Start multiplot (2x2 layout) ##################

set multiplot layout 2,2 rowsfirst

### GRAPH a #####

#set key bottom right Right samplen 0 at 0.5, 0.5

set origin 0, 1.0
set xl '$\varepsilon$' font ", 28" offset 0,-1.25,0
set yl'$\nu_1(\%)$' font ", 28" offset -2,0,0

set xtics 0,0.1,1
set xr[-0.05:1.05] 
#set yr[0.279:0.3055]
#set ytics 0.004
set tics nomirror

set size 1.6, 1.0
set key at 1,0.06 font ",14"

plot 	'statistics-mort-plus.dat' u 1:((($23-0.0788218)/0.0788218)*100):51 with errorbars ls 1 notitle,\
	'statistics-mort-plus.dat' u 1:((($23-0.0788218)/0.0788218)*100) with lp ls 1 notitle,\
	
		
### GRAPH b ####

set origin 1.7, 1.0
set xl'$\varepsilon$' font ", 28" offset 0,-1.25,0
set yl'$\chi_1(\%)$' font ", 28" offset -2,0,0


set xtics 0,0.1,1
set xr[-0.05:1.05] 
#set yr[0.485:0.514]
#set ytics 0.005
set tics nomirror

set size 1.6, 1.0
set key at 1,0.015 font ",14"

plot 	'statistics-mort-plus.dat' u 1:((($18-0.126559)/0.126559)*100):46 with errorbars ls 1 notitle,\
	'statistics-mort-plus.dat' u 1:((($18-0.126559)/0.126559)*100) with lp ls 1 notitle,\


### GRAPH c ###

set origin 3.4, 1.0
set xl'$\varepsilon$' font ", 28" offset 0,-1.25,0
set yl'$\zeta_1(\%)$' font ", 28" offset -2,0,0

set xtics 0,0.1,1
set xr[-0.05:1.05] 
#set yr[0.035:0.093]
#set ytics 0.01

set size 1.6, 1.0
set key at 1,0.25 font ",14"
set tics nomirror

plot 	'statistics-mort-plus.dat' u 1:((($13-0.0168204)/0.0168204)*100):41 with errorbars ls 1 notitle,\
	'statistics-mort-plus.dat' u 1:((($13-0.0168204)/0.0168204)*100) with lp ls 1 notitle,\


unset multiplot

### End multiplot


