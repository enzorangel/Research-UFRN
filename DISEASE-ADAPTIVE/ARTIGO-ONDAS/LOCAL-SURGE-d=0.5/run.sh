#!/bin/bash

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export LC_CTYPE="en_US.UTF-8"

	echo -e "\ncompiling...\n"

	make

	echo -e "running..."

	time ./executable

	cd plots ; cd ..

	# copy variables of the archive 'parameters.h'
	Nx=$(sed -n '/#define Nx / p' parameters.h | cut -f3 -d' ')
	Ny=$(sed -n '/#define Ny / p' parameters.h | cut -f3 -d' ')
	Nf=$(sed -n '/#define num_files / p' parameters.h | cut -f3 -d' ')
	Ng=$(sed -n '/#define num_generations / p' parameters.h | cut -f3 -d' ')

	# rewrite variables in the archive 'plots.gnu'
	sed -i '/Nx= / s/.*/Nx= '$Nx'/' plotsgo.gnu
	sed -i '/Ny= / s/.*/Ny= '$Ny'/' plotsgo.gnu
	sed -i '/Nf= / s/.*/Nf= '$Nf'/' plotsgo.gnu
	sed -i '/Ng= / s/.*/Ng= '$Ng'/' plotsgo.gnu

	echo -e "\nplotting the data... \n"

	gnuplot plotsgo.gnu

	# rewrite variables in the archive 'plots.gnu'
	sed -i '/Nx= / s/.*/Nx= '$Nx'/' plotsurge.gnu
	sed -i '/Ny= / s/.*/Ny= '$Ny'/' plotsurge.gnu
	sed -i '/Nf= / s/.*/Nf= '$Nf'/' plotsurge.gnu
	sed -i '/Ng= / s/.*/Ng= '$Ng'/' plotsurge.gnu

	echo -e "\nplotting the data... \n"

	gnuplot plotsurge.gnu


	echo -e "making the videos...\n"

#ffmpeg -r 300 -i plots/densities%d.png densities.mp4

rm *.mp4

ffmpeg -r 5 -i plots/grid%d.png grid.mp4

ffmpeg -r 5 -i plots/surge%d.png surge.mp4


rm executable

echo -e "finished !\n"
