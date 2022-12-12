#!/usr/bin/gnuplot

reset

Nx= 500
Ny= 500
Nf= 250
Ng= 5000

############## plot selection_risks #################

set term png size 560,370 crop enhanced font 'Verdana, 9'

set xl'time'
set yl'densities'

set xr[0:Ng]
#set yr[0.075:0.425]

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
set border 3 back ls 11
set tics nomirror

# define grid
set style line 12 lc rgb '#2f4f4f' lt 0 lw 1
set grid back ls 12

# color line definitions
set style line 1 lc rgb '#DC143C' pt 6 #  green      (species 1)
set style line 2 lc rgb '#0000CD' pt 6 #  red	     		(species 2)
set style line 3 lc rgb '#228B22' pt 6 #  orange     (species 3)
set style line 4 lc rgb '#9932cc' pt 6 #  dark blue  (species 4)
set style line 5 lc rgb '#FFA500' pt 6 #  cyan	     (species 5)
set style line 6 lc rgb '#F08080'   pt 6  #  purple      (empty space)
set style line 7 lc rgb '#AFEEEE' pt 6 	 #  cyan	(species 6)
set style line 8 lc rgb '#98FB98' pt 6 #  dark blue  (species 7)
set style line 9 lc rgb '#DDA0DD' pt 6 #  cyan	     (species 8)
set style line 10 lc rgb '#EEE8AA' pt 6  #  purple      (species 9)
set style line 11 lc rgb 'black' pt 6 	 #  cyan	(species 10)  


   

set out'selection_risk.png'

plot for[i=13:17] 'database/densities.dat' u 1:i ls (i-7) t' Species '.(i-7)


############## plot infection_risks #################

set term png size 560,370 crop enhanced font 'Verdana, 9'

set xl'time'
set yl'densities'

set xr[0:Ng]
#set yr[0.075:0.425]

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
set border 3 back ls 11
set tics nomirror

# define grid
set style line 12 lc rgb '#2f4f4f' lt 0 lw 1
set grid back ls 12

# color line definitions
set style line 1 lc rgb '#DC143C' pt 6 #  green      (species 1)
set style line 2 lc rgb '#0000CD' pt 6 #  red	     		(species 2)
set style line 3 lc rgb '#228B22' pt 6 #  orange     (species 3)
set style line 4 lc rgb '#9932cc' pt 6 #  dark blue  (species 4)
set style line 5 lc rgb '#FFA500' pt 6 #  cyan	     (species 5)
set style line 6 lc rgb '#F08080'   pt 6  #  purple      (empty space)
set style line 7 lc rgb '#AFEEEE' pt 6 	 #  cyan	(species 6)
set style line 8 lc rgb '#98FB98' pt 6 #  dark blue  (species 7)
set style line 9 lc rgb '#DDA0DD' pt 6 #  cyan	     (species 8)
set style line 10 lc rgb '#EEE8AA' pt 6  #  purple      (species 9)
set style line 11 lc rgb 'black' pt 6 	 #  cyan	(species 10)  
   

set out'infection_risk.png'

plot for[i=18:22] 'database/densities.dat' u 1:i ls (i-7) t' Species '.(i-7)
############## plot infection_risks #################

set term png size 560,370 crop enhanced font 'Verdana, 9'

set xl'time'
set yl'densities'

set xr[0:Ng]
#set yr[0.075:0.425]

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
set border 3 back ls 11
set tics nomirror

# define grid
set style line 12 lc rgb '#2f4f4f' lt 0 lw 1
set grid back ls 12

# color line definitions
set style line 1 lc rgb '#DC143C' pt 6 #  green      (species 1)
set style line 2 lc rgb '#0000CD' pt 6 #  red	     		(species 2)
set style line 3 lc rgb '#228B22' pt 6 #  orange     (species 3)
set style line 4 lc rgb '#9932cc' pt 6 #  dark blue  (species 4)
set style line 5 lc rgb '#FFA500' pt 6 #  cyan	     (species 5)
set style line 6 lc rgb '#F08080'   pt 6  #  purple      (empty space)
set style line 7 lc rgb '#AFEEEE' pt 6 	 #  cyan	(species 6)
set style line 8 lc rgb '#98FB98' pt 6 #  dark blue  (species 7)
set style line 9 lc rgb '#DDA0DD' pt 6 #  cyan	     (species 8)
set style line 10 lc rgb '#EEE8AA' pt 6  #  purple      (species 9)
set style line 11 lc rgb 'black' pt 6 	 #  cyan	(species 10)  
   

set out'death_risk.png'

plot for[i=23:27] 'database/densities.dat' u 1:i ls (i-7) t' Species '.(i-7)

############## plot infection_risks #################

set term png size 560,370 crop enhanced font 'Verdana, 9'

set xl'time'
set yl'densities'

set xr[0:Ng]
#set yr[0.075:0.425]

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
set border 3 back ls 11
set tics nomirror

# define grid
set style line 12 lc rgb '#2f4f4f' lt 0 lw 1
set grid back ls 12

