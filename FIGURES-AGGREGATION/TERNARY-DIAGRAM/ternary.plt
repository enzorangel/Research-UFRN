#!/usr/bin/gnuplot

reset

set term tikz
#set term png size 670,500
	outname = sprintf("s14.tex")
	set out outname
set size 1.4, 1.0
set bmargin 1
set lmargin 1
set rmargin 1
set tmargin 1
set size ratio 0.866
set yrange [0:0.866]
set xrange [0:1]
set noborder
set noxtics
set noytics
set label '$\rho_2$' at 0.27, 0.153 center tc '#FF6600'
set label '$\rho_3$' at 0.73, 0.153 center tc '#d1d1d1'
set label '$\rho_1$' at 0.5, 0.556 center tc '#4D148C'

#set object 1 polygon from 0,0 to 0.5,0.866 to 1,0 to 0,0
#set object 1 back fc rgb "white" fillstyle solid 1.0 border lt -1

set style line 1 lc rgb '#d1d1d1' lt 0 lw 1.5 pt 6 #  green      (species 1)
set style line 2 lc rgb '#4D148C' lt 0 lw 1.5 pt 6 #  red	     (species 2)
set style line 3 lc rgb '#FF6600' lt 0 lw 1.5 pt 6 #  orange     (species 3)
set style line 4 lc rgb 'orange' lt 0 lw 1.5 pt 6 #  dark blue  (species 4)
set style line 5 lc rgb 'grey' lt 0 lw 1.5 pt 6 #  cyan	     (species 5)
set style line 6 lc rgb '#03c04a' lt 3 lw 1.5 pt 2 #  grey	     (empty space)
set style line 8 lc rgb '#013220' lt 1 lw 3 pt 2 #  kappa-2-radius-2
set style line 9 lc rgb '#00FF00' lt 1 lw 3 pt 2 #  kappa-4-radius-2
set style line 10 lc rgb 'pink' lt 2 lw 3 pt 2 # kappa-2-radius-4
set style line 11 lc rgb 'gray' lt 1 lw 3 pt 2 # standard
set style line 12 lc rgb 'brown' lt 2 lw 3 pt 2 # kappa-4-radius-4

# x
set arrow 1 from 0.3,0.173 to 0.7, 0.173 nohead linestyle 1
set arrow 4 from 0.4,0.173 to 0.55, 0.433 nohead linestyle 1
set arrow 5 from 0.5,0.173 to 0.6, 0.346 nohead linestyle 1
set arrow 6 from 0.6,0.173 to 0.65, 0.260 nohead linestyle 1

# Numeros x

set label '0.4' at 0.4, 0.143 center tc rgb "#d1d1d1"
set label '0.5' at 0.5, 0.143 center tc rgb "#d1d1d1"
set label '0.6' at 0.6, 0.143 center tc rgb "#d1d1d1"

# z

set arrow 12 from 0.70, 0.173 to 0.5, 0.520 nohead linestyle 2
set arrow 14 from 0.65, 0.260 to 0.35, 0.260 nohead linestyle 2
set arrow 15 from 0.60, 0.346 to 0.40, 0.346 nohead linestyle 2
set arrow 16 from 0.55, 0.433 to 0.45, 0.433 nohead linestyle 2


# Numeros z

set label '0.4' at 0.69, 0.260 center tc rgb "#4D148C"
set label '0.5' at 0.64, 0.346 center tc rgb "#4D148C"
set label '0.6' at 0.59, 0.433 center tc rgb "#4D148C"

# y
set arrow 21 from 0.50, 0.520 to 0.3,0.173 nohead linestyle 3
set arrow 26 from 0.35, 0.260 to 0.4,0.173 nohead linestyle 3
set arrow 27 from 0.40, 0.346 to 0.5,0.173 nohead linestyle 3
set arrow 28 from 0.45, 0.433 to 0.6,0.173 nohead linestyle 3

# Numeros y

set label '0.4' at 0.41, 0.433 center tc rgb "#FF6600"
set label '0.5' at 0.36, 0.346 center tc rgb "#FF6600"
set label '0.6' at 0.31, 0.260 center tc rgb "#FF6600"

#set key inside right center Left
set key font ",5"

set key at 0.85, 0.570



plot "<awk '{print ($2+2*$4)/(2*($2+$3+$4)), sqrt(3)*$2/(2*($2+$3+$4))}' densitiesr1.dat" t 'r=1' with lines ls 9,\
     "<awk '{print ($2+2*$4)/(2*($2+$3+$4)), sqrt(3)*$2/(2*($2+$3+$4))}' densitiesr3.dat" t 'r=3' with lines ls 12,\
     "<awk '{print ($2+2*$4)/(2*($2+$3+$4)), sqrt(3)*$2/(2*($2+$3+$4))}' densitiesr5.dat" t 'r=5' with lines ls 8,\
     "<awk '{print ($2+2*$4)/(2*($2+$3+$4)), sqrt(3)*$2/(2*($2+$3+$4))}' densitiesr7.dat" t 'r=7' with lines ls 10         

