
reset
set sample 50
set table 'stats1.dat'
plot [0:10] 0.5+rand(0)
unset table

set yrange [0:2]
unset key
plot 'stats1.dat' u 1:2
min_y = GPVAL_DATA_Y_MIN
max_y = GPVAL_DATA_Y_MAX

plot 'stats1.dat' u ($2 == min_y ? $2 : 1/0):1
min_pos_x = GPVAL_DATA_Y_MIN
plot 'stats1.dat' u ($2 == max_y ? $2 : 1/0):1
max_pos_x = GPVAL_DATA_Y_MAX

# Automatically adding an arrow at a position that depends on the min/max
set arrow 1 from min_pos_x, min_y-0.2 to min_pos_x, min_y-0.02 lw 0.5
set arrow 2 from max_pos_x, max_y+0.2 to max_pos_x, max_y+0.02 lw 0.5
set label 1 'Minimum' at min_pos_x, min_y-0.3 centre
set label 2 'Maximum' at max_pos_x, max_y+0.3 centre
plot 'stats1.dat' u 1:2 w p pt 6
