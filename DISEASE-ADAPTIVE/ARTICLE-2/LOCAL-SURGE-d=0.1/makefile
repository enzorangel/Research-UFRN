COMPILER = gcc
FLAGS = -O3
LIB = -lm -lgsl -lgslcblas -lfftw3

arc = richting.c init_cond_2.c init_cond.c  dynamic_allocation.c output_densities.c  output_grid.c output_grid2.c 

all:
	@${COMPILER} ${fLAGS} ${arc} ${LIB} -o executable
