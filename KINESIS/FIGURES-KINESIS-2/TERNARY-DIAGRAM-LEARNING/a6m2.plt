#!/usr/bin/gnuplot

reset

set term tikz
#set term png size 670,500
	outname = sprintf("a6m2.tex")
	set out outname
	

	
########## Start multiplot (2x2) ##########	
	
	
##### Graph A #####

set size 1.6, 1.3

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
set label '$\rho_2$' at 0.12, 0.0636 center tc '#a3b6c9'
set label '$\rho_3$' at 0.88, 0.0636 center tc '#0b0404'
set label '$\rho_1$' at 0.5, 0.723 center tc '#1E2EDE'

set object 1 polygon from 0.15,0.0866 to 0.5,0.693 to 0.85,0.0866 to 0.15,0.0866
set object 1 back fc rgb "#e8e8e8" fillstyle solid 1.0 noborder

set style line 1 lc rgb '#0b0404' lt 0 lw 1.5 pt 6 #  green      (species 1)
set style line 2 lc rgb '#1E2EDE' lt 0 lw 1.5 pt 6 #  red	     (species 2)
set style line 3 lc rgb '#a3b6c9' lt 0 lw 1.5 pt 6 #  orange     (species 3)
set style line 4 lc rgb 'orange' lt 0 lw 1.5 pt 6 #  dark blue  (species 4)
set style line 5 lc rgb 'grey' lt 0 lw 1.5 pt 6 #  cyan	     (species 5)
set style line 6 lc rgb '#03c04a' lt 3 lw 1.5 pt 2 #  grey	     (empty space)
set style line 8 lc rgb '#496e37' lt 1 lw 3 pt 2 #  kappa-2-radius-2 013220
set style line 9 lc rgb '#ff5d05' lt 1 lw 3 pt 2 #  kappa-4-radius-2
set style line 10 lc rgb 'pink' lt 2 lw 3 pt 2 # kappa-2-radius-4
set style line 11 lc rgb 'gray' lt 1 lw 3 pt 2 # standard
set style line 12 lc rgb 'brown' lt 2 lw 3 pt 2 # kappa-4-radius-4

# x

set arrow 2 from 0.15,0.0866 to 0.5, 0.693 nohead linestyle 1
set arrow 3 from 0.25,0.0866 to 0.55, 0.606 nohead linestyle 1
set arrow 4 from 0.35,0.0866 to 0.6, 0.520 nohead linestyle 1
set arrow 5 from 0.45,0.0866 to 0.65, 0.433 nohead linestyle 1
set arrow 6 from 0.55,0.0866 to 0.7, 0.346 nohead linestyle 1
set arrow 7 from 0.65,0.0866 to 0.75, 0.260 nohead linestyle 1
set arrow 8 from 0.75,0.0866 to 0.8, 0.173 nohead linestyle 1

# Numeros x

set label '0.25' at 0.25, 0.0536 center tc rgb "#0b0404"
set label '0.35' at 0.35, 0.0536 center tc rgb "#0b0404"
set label '0.45' at 0.45, 0.0536 center tc rgb "#0b0404"
set label '0.55' at 0.55, 0.0536 center tc rgb "#0b0404"
set label '0.65' at 0.65, 0.0536 center tc rgb "#0b0404"
set label '0.75' at 0.75, 0.0536 center tc rgb "#0b0404"

# z

set arrow 12 from 0.85, 0.0866 to 0.15, 0.0866 nohead linestyle 2
set arrow 13 from 0.80, 0.173 to 0.20, 0.173 nohead linestyle 2
set arrow 14 from 0.75, 0.260 to 0.25, 0.260 nohead linestyle 2
set arrow 15 from 0.7, 0.346 to 0.30, 0.346 nohead linestyle 2
set arrow 16 from 0.65, 0.433 to 0.35, 0.433 nohead linestyle 2
set arrow 17 from 0.6, 0.520 to 0.40, 0.520 nohead linestyle 2
set arrow 18 from 0.55, 0.606 to 0.45, 0.606 nohead linestyle 2
set arrow 19 from 0.5, 0.693 to 0.50, 0.693 nohead linestyle 2

# Numeros z

set label '0.25' at 0.85, 0.173 center tc rgb "#1E2EDE"
set label '0.35' at 0.8, 0.260 center tc rgb "#1E2EDE"
set label '0.45' at 0.75, 0.346 center tc rgb "#1E2EDE"
set label '0.55' at 0.7, 0.433 center tc rgb "#1E2EDE"
set label '0.65' at 0.65, 0.520 center tc rgb "#1E2EDE"
set label '0.75' at 0.6, 0.606 center tc rgb "#1E2EDE"
# y

set arrow 24 from 0.2, 0.173 to 0.25,0.0866 nohead linestyle 3
set arrow 25 from 0.25, 0.260 to 0.35,0.0866 nohead linestyle 3
set arrow 26 from 0.3, 0.346 to 0.45,0.0866 nohead linestyle 3
set arrow 27 from 0.35, 0.433 to 0.55,0.0866 nohead linestyle 3
set arrow 28 from 0.4, 0.520 to 0.65,0.0866 nohead linestyle 3
set arrow 29 from 0.45, 0.606 to 0.75,0.0866 nohead linestyle 3
set arrow 30 from 0.5, 0.693 to 0.85,0.0866 nohead linestyle 3

# Numeros y


set label '0.25' at 0.4, 0.606 center tc rgb "#a3b6c9"
set label '0.35' at 0.35, 0.520 center tc rgb "#a3b6c9"
set label '0.45' at 0.3, 0.433 center tc rgb "#a3b6c9"
set label '0.55' at 0.25, 0.346 center tc rgb "#a3b6c9"
set label '0.65' at 0.2, 0.260 center tc rgb "#a3b6c9"
set label '0.75' at 0.15, 0.173 center tc rgb "#a3b6c9"

#set key inside right center Left
set key font ",12"

#set key top left Right samplen 2 at 0.25, 0.57



plot "<awk '{print ($3+2*$5)/(2*($3+$4+$5)), sqrt(3)*$3/(2*($3+$4+$5))}' densitiesa6m2.dat" t '$\alpha$=0.6' with lines ls 9,\
     "<awk '{print ($3+2*$5)/(2*($3+$4+$5)), sqrt(3)*$3/(2*($3+$4+$5))}' densitiesk2r2-0.2.dat" t '$\alpha$=1.0' with lines ls 8 
            

