#!/usr/bin/gnuplot

reset

set term tikz
#set term png size 670,500

set xtics font ", 14"
set ytics font ", 14"

set xl't\,(generations)' font ", 16" offset 0,-1.25,0
set yl'$\zeta_i\,(\%)$' font ", 19" offset -1.5,0,0

set xr[0:3000] 
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
set style line 1 lc rgb '#4D148C' lt 1 lw 4.0 pt 5 ps 1.0 #  green      (species 1)
set style line 2 lc rgb '#FF6600' lt 1 lw 4.0 pt 5 ps 1.0 #  red	(species 2)
set style line 3 lc rgb '#E5E5E5' lt 1 lw 4.0 pt 5 ps 1.0 #  orange     (species 3)
set style line 4 lc rgb '#000066' lt 1 lw 4.0 pt 5 ps 1.0 #  dark blue  (species 4)
set style line 5 lc rgb '#FF9100' lt 1 lw 4.0 pt 5 ps 1.0 #  cyan	(species 5)
set style line 6 lc rgb 'black' lt 1 lw 4.0 pt 5 ps 1.0 #  black	(empty space)

    
	outname = sprintf("risk.tex")

	set out outname

set size 2.8, 2.0

################################# Start multiplot (2x2 layout) ##################

set multiplot layout 2,2 rowsfirst

### GRAPH a #####

set label 1 '\bf{a}' at graph 0.025, 0.85 font ',25'

set label 2 '$R$ = 1.0' at graph 0.385, 0.85 font ',15'

#set key bottom right Right samplen 0 at 0.5, 0.5

set origin 0, 1.0
set size 1.0, 1.0

plot  'densitiesr1.dat' u 1:5 with lines ls 1 t '1',\
      'densitiesr1.dat' u 1:6 with lines ls 2 t '2',\
      'densitiesr1.dat' u 1:7 with lines ls 3 t '3'
	
		
### GRAPH b ####

set label 1 '\bf{b}' at graph 0.025, 0.85 font ',25'

set label 2 '$R$ = 3.0' at graph 0.35, 0.85 font ',15'


set origin 1.0, 1.0
set size 1.0, 1.0

plot  'densitiesr3.dat' u 1:5 with lines ls 1 t '1',\
      'densitiesr3.dat' u 1:6 with lines ls 2 t '2',\
      'densitiesr3.dat' u 1:7 with lines ls 3 t '3'


### GRAPH c ###


set label 1 '\bf{c}' at graph 0.025, 0.85 font ',25'

set label 2 '$R$ = 5.0' at graph 0.35, 0.85 font ',15'


set origin 0, 0.0
set size 1.0, 1.0

plot  'densitiesr5.dat' u 1:5 with lines ls 1 t '1',\
      'densitiesr5.dat' u 1:6 with lines ls 2 t '2',\
      'densitiesr5.dat' u 1:7 with lines ls 3 t '3'

### GRAPH D ###

set label 1 '\bf{d}' at graph 0.025, 0.85 font ',25'
set label 2 '$R$ = 7.0' at graph 0.35, 0.85 font ',15'

set origin 1.0, 0.0
set size 1.0, 1.0

plot  'densitiesr7.dat' u 1:5 with lines ls 1 t '1',\
      'densitiesr7.dat' u 1:6 with lines ls 2 t '2',\
      'densitiesr7.dat' u 1:7 with lines ls 3 t '3'

unset multiplot

### End multiplot


