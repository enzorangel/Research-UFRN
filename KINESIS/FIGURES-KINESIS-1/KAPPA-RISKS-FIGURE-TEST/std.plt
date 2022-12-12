#!/usr/bin/gnuplot

reset

set term tikz
#set term png size 670,500

set xtics font ", 14"
set ytics font ", 14"

set xl't' font ", 16" offset 0,-1.25,0
set yl'$\rho_i$' font ", 19" offset -1.5,0,0

set xr[0:5000] 
set yr[0.0:0.6]

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11
#set tics nomirror

#set key bottom left Left reverse samplen 1 at -10,0.6

# define grid
#set style line 12 lc rgb '#2f4f4f' lt 0 lw 1
#set grid back ls 12

# color line definitions
set style line 1 lc rgb '#f43169' lt 1 lw 4.0 pt 5 ps 1.0 #  green      (species 1)
set style line 2 lc rgb '#f7d9d0' lt 1 lw 4.0 pt 5 ps 1.0 #  red	(species 2)
set style line 3 lc rgb '#0b0404' lt 1 lw 4.0 pt 5 ps 1.0 #  orange     (species 3)
set style line 4 lc rgb '#000066' lt 1 lw 4.0 pt 5 ps 1.0 #  dark blue  (species 4)
set style line 5 lc rgb '#FF9100' lt 1 lw 4.0 pt 5 ps 1.0 #  cyan	(species 5)
set style line 6 lc rgb 'grey' lt 1 lw 4.0 pt 5 ps 1.0 #  black	(empty space)

    


	outname = sprintf("std.tex")

	set out outname

set size 2.8, 2.0

################################# Start multiplot (2x2 layout) ##################


set label 2 'Standard' at graph 0.285, 0.85 font ',15'

#set key bottom right Right samplen 0 at 0.5, 0.5

set origin 0, 1.0
set size 1.0, 1.0

plot 'densities-std.dat' u 1:2 with lines ls 6 t '0',\
     'densities-std.dat' u 1:3 with lines ls 1 t '1',\
     'densities-std.dat' u 1:4 with lines ls 2 t '2',\
     'densities-std.dat' u 1:5 with lines ls 3 t '3'
	

### End multiplot


