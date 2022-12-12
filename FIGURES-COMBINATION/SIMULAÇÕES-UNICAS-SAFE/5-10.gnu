#!/usr/bin/gnuplot

reset

set term tikz


#set xl'\large \textit {t\,(generations)}' font ",90"
#set yl'\Large $\rho_i$' font ",20" offset -1.5,0,0

set xl'$t\,(generations)$' font ",20" offset 0,-1.5,0
set yl'$\rho_i$'  font ",20" offset -3.0,0,0


#set label '\bf{Standard}' at 2200, 0.4

#set xtics font ",30"
#set ytics font ",30"

#set xr[0:5500] 
set yr[0.0:0.4]

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
#set border 3 back ls 11
set tics nomirror

set key bottom left Left reverse samplen 1 at 4000,0.7

# define grid
set style line 12 lc rgb '#2f4f4f' lt 0 lw 1
#set grid back ls 12

# color line definitions

set style line 1 lc rgb '#D81B60' lt 1 lw 3.0 pt 6 #  green      (species 1)
set style line 2 lc rgb '#1E88E5' lt 1 lw 3.0 pt 6 #  red	     (species 2)
set style line 3 lc rgb '#fcbdce' lt 1 lw 3.0 pt 6 #  orange     (species 3)
set style line 4 lc rgb '#004D40' lt 1 lw 3.0 pt 6 #  dark blue  (species 4)
set style line 5 lc rgb '#F5FF00' lt 1 lw 3.0 pt 6 #  cyan	     (species 5)

set style line 6 lc rgb '#D81B60' dt 2 lt 0 lw 3.0 pt 6 #  green      (species 1)
set style line 7 lc rgb '#1E88E5' dt 2 lt 0 lw 3.0 pt 6 #  red	     (species 2)
set style line 8 lc rgb '#fcbdce' dt 2 lt 0 lw 3.0 pt 6 #  orange     (species 3)
set style line 9 lc rgb '#004D40' dt 2 lt 0 lw 3.0 pt 6 #  dark blue  (species 4)
set style line 10 lc rgb '#F5FF00' dt 2 lt 0 lw 3.0 pt 6 #  cyan	     (species 5)

set style line 11 lc rgb '#999999' lt 1 lw 3.0 pt 6 #  grey	     (empty space)

set key at 4450,0.25

	outname = sprintf("510.tex")

	set out outname

set size 1.4, 1.2

plot 'den-5-10.dat' u 1:($2-$7) with lines ls 1 t '$h_1$',\
     'den-5-10.dat' u 1:($3-$8) with lines ls 2 t '$h_2$',\
     'den-5-10.dat' u 1:($4-$9) with lines ls 3 t '$h_3$',\
	'den-5-10.dat' u 1:($5-$10) with lines ls 4 t '$h_4$',\
     'den-5-10.dat' u 1:($6-$11) with lines ls 5 t '$h_5$',\
    'den-5-10.dat' u 1:7 with lines ls 6 t '$s_1$',\
	'den-5-10.dat' u 1:8 with lines ls 7 t '$s_2$',\
     'den-5-10.dat' u 1:9 with lines ls 8 t '$s_3$',\
	'den-5-10.dat' u 1:10 with lines ls 9 t '$s_4$',\
     'den-5-10.dat' u 1:11 with lines ls 10 t '$s_5$'
   #   'den-5-10.dat' u 1:12 with lines ls 11 t '$0$'
	

