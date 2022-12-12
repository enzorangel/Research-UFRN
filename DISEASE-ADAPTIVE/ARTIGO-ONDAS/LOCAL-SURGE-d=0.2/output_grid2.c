#include "parameters.h"

void output_grid2(double *chi, int count){
        /////// out put to form the grid //////////////////////////////////////
        int i,j;
        char name[50];
        FILE *grid2;

	sprintf(name,"database/surge%d.dat",count);
	grid2=fopen(name,"w");

	for(j=0;j<Ny;j++){
		for(i=0;i<Nx;i++)
			fprintf(grid2,"%g ", chi[j*Nx+i]);

		fprintf(grid2,"\n");
	}


        fclose(grid2);
}
