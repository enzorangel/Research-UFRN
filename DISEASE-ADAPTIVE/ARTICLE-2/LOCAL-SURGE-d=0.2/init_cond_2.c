#include "parameters.h"




void init_cond_2(double *chi){
	int i,j;

	// filling in the grid with vacancies
		for(j=0;j<Ny;j++){
			for(i=0;i<Nx;i++){

                		chi[j*Nx+i]=1.0;

		}

	   }




              	output_grid2(chi,0);
}
