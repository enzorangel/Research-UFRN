#include "parameters.h"

void output_densities(double *den_species1, double *den_species2, double *den_species3, double *den_species4, double *den_species5, double *den_species6, double *den_species7, double *den_species8, double *den_species9, double *den_species10, double *den_vacancies, double *risk_predation1,double *risk_predation2, double *risk_predation3, double *risk_predation4,double *risk_predation5,double *risk_infection1, double *risk_infection2,double *risk_infection3,double *risk_infection4,double *risk_infection5,double *risk_death1, double *risk_death2, double *risk_death3, double *risk_death4, double *risk_death5, double *cure_rate, double *immunity_rate){

	////// out put to densities of individuals and vacancies //////////////

	int k;
	FILE *densities;

	densities=fopen("database/densities.dat","w");

	for(k=0; k<num_generations; k++){
		fprintf(densities,"%d %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g\n", k,\
			den_species1[k], den_species2[k], den_species3[k],den_species4[k],den_species5[k],den_species6[k],den_species7[k], den_species8[k], den_species9[k], den_species10[k], den_vacancies[k], risk_predation1[k],risk_predation2[k], risk_predation3[k],risk_predation4[k],risk_predation5[k],risk_infection1[k], risk_infection2[k], risk_infection3[k], risk_infection4[k],risk_infection5[k],risk_death1[k], risk_death2[k], risk_death3[k], risk_death4[k],risk_death5[k], cure_rate[k], immunity_rate[k]);
			}

	fclose(densities);
}
