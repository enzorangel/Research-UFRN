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
set style line 1 lc rgb '#DC143C' pt 6 ps 0.1 lw 2 #(species 1)
set style line 2 lc rgb '#0000CD' pt 6 ps 0.1 lw 2 #(species 2)
set style line 3 lc rgb '#228B22' pt 6 ps 0.1 lw 2 #(species 3)
set style line 4 lc rgb '#9932cc' pt 6 ps 0.1 lw 2 #(species 4)
set style line 5 lc rgb '#FFA500' pt 6 ps 0.1 lw 2 #(species 5)
set style line 6 lc rgb '#F08080' pt 6 #(empty space)
set style line 7 lc rgb '#AFEEEE' pt 6 #(species 6)
set style line 8 lc rgb '#98FB98' pt 6 #(species 7)
set style line 9 lc rgb '#DDA0DD' pt 6 #(species 8)
set style line 10 lc rgb '#EEE8AA' pt 6 #(species 9)
set style line 11 lc rgb 'black' pt 6 ps 0.1 lw 2 #(species 10)
set style line 13 lc rgb '#803777' lt 1 lw 4
set style line 14 lc rgb '#2f2999' lt 1 lw 4

	outname = sprintf("d5.tex")

	set out outname

set xl'$generations$' font ", 16" offset 0,-1.25,0
set yl'$\rho_i$' font ", 19" offset -3,0,0

#set xtics 0,0.1,1
set xr[0:1500] 
#set yr[0.0:0.6]

#set key at 1.27,0.24 font ",14"

plot 	'densities.dat' u 1:12 with lp ls 11 t'0',\
	'densities.dat' u 1:($2+$7) with lp ls 1 t'1',\
	'densities.dat' u 1:($3+$8) with lp ls 2 t'2',\
	'densities.dat' u 1:($4+$9) with lp ls 3 t'3',\
	'densities.dat' u 1:($5+$10) with lp ls 4 t'4',\
	'densities.dat' u 1:($6+$11) with lp ls 5 t'5',\

### End multiplot
