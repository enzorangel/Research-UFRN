#!/usr/bin/gnuplot

reset

name = sprintf("statisticsR3")

set term pngcairo size 650,520 crop enhanced font 'Verdana,10'

name_out = sprintf("%s_fit.png", name)

set output name_out

set xl'{m}'
set yl'{/Simbol k}_{c}'

# color line definitions
set style line 1 lc rgb '#ffcc00' lt 0 lw 2.5 pt 7 ps 1
set style line 2 lc rgb 'grey' lt 0 lw 2.5 pt 7 ps 1
set style line 3 lc rgb 'blue' lt 0 lw 2.5 pt 7 ps 1
set style line 4 lc rgb 'red' lt 0 lw 2.5 pt 7 ps 1
set style line 5 lc rgb 'blue' lt -1 lw 2.5 pt 7 ps 1
set style line 6 lc rgb '#3399ff' lt -1 lw 2.5 pt 7 ps 1
set style line 7 lc rgb '#3399ff' lt -1 lw 2.5 pt 7 ps 1


set style line 11 lc rgb '#696969' lt 1
set border 3 front ls 11
set tics nomirror
unset colorbox

name_data = sprintf("%s.dat", name)

#f(x) = a*log(x)+b

f(x) = a*exp(b*x)


#fit f(x) name_data using ($2/($2+50)):($1):(($3>0.45 && $3<0.55)? $3: NaN) via a,b
fit f(x) name_data using 1:2 via a,b


name_params = sprintf("params_%s.dat", name)

save var name_params

set key top left Left reverse samplen 3

#plot name_data using ($2/($2+50)):($1):(($3>0.45 && $3<0.55)? $3: NaN) notitle#, f(x) lw 2 t'best fit'

plot name_data u 1:2 with lp ls 4 notitle,\
f(x) with lp ls 2 notitle
     
system("rm -f fit.log")
