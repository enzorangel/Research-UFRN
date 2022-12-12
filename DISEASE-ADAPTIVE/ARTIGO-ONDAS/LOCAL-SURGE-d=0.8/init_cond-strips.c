#include "parameters.h"

void put_species(double *phi, int num_species, double point_number);

void init_cond(double *phi){
	int i,j;

	const gsl_rng_type *T;
	gsl_rng *r;
	gsl_rng_env_setup();
	T=gsl_rng_default;
	r=gsl_rng_alloc(T);
        double f;

	if(ic_key == 0){ // randomic
		
	// filling in the grid with vacancies
		for(j=0;j<Ny;j++){
           		 for(i=0;i<Nx;i++){

               			 phi[j*Nx+i]=0.0;
        
       
                if(i<Nx/5){

	f=gsl_rng_uniform(r);
if(f<=0.5){
phi[j*Nx+i]=5.0;
}
else{phi[j*Nx+i]=3.0;}

			


                    }

    		if(i>=Nx/5 && i<2*Nx/5){
                 	f=gsl_rng_uniform(r);
if(f<=0.5){
phi[j*Nx+i]=1.0;
}
else{phi[j*Nx+i]=3.0;}


}

		if(i>=2*Nx/5 && i<3*Nx/5){
																						         	f=gsl_rng_uniform(r);
if(f<=0.5){
phi[j*Nx+i]=1.0;
}
else{phi[j*Nx+i]=4.0;}			



}


		if(i>=3*Nx/5 && i<4*Nx/5){
                    
	f=gsl_rng_uniform(r);
if(f<=0.5){
phi[j*Nx+i]=2.0;
}
else{phi[j*Nx+i]=4.0;}
}

                if(i>=4*Nx/5){
                  	f=gsl_rng_uniform(r);
if(f<=0.5){
phi[j*Nx+i]=5.0;
}
else{phi[j*Nx+i]=2.0;}}
/*
	       // distributing the species on the lattice randomly
		put_species(phi,initial_population,1.0);
		put_species(phi,initial_population,2.0);
		put_species(phi,initial_population,3.0);
		put_species(phi,initial_population,4.0);
		put_species(phi,initial_population,5.0);

*/
			
	}}}	
               // put_species(phi,density3*Nx*Ny,3.0);
		//put_species(phi,densityI*Nx*Ny,4.0);
//	}}}//}

	else{  // specific
		float k;

		FILE *data0 = fopen("data0.dat","r");

		if(data0 == NULL){
			perror("\nError while opening the file");
			exit(1);
		}

		for(j=0; j<Nx; j++)
			for(i=0; i<Nx; i++){
				fscanf(data0,"%g", &k);
				phi[j*Nx+i] = (double)k;
			}

		fclose(data0);
	}

	output_grid(phi,0);
	}

	void put_species(double *phi, int num_species, double point_number){
	int i,j; // spatial coordinates
	int position, counter=0;

	const gsl_rng_type *T;
	gsl_rng *r;
	gsl_rng_env_setup();
	T=gsl_rng_default;
	r=gsl_rng_alloc(T);

	while(counter<num_species){
		i=gsl_rng_uniform(r)*Nx;
		j=gsl_rng_uniform(r)*Ny;

		position=j*Nx+i;

		if(phi[position]==0.0){
			phi[position]=point_number;
			counter++;
		}
	}

	gsl_rng_free(r);
	
	}
