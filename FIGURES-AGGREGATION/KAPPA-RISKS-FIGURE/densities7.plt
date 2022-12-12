#!/usr/bin/gnuplot

reset

set term tikz
#set term png size 670,500

set xtics font ", 14"
set ytics font ", 14"

set xl't\,(generations)' font ", 16" offset 0,-1.25,0
set yl'$\rho_i$' font ", 19" offset -1.5,0,0

set xr[0:1000] 
set yr[0.3:0.37]
#set ytics 0.02

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11
#set tics nomirror

#set key bottom left Left reverse samplen 1 at -10,0.6

# define grid
#set style line 12 lc rgb '#2f4f4f' lt 0 lw 1
#set grid back ls 12

# color line definitions
set style line 1 lc rgb '#4D148C' lt 1 lw 4.0 pt 5 ps 1.0 #  green      (species 1)
set style line 2 lc rgb '#FF6600' lt 1 lw 4.0 pt 5 ps 1.0 #  red	(species 2)
set style line 3 lc rgb '#c0c0c0' lt 1 lw 4.0 pt 5 ps 1.0 #  orange     (species 3)
set style line 4 lc rgb '#000066' lt 1 lw 4.0 pt 5 ps 1.0 #  dark blue  (species 4)
set style line 5 lc rgb '#FF9100' lt 1 lw 4.0 pt 5 ps 1.0 #  cyan	(species 5)
set style line 6 lc rgb 'grey' lt 1 lw 4.0 pt 5 ps 1.0 #  black	(empty space)

    


	outname = sprintf("d7.tex")

	set out outname

set label '$R$ = 7.0' at graph 0.385, 0.85 font ',15'

#set key bottom right Right samplen 0 at 0.5, 0.5

set size 1.0, 1.0

plot  'densities7.dat' u 1:2 with lines ls 1 t '1',\
      'densities7.dat' u 1:3 with lines ls 2 t '2',\
      'densities7.dat' u 1:4 with lines ls 3 t '3'

### End multiplot