# color line definitions
set style line 1 lc rgb '#DC143C' pt 6 #  green      (species 1)
set style line 2 lc rgb '#0000CD' pt 6 #  red	     		(species 2)
set style line 3 lc rgb '#228B22' pt 6 #  orange     (species 3)
set style line 4 lc rgb '#9932cc' pt 6 #  dark blue  (species 4)
set style line 5 lc rgb '#FFA500' pt 6 #  cyan	     (species 5)
set style line 6 lc rgb '#F08080'   pt 6  #  purple      (empty space)
set style line 7 lc rgb '#AFEEEE' pt 6 	 #  cyan	(species 6)
set style line 8 lc rgb '#98FB98' pt 6 #  dark blue  (species 7)
set style line 9 lc rgb '#DDA0DD' pt 6 #  cyan	     (species 8)
set style line 10 lc rgb '#EEE8AA' pt 6  #  purple      (species 9)
set style line 11 lc rgb 'black' pt 6 	 #  cyan	(species 10)  
   

set out'cure_rate.png'

plot for[i=28:29] 'database/densities.dat' u 1:i ls (i-27) t' Species '.(i-7)

############## plot densities #################



set term png size 560,370 crop enhanced font 'Verdana, 9'

set xl'time'
set yl'densities'

set xr[0:Ng]
#set yr[0.0:1.0]

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
set border 3 back ls 11
set tics nomirror

# define grid
set style line 12 lc rgb '#2f4f4f' lt 0 lw 1
set grid back ls 12

# color line definitions
set style line 1 lc rgb '#DC143C' pt 6 #  green      (species 1)
set style line 2 lc rgb '#F15025' pt 6 #  red	     		(species 2)
set style line 3 lc rgb '#0B6E4F' pt 6 #  orange     (species 3)
set style line 4 lc rgb '#4C230A' pt 6 #  dark blue  (species 4)
set style line 5 lc rgb '#FFE66D' pt 6 #  cyan	     (species 5)
set style line 6 lc rgb '#08090A'   pt 6  #  purple      (empty space)
set style line 7 lc rgb '#f8a994' pt 6 	 #  cyan	(species 6)
set style line 8 lc rgb '#97f5d7' pt 6 #  dark blue  (species 7)
set style line 9 lc rgb '#eb9b6a' pt 6 #  cyan	     (species 8)
set style line 10 lc rgb '#fff0a8' pt 6  #  purple      (species 9)
set style line 11 lc rgb '#a7b0b9' pt 6 	 #  cyan	(species 10) 

  

set out'densities.png'

plot for[i=2:12] 'database/densities.dat' u 1:i ls (i) t'Species '.(i-1)


############## plot densities #################



set term png size 560,370 crop enhanced font 'Verdana, 9'

set xl'time'
set yl'densities'

set xr[0:Ng]
#set yr[0.0:1.0]

# define axis
set style line 11 lc rgb '#2f4f4f' lt 1
set border 3 back ls 11
set tics nomirror

# define grid
set style line 12 lc rgb '#2f4f4f' lt 0 lw 1
set grid back ls 12

# color line definitions
set style line 1 lc rgb '#DC143C' pt 6 #  green      (species 1)
set style line 2 lc rgb '#0000CD' pt 6 #  red	     		(species 2)
set style line 3 lc rgb '#228B22' pt 6 #  orange     (species 3)
set style line 4 lc rgb '#9932cc' pt 6 #  dark blue  (species 4)
set style line 5 lc rgb '#FFA500' pt 6 #  cyan	     (species 5)
set style line 6 lc rgb '#F08080'   pt 6  #  purple      (empty space)
set style line 7 lc rgb '#AFEEEE' pt 6 	 #  cyan	(species 6)
set style line 8 lc rgb '#98FB98' pt 6 #  dark blue  (species 7)
set style line 9 lc rgb '#DDA0DD' pt 6 #  cyan	     (species 8)
set style line 10 lc rgb '#EEE8AA' pt 6  #  purple      (species 9)
set style line 11 lc rgb 'black' pt 6 	 #  cyan	(species 10)  
   


set out'speciesdensities.png'

plot for[i=2:6] 'database/densities.dat' u 1:i ls (i-1) t'Species '.(i-1)




################ plot grid #####################
#set size ratio -1
set term png size 416,401 crop

unset xtics
unset ytics
unset key
unset colorbox
unset border
unset grid
unset xl
unset yl

set xr[(Nx/2):Nx]
set yr[0:(Ny/2)]




set cbrange[0:10]





set palette defined ( 0 '#ffffff',\
                      1 '#D81B60',\
		      2 '#1E88E5',\
                      3 '#fcbdce',\
		      4 '#004D40',\
		      5 '#F5FF00',\
		      6 '#D81B60',\
		      7 '#1E88E5',\
		      8 '#fcbdce',\
		      9 '#004D40',\
		      10 '#F5FF00',\
 		      #6 '#f8a994',\
                      #7 '#97f5d7',\
		      #8 '#eb9b6a',\
		      #9	'#fff0a8',\
		     #10 '#a7b0b9')


do for[i=0:Nf]{

	dataname = sprintf("database/data%d.dat",i)
	imagename = sprintf("plots/2grid%d.png",i)

	set out imagename

	plot dataname u 1:2:3 matrix with image notitle
}
