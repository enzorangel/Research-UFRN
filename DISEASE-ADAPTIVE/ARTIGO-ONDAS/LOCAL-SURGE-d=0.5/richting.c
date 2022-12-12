#include "parameters.h"

	//int  fTrono(int Tam,int Vetor[Tam]);
	//int  fbusca_linear(int pVetor, int pValor_a_procurar, int pQuantidade);
	//int  ftaxis(int tam, int *Vetor_direcao[tam],int v_pos);


double *alloc(int);



//void taxis();
int main(){


	double *den_species1, *den_species2, *den_species3, *den_species4, *den_species5, *den_species6, *den_species7, *den_species8, *den_species9, *den_species10, *den_vacancies;
	double *risk_predation1;
	double *risk_predation2;
	double *risk_predation3;
	double *risk_predation4;
	double *risk_predation5;
	double *risk_infection1;
	double *risk_infection2;
	double *risk_infection3;
	double *risk_infection4;
	double *risk_infection5;
	double *risk_death1;
	double *risk_death2;
	double *risk_death3;
	double *risk_death4;
	double *risk_death5;
	double *cure_rate;
	double *immunity_rate;




	//densities of individuals and vacancies
	den_species1 = alloc(num_generations);
	den_species2 = alloc(num_generations);
  den_species3 = alloc(num_generations);
	den_species4 = alloc(num_generations);
	den_species5 = alloc(num_generations);
	den_species6 = alloc(num_generations);
	den_species7 = alloc(num_generations);
	den_species8 = alloc(num_generations);
	den_species9 = alloc(num_generations);
	den_species10 = alloc(num_generations);
  den_vacancies = alloc(num_generations);


	risk_predation1 = alloc(num_generations);
	risk_predation2 = alloc(num_generations);
	risk_predation3 = alloc(num_generations);
	risk_predation4 = alloc(num_generations);
	risk_predation5 = alloc(num_generations);
	risk_infection1 = alloc(num_generations);
	risk_infection2 = alloc(num_generations);
  risk_infection3 = alloc(num_generations);
  risk_infection4 = alloc(num_generations);
	risk_infection5 = alloc(num_generations);
	immunity_rate = alloc(num_generations);
 cure_rate = alloc(num_generations);
	risk_death1 = alloc(num_generations);
	risk_death2 = alloc(num_generations);
	risk_death3 = alloc(num_generations);
	risk_death4 = alloc(num_generations);
	risk_death5 = alloc(num_generations);




		mda1=0.0;
		mda2=0.0;
		mda3=0.0;
		mda4=0.0;
		mda5=0.0;
		mda6=0.0;
		mda7=0.0;
		mda8=0.0;
		mda9=0.0;
		mda10=0.0;
		mda0=0.0;



	double *phi;
		double *chi;
	phi = alloc(Nx*Ny);
	chi = alloc(Nx*Ny);
	// initial conditions
	init_cond(phi);
	init_cond_2(chi);

	// difinitions random GSL
        const gsl_rng_type *T;
        gsl_rng *r;
        gsl_rng_env_setup();
        T=gsl_rng_default;
        r=gsl_rng_alloc(T);
	      gsl_rng_set(r,seed);

	int i,j,k; // auxiliary coordinate variables
	//int x,y, dx,dy;

	int key; // auxiliary variable for successful interactions
	double temp; // temporary variable to mobility of the species
	double gsl_action;
	double gsl_passive, gsl_social, gsl_dispersion, gsl_immunuty;

	int  x, y, dx, dy;
	int sum_1, sum_0;
	double d1;



	int counter_interac = 0; // interactions counter
	int count1=0, count2=0; // auxiliary variable for successful interactions
	int counter1=initial_population, counter2=initial_population, counter3=initial_population, counter4=initial_population, counter5=initial_population, counter6=initial_infection1, counter7=initial_infection2, counter8=initial_infection3, counter9=initial_infection4, counter10=initial_infection5; // desities counters

	    // initial population for predation risk

	    int n1_0, n2_0, n3_0, n4_0,n5_0,n6_0, n7_0, n8_0, n9_0, n10_0;
	    n1_0 = counter1;
	    n2_0 = counter2;
	    n3_0 = counter3;
	    n4_0 = counter4;
	    n5_0 = counter5;
			n6_0 = counter6;
			n7_0 = counter7;
			n8_0 = counter8;
			n9_0 = counter9;
			n10_0 = counter10;


	    int n_cure, n_predations1, n_predations2, n_predations3,n_predations4,n_predations5,n_infection6, n_infection7, n_infection8, n_infection9, n_infection10, n_death5, n_death6, n_death7, n_death8, n_death9, n_death10;
	    n_predations1=0;
	    n_predations2=0;
	    n_predations3=0;
	    n_predations4=0;
	    n_predations5=0;
			n_infection6=0;
			n_infection7=0;
			n_infection8=0;
			n_infection9=0;
			n_infection10=0;
	  	n_death6=0;
		  n_death7=0;
		  n_death8=0;
		  n_death9=0;
		  n_death10=0;
			n_cure=0;


	while(counter_interac < num_interactions){


		// choosing the active individual
		do{
			i = gsl_rng_uniform(r)*Nx;
			j = gsl_rng_uniform(r)*Ny;

			active = j*Nx+i;

		}while(phi[active] == 0.0);


		// sorting the passive position
		gsl_passive = gsl_rng_uniform(r);


		if(gsl_passive<0.25)
			passive=((j+1)%Ny)*Nx+i; //NORTH

		else if(gsl_passive>=0.25 && gsl_passive<0.5)
			passive=((j-1+Ny)%Ny)*Nx+i; // SOUTH

		else if(gsl_passive>=0.50 && gsl_passive<0.75)
			passive=j*Nx+(i+1)%Nx; // EAST

		else
			passive=j*Nx+(i-1+Nx)%Nx; //WEST

    //printf("%e\n" , pa1);

		key = counter_interac;

		// sorting the action of active
		gsl_action=gsl_rng_uniform(r);
		gsl_immunuty=gsl_rng_uniform(r);

		if(phi[active]==1.0){ // species 1 heathy

			if(gsl_action<pa1){ // reproduction
				if(phi[passive]==0.0){
					phi[passive]=1.0;
					counter_interac++;
					counter1++;

				}
			}



			else if(gsl_action>=(pa1) && gsl_action<(pa1+pc1)){ // intercompetition
				if(phi[passive]==2.0){
					phi[passive]=0.0;
					counter_interac++;
					counter2--;
          n_predations2++;

			}
			else if(phi[passive]==7.0){
				phi[passive]=0.0;
				counter_interac++;
				counter7--;
				n_predations2++;

		}
          	}


			else{  // mobility


																								int x,y, dx,dy, direction;
				                                      double gsl_direction, focus1, focus2;
																							int SSD, SST;
																							SSD=0;
																							SST=0;

																				 	for(x=(i-radius); x<=(i+radius); x++){
				                                              for(y=(j-radius); y<=(j+radius); y++){
				                                                if((pow((x-i),2)+pow((y-j),2)) <= pow(radius,2)){


				                                              dx = (x+Nx)%Nx;
				                                              dy = (y+Ny)%Ny;


				                                              if (phi[dy*Nx+dx] == 6.0 || phi[dy*Nx+dx] == 7.0 || phi[dy*Nx+dx] == 8.0 || phi[dy*Nx+dx] == 9.0 || phi[dy*Nx+dx] == 10.0){

				                                                SSD++; //número de doentes ao redor dele

				                                                }



				                                  else{

				                                               SST++; //número de saudáveis ao redor dele e espaços vazios

				                                      }

				                               }}}


				int SSS;
				SSS=SSD+SST; //total de pontos analisados ao redor dele
				double SA;
				SA = SSD*pow(SSS,-1); //densidade de doentes ao redor dele


				                                   // int x,y, dx,dy, direction;
																					//	double gsl_direction, focus1, focus2;


				//printf("%e %e\n",SA,v_social_1);

					//printf("%e %e %d %d %d\n",SA,v_social_1,SSD,SST,SSS);

				                if(SA>=threshold){ //gatilho que aciona o social distancing

				focus1=0.0;
				focus2=0.0;
				}
				else{   //senão, faça safeguard
				focus1=4.0;
				focus2=9.0;
				}

																						//	gsl_social = gsl_rng_uniform(r);




																							//		if (gsl_social<v_social_1){




				 int sum_1_L=0,sum_2_L=0, sum_3_L=0, sum_4_L=0, sum_5_L=0, sum_0_L=0;
				 int sum_1_N=0,sum_2_N=0, sum_3_N=0, sum_4_N=0, sum_5_N=0, sum_0_N=0;
				 int sum_1_S=0,sum_2_S=0, sum_3_S=0, sum_4_S=0, sum_5_S=0, sum_0_S=0;
				 int sum_1_O=0,sum_2_O=0, sum_3_O=0, sum_4_O=0, sum_5_O=0, sum_0_O=0;


					// computing the values of local densities

								for(x=(i-radius); x<=(i+radius); x++){
									for(y=(j-radius); y<=(j+radius); y++){
										if((pow((x-i),2)+pow((y-j),2)) <= pow(radius,2)){


								//EAST
								if (y >= (j+tan(-0.802851)*(x-i)) && y<=(j+tan(0.802851)*(x-i))){ //direction 1

									dx = (x+Nx)%Nx;
									dy = (y+Ny)%Ny;


									if (phi[dy*Nx+dx] == focus1 || phi[dy*Nx+dx] == focus2 ){

										sum_0_L++;

										}

									}

								//}

								//NORTH
								if (y >= (j+tan(-0.785)*(x-i)) && y >= (j+tan(0.785)*(x-i))){//direction  3
								dx = (x+Nx)%Nx;
								dy = (y+Ny)%Ny;



								if (phi[dy*Nx+dx] == focus1 || phi[dy*Nx+dx] == focus2){
								sum_0_N++;

								//}
								}}


								//WEST
								if (y <= (j+tan(-0.802851)*(x-i)) && y >= (j+tan(0.802851)*(x-i))){//direction 5
								dx = (x+Nx)%Nx;
								dy = (y+Ny)%Ny;




								if (phi[dy*Nx+dx] == focus1 || phi[dy*Nx+dx] == focus2){
								sum_0_O++;

								}}




								//SOUTH
								if (y <= (j+tan(-0.785)*(x-i)) && y <= (j+tan(0.785)*(x-i))){//direction 7
								dx = (x+Nx)%Nx;
								dy = (y+Ny)%Ny;


								if (phi[dy*Nx+dx] ==  focus1 || phi[dy*Nx+dx] == focus2){
								sum_0_S++;

								}}

								}}} //end of sums




				//todos diferentes maiores que zero


				if(sum_0_L>sum_0_N && sum_0_L>sum_0_O && sum_0_L>sum_0_S){

											direction = 1;
																		}
				else if(sum_0_N>sum_0_L && sum_0_N>sum_0_O && sum_0_N>sum_0_S){

											direction = 2;
																		}
				else if(sum_0_O>sum_0_L && sum_0_O>sum_0_N && sum_0_O>sum_0_S){
											direction = 3;
																		}
				else if(sum_0_S>sum_0_L && sum_0_S>sum_0_N && sum_0_S>sum_0_O){
											direction = 4;
										}	//fim todos diferentes e maiores que zero
				//dois iguais maiores
				else if(sum_0_L==sum_0_N && sum_0_L>sum_0_S && sum_0_L>sum_0_O){
					gsl_direction = gsl_rng_uniform(r);
						if(gsl_direction<0.5){
								direction = 1;
								}
								else{
								direction = 2;
								}
									}
				else if(sum_0_L==sum_0_O && sum_0_L>sum_0_N && sum_0_L>sum_0_S){
										gsl_direction = gsl_rng_uniform(r);
											if(gsl_direction<0.5){
													direction = 1;
													}
													else{
													direction = 3;
													}
														}
				else if(sum_0_L==sum_0_S && sum_0_L>sum_0_N && sum_0_L>sum_0_O){
																				gsl_direction = gsl_rng_uniform(r);
																					if(gsl_direction<0.5){
																							direction = 1;
																							}
																							else{
																							direction = 4;
																							}
																								}
				else if(sum_0_N==sum_0_O && sum_0_N>sum_0_L && sum_0_N>sum_0_S){
																																							gsl_direction = gsl_rng_uniform(r);
																																									if(gsl_direction<0.5){
																																											direction = 2;
																																											}
																																											else{
																																											direction = 3;
																																											}
																																												}
				else if(sum_0_N==sum_0_S && sum_0_N>sum_0_L && sum_0_N>sum_0_O){
																																																																															gsl_direction = gsl_rng_uniform(r);
																																																																																	if(gsl_direction<0.5){
																																																																																			direction = 2;
																																																																																			}
																																																																																			else{
																																																																																			direction = 4;
																																																																																			}
																																																																																				}
				else if(sum_0_O==sum_0_S && sum_0_O>sum_0_L && sum_0_O>sum_0_N){
																																																																																																																																																															gsl_direction = gsl_rng_uniform(r);
																																																																																																																																																																	if(gsl_direction<0.5){
																																																																																																																																																																			direction = 3;
																																																																																																																																																																			}
																																																																																																																																																																			else{
																																																																																																																																																																			direction = 4;
																																																																																																																																																																			}
																																																																																																																																																																				}
				//fim dois iguais maiores

				//tres iguais maiores
				else if(sum_0_L==sum_0_N && sum_0_L==sum_0_O && sum_0_L>sum_0_S){
					gsl_direction = gsl_rng_uniform(r);
						if(gsl_direction<(1.0/3)){
								direction = 1;
								}
				    else if(gsl_direction>=(1.0/3)  && gsl_direction<(2.0/3)){
				        direction = 2;
							}
								else{
								direction = 3;
								}
									}
				else if(sum_0_L==sum_0_N && sum_0_L==sum_0_S && sum_0_L>sum_0_O){
										gsl_direction = gsl_rng_uniform(r);
											if(gsl_direction<(1.0/3)){
													direction = 1;
													}
									    else if(gsl_direction>=(1.0/3)  && gsl_direction<(2.0/3)){
									        direction = 2;
												}
													else{
													direction = 4;
													}
														}
				else if(sum_0_N==sum_0_O && sum_0_N==sum_0_S && sum_0_N>sum_0_L){
															gsl_direction = gsl_rng_uniform(r);
																if(gsl_direction<(1.0/3)){
																		direction = 2;
																		}
														    else if(gsl_direction>=(1.0/3)  && gsl_direction<(2.0/3)){
														        direction = 3;
																	}
																		else{
																		direction = 4;
																		}
																			}


				      // printf("antes o passivo era %d\n" , passive);

										//choosing the passive

												if (direction==1){
												passive=j*Nx+(i+1)%Nx;
												}
												else if (direction==2){
												passive=((j+1)%Ny)*Nx+i;
												}
												else if (direction==3){
												passive=j*Nx+(i-1+Nx)%Nx;
												}
												else if (direction==4){
													passive=((j-1+Ny)%Ny)*Nx+i;
												}
				   //printf("depois o passivo virou %d\n" , passive);

				//printf("fim leste %d\n" , sum_0_L);
					// printf("fim norte %d\n" , sum_0_N);
					// printf("fim sul %d\n" , sum_0_S);
					// printf("fim oeste %d\n" , sum_0_O);
				 // printf("direction chosen %d\n" , direction);


				//}}
				//extension ends



				temp=phi[passive];
				phi[passive]=phi[active];
				phi[active]=temp;
				counter_interac++;



	}// end of mobility
}// end of species 1

		 else if(phi[active]==2.0){ // species 2

			if(gsl_action<pa2){ // reproduction
				if(phi[passive]==0.0){
					phi[passive]=2.0;
					counter_interac++;
					counter2++;

				}
			}


			else if(gsl_action>=(pa2) && gsl_action<(pa2+pc2)){ // intercompetition
				if(phi[passive]==3.0){
					phi[passive]=0.0;
					counter_interac++;
					counter3--;
          				n_predations3++;
				}
				else if(phi[passive]==8.0){
					phi[passive]=0.0;
					counter_interac++;
					counter8--;
					n_predations3++;

			}
          	}


			else{
				 // mobility
				temp=phi[passive];
				phi[passive]=phi[active];
				phi[active]=temp;
				counter_interac++;
			}






			}




		else if(phi[active]==3.0){ // species 3

		    if(gsl_action<pa3){ // reproduction
		        if(phi[passive]==0.0){
		            phi[passive]=3.0;
		            counter_interac++;
		            counter3++;

		        }
		    }


		else if(gsl_action>=(pa3) && gsl_action<(pa3+pc3)){ // intercompetition
				if(phi[passive]==4.0){
					phi[passive]=0.0;
					counter_interac++;
					counter4--;
          				n_predations4++;
				}
				else if(phi[passive]==9.0){
					phi[passive]=0.0;
					counter_interac++;
					counter9--;
					n_predations4++;

			}
          	}

		    else{ // mobility



		        temp=phi[passive];
		        phi[passive]=phi[active];
		        phi[active]=temp;
		        counter_interac++;
		    }

		}


		else if(phi[active]==4.0){ // species 4

			if(gsl_action<pa4){ // reproduction
				if(phi[passive]==0.0){
					phi[passive]=4.0;
					counter_interac++;
					counter4++;
				}
			}



		else if(gsl_action>=(pa4) && gsl_action<(pa4+pc4)){ // intercompetition
				if(phi[passive]==5.0){
					phi[passive]=0.0;
					counter_interac++;
					counter5--;
          n_predations5++;
				}
				else if(phi[passive]==10.0){
					phi[passive]=0.0;
					counter_interac++;
					counter10--;
					n_predations5++;

			}
          	}

			else{ // mobility


				temp=phi[passive];
				phi[passive]=phi[active];
				phi[active]=temp;
				counter_interac++;
			}

		}






		else if(phi[active]==5.0){ // species 5

			if(gsl_action<pa5){ // reproduction
				if(phi[passive]==0.0){
					phi[passive]=5.0;
					counter_interac++;
					counter5++;
				}
			}



		else if(gsl_action>=(pa5) && gsl_action<(pa5+pc5)){ // intercompetition
				if(phi[passive]==1.0){
					phi[passive]=0.0;
					counter_interac++;
					counter1--;
          n_predations1++;
				}
				else if(phi[passive]==6.0){
					phi[passive]=0.0;
					counter_interac++;
					counter6--;
					n_predations1++;

			}
          	}


			else{ // mobility


				temp=phi[passive];
				phi[passive]=phi[active];
				phi[active]=temp;
				counter_interac++;
			}

		}

//mudar o codigo daqui pra frente

		else if(phi[active]==6.0){ // species 6 - 1 infected


			if(gsl_action<pa6){ // reproduction
				if(phi[passive]==0.0){
					phi[passive]=1.0;
					counter_interac++;
					counter1++;

				}
			}



			else if(gsl_action>=(pa6) && gsl_action<(pa6+pc6)){ // intercompetition
				if(phi[passive]==2.0){
					phi[passive]=0.0;
					counter_interac++;
					counter2--;
          n_predations2++;

			}
			else if(phi[passive]==7.0){
				phi[passive]=0.0;
				counter_interac++;
				counter7--;
				n_predations2++;

		}
          	}


			else if(gsl_action>=(pa6+pc6) && gsl_action<(pa6+pc6+pi6)){ // infection

	if(gsl_immunuty<((1.0-immunity_rate[count2-1])*(1.0+mu))){
				if(phi[passive]==1.0){
					phi[passive]=6.0;
					counter_interac++;
					counter1--;
					counter6++;
					n_infection6++;
				}


				else if(phi[passive]==2.0){
						phi[passive]=7.0;
						counter_interac++;
						counter2--;
						counter7++;
						n_infection7++;
					}

				else if(phi[passive]==3.0){
							phi[passive]=8.0;
							counter_interac++;
							counter3--;
							counter8++;
							n_infection8++;
						}
				else if(phi[passive]==4.0){
							phi[passive]=9.0;
							counter_interac++;
							counter4--;
							counter9++;
							n_infection9++;
						}
				else if(phi[passive]==5.0){
							phi[passive]=10.0;
							counter_interac++;
							counter5--;
							counter10++;
							n_infection10++;
						}
			}
}


      else if(gsl_action>=(pa6+pc6+pi6) && gsl_action<(pa6+pc6+pi6+pd6)){

					phi[active]=0.0;
					counter_interac++;
					counter6--;
					n_death6++;
				}

		 else if(gsl_action>=(pa6+pc6+pi6+pd6) && gsl_action<(pa6+pc6+pi6+pd6+pcure6)){

						phi[active]=1.0;
						counter_interac++;
						counter6--;
						counter1++;
						n_cure++;
					}





			else{ // mobility

																								int x,y, dx,dy, direction;
																							double gsl_direction, focus1, focus2;
																							int SSD, SST;
																							SSD=0;
																							SST=0;

																					for(x=(i-radius); x<=(i+radius); x++){
																											for(y=(j-radius); y<=(j+radius); y++){
																												if((pow((x-i),2)+pow((y-j),2)) <= pow(radius,2)){


																											dx = (x+Nx)%Nx;
																											dy = (y+Ny)%Ny;


																											if (phi[dy*Nx+dx] == 6.0 || phi[dy*Nx+dx] == 7.0 || phi[dy*Nx+dx] == 8.0 || phi[dy*Nx+dx] == 9.0 || phi[dy*Nx+dx] == 10.0){

																												SSD++;

																												}



																					else{

																											 SST++;

																							}

																			 }}}


				int SSS;
				SSS=SSD+SST;
				double SA;
				SA = SSD*pow(SSS,-1);

																					 // int x,y, dx,dy, direction;
																					//	double gsl_direction, focus1, focus2;


				//printf("%e %e\n",SA,v_social_1);

					//printf("%e %e %d %d %d\n",SA,v_social_1,SSD,SST,SSS);

												if(SA>=threshold){

				focus1=0.0;
				focus2=0.0;
				}
				else{
				focus1=4.0;
				focus2=9.0;
				}

																						//	gsl_social = gsl_rng_uniform(r);




																							//		if (gsl_social<v_social_1){




				 int sum_1_L=0,sum_2_L=0, sum_3_L=0, sum_4_L=0, sum_5_L=0, sum_0_L=0;
				 int sum_1_N=0,sum_2_N=0, sum_3_N=0, sum_4_N=0, sum_5_N=0, sum_0_N=0;
				 int sum_1_S=0,sum_2_S=0, sum_3_S=0, sum_4_S=0, sum_5_S=0, sum_0_S=0;
				 int sum_1_O=0,sum_2_O=0, sum_3_O=0, sum_4_O=0, sum_5_O=0, sum_0_O=0;


									// computing the values of local densities

												for(x=(i-radius); x<=(i+radius); x++){
													for(y=(j-radius); y<=(j+radius); y++){
														if((pow((x-i),2)+pow((y-j),2)) <= pow(radius,2)){


												//EAST
												if (y >= (j+tan(-0.802851)*(x-i)) && y<=(j+tan(0.802851)*(x-i))){ //direction 1

													dx = (x+Nx)%Nx;
													dy = (y+Ny)%Ny;


													if (phi[dy*Nx+dx] == focus1 || phi[dy*Nx+dx] == focus2 ){

														sum_0_L++;

														}

													}

												//}

												//NORTH
												if (y >= (j+tan(-0.785)*(x-i)) && y >= (j+tan(0.785)*(x-i))){//direction  3
												dx = (x+Nx)%Nx;
												dy = (y+Ny)%Ny;



												if (phi[dy*Nx+dx] == focus1 || phi[dy*Nx+dx] == focus2){
												sum_0_N++;

												//}
												}}


												//WEST
												if (y <= (j+tan(-0.802851)*(x-i)) && y >= (j+tan(0.802851)*(x-i))){//direction 5
												dx = (x+Nx)%Nx;
												dy = (y+Ny)%Ny;




												if (phi[dy*Nx+dx] == focus1 || phi[dy*Nx+dx] == focus2){
												sum_0_O++;

												}}




												//SOUTH
												if (y <= (j+tan(-0.785)*(x-i)) && y <= (j+tan(0.785)*(x-i))){//direction 7
												dx = (x+Nx)%Nx;
												dy = (y+Ny)%Ny;


												if (phi[dy*Nx+dx] ==  focus1 || phi[dy*Nx+dx] == focus2){
												sum_0_S++;

												}}

												}}} //end of sums




								//todos diferentes maiores que zero


								if(sum_0_L>sum_0_N && sum_0_L>sum_0_O && sum_0_L>sum_0_S){

															direction = 1;
																						}
								else if(sum_0_N>sum_0_L && sum_0_N>sum_0_O && sum_0_N>sum_0_S){

															direction = 2;
																						}
								else if(sum_0_O>sum_0_L && sum_0_O>sum_0_N && sum_0_O>sum_0_S){
															direction = 3;
																						}
								else if(sum_0_S>sum_0_L && sum_0_S>sum_0_N && sum_0_S>sum_0_O){
															direction = 4;
														}	//fim todos diferentes e maiores que zero
								//dois iguais maiores
								else if(sum_0_L==sum_0_N && sum_0_L>sum_0_S && sum_0_L>sum_0_O){
									gsl_direction = gsl_rng_uniform(r);
										if(gsl_direction<0.5){
												direction = 1;
												}
												else{
												direction = 2;
												}
													}
								else if(sum_0_L==sum_0_O && sum_0_L>sum_0_N && sum_0_L>sum_0_S){
														gsl_direction = gsl_rng_uniform(r);
															if(gsl_direction<0.5){
																	direction = 1;
																	}
																	else{
																	direction = 3;
																	}
																		}
								else if(sum_0_L==sum_0_S && sum_0_L>sum_0_N && sum_0_L>sum_0_O){
																								gsl_direction = gsl_rng_uniform(r);
																									if(gsl_direction<0.5){
																											direction = 1;
																											}
																											else{
																											direction = 4;
																											}
																												}
								else if(sum_0_N==sum_0_O && sum_0_N>sum_0_L && sum_0_N>sum_0_S){
																																											gsl_direction = gsl_rng_uniform(r);
																																													if(gsl_direction<0.5){
																																															direction = 2;
																																															}
																																															else{
																																															direction = 3;
																																															}
																																																}
								else if(sum_0_N==sum_0_S && sum_0_N>sum_0_L && sum_0_N>sum_0_O){
																																																																																			gsl_direction = gsl_rng_uniform(r);
																																																																																					if(gsl_direction<0.5){
																																																																																							direction = 2;
																																																																																							}
																																																																																							else{
																																																																																							direction = 4;
																																																																																							}
																																																																																								}
								else if(sum_0_O==sum_0_S && sum_0_O>sum_0_L && sum_0_O>sum_0_N){
																																																																																																																																																																			gsl_direction = gsl_rng_uniform(r);
																																																																																																																																																																					if(gsl_direction<0.5){
																																																																																																																																																																							direction = 3;
																																																																																																																																																																							}
																																																																																																																																																																							else{
																																																																																																																																																																							direction = 4;
																																																																																																																																																																							}
																																																																																																																																																																								}
								//fim dois iguais maiores

								//tres iguais maiores
								else if(sum_0_L==sum_0_N && sum_0_L==sum_0_O && sum_0_L>sum_0_S){
									gsl_direction = gsl_rng_uniform(r);
										if(gsl_direction<(1.0/3)){
												direction = 1;
												}
								    else if(gsl_direction>=(1.0/3)  && gsl_direction<(2.0/3)){
								        direction = 2;
											}
												else{
												direction = 3;
												}
													}
								else if(sum_0_L==sum_0_N && sum_0_L==sum_0_S && sum_0_L>sum_0_O){
														gsl_direction = gsl_rng_uniform(r);
															if(gsl_direction<(1.0/3)){
																	direction = 1;
																	}
													    else if(gsl_direction>=(1.0/3)  && gsl_direction<(2.0/3)){
													        direction = 2;
																}
																	else{
																	direction = 4;
																	}
																		}
								else if(sum_0_N==sum_0_O && sum_0_N==sum_0_S && sum_0_N>sum_0_L){
																			gsl_direction = gsl_rng_uniform(r);
																				if(gsl_direction<(1.0/3)){
																						direction = 2;
																						}
																		    else if(gsl_direction>=(1.0/3)  && gsl_direction<(2.0/3)){
																		        direction = 3;
																					}
																						else{
																						direction = 4;
																						}
																							}


								      // printf("antes o passivo era %d\n" , passive);

														//choosing the passive

																if (direction==1){
																passive=j*Nx+(i+1)%Nx;
																}
																else if (direction==2){
																passive=((j+1)%Ny)*Nx+i;
																}
																else if (direction==3){
																passive=j*Nx+(i-1+Nx)%Nx;
																}
																else if (direction==4){
																	passive=((j-1+Ny)%Ny)*Nx+i;
																}
								   //printf("depois o passivo virou %d\n" , passive);

							//	printf("fim leste %d\n" , sum_0_L);
								//	 printf("fim norte %d\n" , sum_0_N);
									// printf("fim sul %d\n" , sum_0_S);
									// printf("fim oeste %d\n" , sum_0_O);
								 //printf("direction chosen %d\n" , direction);


								//}}
								//extension ends

				temp=phi[passive];
				phi[passive]=phi[active];
				phi[active]=temp;
				counter_interac++;
			}

		}

//


		else if(phi[active]==7.0){ // species 7 - 2 infected


			if(gsl_action<pa6){ // reproduction
				if(phi[passive]==0.0){
					phi[passive]=2.0;
					counter_interac++;
					counter2++;

				}
			}



			else if(gsl_action>=(pa6) && gsl_action<(pa6+pc6)){ // intercompetition
				if(phi[passive]==3.0){
					phi[passive]=0.0;
					counter_interac++;
					counter3--;
					 n_predations3++;

			}
			else if(phi[passive]==8.0){
				phi[passive]=0.0;
				counter_interac++;
				counter8--;
				n_predations3++;

		}
						}


						else if(gsl_action>=(pa6+pc6) && gsl_action<(pa6+pc6+pi6)){ // infection

	if(gsl_immunuty<((1.0-immunity_rate[count2-1])*(1.0+mu))){
							if(phi[passive]==1.0){
								phi[passive]=6.0;
								counter_interac++;
								counter1--;
								counter6++;
								n_infection6++;
							}


							else if(phi[passive]==2.0){
									phi[passive]=7.0;
									counter_interac++;
									counter2--;
									counter7++;
									n_infection7++;
								}

							else if(phi[passive]==3.0){
										phi[passive]=8.0;
										counter_interac++;
										counter3--;
										counter8++;
										n_infection8++;
									}
							else if(phi[passive]==4.0){
										phi[passive]=9.0;
										counter_interac++;
										counter4--;
										counter9++;
										n_infection9++;
									}
							else if(phi[passive]==5.0){
										phi[passive]=10.0;
										counter_interac++;
										counter5--;
										counter10++;
										n_infection10++;
									}
						}
					}


			 else if(gsl_action>=(pa6+pc6+pi6) && gsl_action<(pa6+pc6+pi6+pd6)){

					phi[active]=0.0;
					counter_interac++;
					counter7--;
					n_death7++;
				}

				else if(gsl_action>=(pa6+pc6+pi6+pd6) && gsl_action<(pa6+pc6+pi6+pd6+pcure6)){

					 phi[active]=2.0;
					 counter_interac++;
					 counter7--;
					 counter2++;
					 n_cure++;
				 }

				else{ // mobility

					temp=phi[passive];
					phi[passive]=phi[active];
					phi[active]=temp;
					counter_interac++;
				}

			}

//

    else if(phi[active]==8.0){ // species 8 - 3 infected


	if(gsl_action<pa6){ // reproduction
		if(phi[passive]==0.0){
			phi[passive]=3.0;
			counter_interac++;
			counter3++;

		}
	}



	else if(gsl_action>=(pa6) && gsl_action<(pa6+pc6)){ // intercompetition
		if(phi[passive]==4.0){
			phi[passive]=0.0;
			counter_interac++;
			counter4--;
			n_predations4++;

	}
	else if(phi[passive]==9.0){
		phi[passive]=0.0;
		counter_interac++;
		counter9--;
		n_predations4++;

}
				}


				else if(gsl_action>=(pa6+pc6) && gsl_action<(pa6+pc6+pi6)){ // infection
	if(gsl_immunuty<((1.0-immunity_rate[count2-1])*(1.0+mu))){

					if(phi[passive]==1.0){
						phi[passive]=6.0;
						counter_interac++;
						counter1--;
						counter6++;
						n_infection6++;
					}


					else if(phi[passive]==2.0){
							phi[passive]=7.0;
							counter_interac++;
							counter2--;
							counter7++;
							n_infection7++;
						}

					else if(phi[passive]==3.0){
								phi[passive]=8.0;
								counter_interac++;
								counter3--;
								counter8++;
								n_infection8++;
							}
					else if(phi[passive]==4.0){
								phi[passive]=9.0;
								counter_interac++;
								counter4--;
								counter9++;
								n_infection9++;
							}
					else if(phi[passive]==5.0){
								phi[passive]=10.0;
								counter_interac++;
								counter5--;
								counter10++;
								n_infection10++;
							}
				}
			}



	 else if(gsl_action>=(pa6+pc6+pi6) && gsl_action<(pa6+pc6+pi6+pd6)){

			phi[active]=0.0;
			counter_interac++;
			counter8--;
			n_death8++;
		}

		else if(gsl_action>=(pa6+pc6+pi6+pd6) && gsl_action<(pa6+pc6+pi6+pd6+pcure6)){

			 phi[active]=3.0;
			 counter_interac++;
			 counter8--;
			 counter3++;
			 n_cure++;
		 }

		else{ // mobility

			temp=phi[passive];
			phi[passive]=phi[active];
			phi[active]=temp;
			counter_interac++;
		}

	}

		//


		else if(phi[active]==9.0){ // species 9 - 4 infected


			if(gsl_action<pa6){ // reproduction
				if(phi[passive]==0.0){
					phi[passive]=4.0;
					counter_interac++;
					counter4++;

				}
			}



			else if(gsl_action>=(pa6) && gsl_action<(pa6+pc6)){ // intercompetition
				if(phi[passive]==5.0){
					phi[passive]=0.0;
					counter_interac++;
					counter5--;
					 n_predations5++;

			}
			else if(phi[passive]==10.0){
				phi[passive]=0.0;
				counter_interac++;
				counter10--;
				n_predations5++;

		}
						}

						else if(gsl_action>=(pa6+pc6) && gsl_action<(pa6+pc6+pi6)){ // infection
	if(gsl_immunuty<((1.0-immunity_rate[count2-1])*(1.0+mu))){

							if(phi[passive]==1.0){
								phi[passive]=6.0;
								counter_interac++;
								counter1--;
								counter6++;
								n_infection6++;
							}


							else if(phi[passive]==2.0){
									phi[passive]=7.0;
									counter_interac++;
									counter2--;
									counter7++;
									n_infection7++;
								}

							else if(phi[passive]==3.0){
										phi[passive]=8.0;
										counter_interac++;
										counter3--;
										counter8++;
										n_infection8++;
									}
							else if(phi[passive]==4.0){
										phi[passive]=9.0;
										counter_interac++;
										counter4--;
										counter9++;
										n_infection9++;
									}
							else if(phi[passive]==5.0){
										phi[passive]=10.0;
										counter_interac++;
										counter5--;
										counter10++;
										n_infection10++;
									}
						}
}


			 else if(gsl_action>=(pa6+pc6+pi6) && gsl_action<(pa6+pc6+pi6+pd6)){
					phi[active]=0.0;
					counter_interac++;
					counter9--;
					n_death9++;
				}

				else if(gsl_action>=(pa6+pc6+pi6+pd6) && gsl_action<(pa6+pc6+pi6+pd6+pcure6)){

					 phi[active]=4.0;
					 counter_interac++;
					 counter9--;
					 counter4++;
					 n_cure++;
				 }

			else{ // mobility

				temp=phi[passive];
				phi[passive]=phi[active];
				phi[active]=temp;
				counter_interac++;
			}

		}

		//

		else if(phi[active]==10.0){ // species 10 - 5 infected


			if(gsl_action<pa6){ // reproduction
				if(phi[passive]==0.0){
					phi[passive]=5.0;
					counter_interac++;
					counter5++;

				}
			}



			else if(gsl_action>=(pa6) && gsl_action<(pa6+pc6)){ // intercompetition
				if(phi[passive]==1.0){
					phi[passive]=0.0;
					counter_interac++;
					counter1--;
					 n_predations1++;

			}
			else if(phi[passive]==6.0){
				phi[passive]=0.0;
				counter_interac++;
				counter6--;
				n_predations1++;

		}
						}
						else if(gsl_action>=(pa6+pc6) && gsl_action<(pa6+pc6+pi6)){ // infection

							if(gsl_immunuty<((1.0-immunity_rate[count2-1])*(1.0+mu))){

							if(phi[passive]==1.0){
								phi[passive]=6.0;
								counter_interac++;
								counter1--;
								counter6++;
								n_infection6++;
							}


							else if(phi[passive]==2.0){
									phi[passive]=7.0;
									counter_interac++;
									counter2--;
									counter7++;
									n_infection7++;
								}

							else if(phi[passive]==3.0){
										phi[passive]=8.0;
										counter_interac++;
										counter3--;
										counter8++;
										n_infection8++;
									}
							else if(phi[passive]==4.0){
										phi[passive]=9.0;
										counter_interac++;
										counter4--;
										counter9++;
										n_infection9++;
									}
							else if(phi[passive]==5.0){
										phi[passive]=10.0;
										counter_interac++;
										counter5--;
										counter10++;
										n_infection10++;
									}
						}
       }
			 else if(gsl_action>=(pa6+pc6+pi6) && gsl_action<(pa6+pc6+pi6+pd6)){

					phi[active]=0.0;
					counter_interac++;
					counter10--;
					n_death10++;
				}

				else if(gsl_action>=(pa6+pc6+pi6+pd6) && gsl_action<(pa6+pc6+pi6+pd6+pcure6)){

					 phi[active]=5.0;
					 counter_interac++;
					 counter10--;
					 counter5++;
					 n_cure++;
				 }


				else{ // mobility

					temp=phi[passive];
					phi[passive]=phi[active];
					phi[active]=temp;
					counter_interac++;
				}

			}









		// condition for a successful interaction
		if(counter_interac != key){

			// condition to the number of files allowed
			if((counter_interac % (num_interactions/num_files)) == 0.0){
				// recording the grid data
        count1++;
				output_grid(phi,count1);


int jj, ii;


for(j=0; j<Ny; j++){
		for(i=0; i<Nx; i++){
		 sum_1=0;
		 sum_0=0;

			for(x=(i-radius); x<=(i+radius); x++){
							for(y=(j-radius); y<=(j+radius); y++){
								if((pow((x-i),2)+pow((y-j),2)) <= pow(radius,2)){


									dx = (x+Nx)%Nx; //x coordinate of the internal points
									dy = (y+Ny)%Ny; //y coordinate of the internal points
//	printf("%e\n",phi[dy*Nx+dx]);

			if(phi[dy*Nx+dx] == 6.0 || phi[dy*Nx+dx] == 7.0 || phi[dy*Nx+dx] == 8.0 || phi[dy*Nx+dx] == 9.0 || phi[dy*Nx+dx] == 10.0){
										sum_1++; //presence of viral vectors
			}

			else{

				 sum_0++; //absence of viral vectors

			}

		}}}
//d1 = sum_1/(double)(sum_1+sum_0);
//printf("%d\n",sum_1);
	//	printf("%d %d %e\n",sum_1,sum_0,d1);

//printf("%e\n",chi[j*Nx+i]);
chi[j*Nx+i]=(double)sum_1/28.0;

	}
}

 output_grid2(chi,count1);



			}

			// condition to the number of data allowed
			if((counter_interac % (Nx*Ny)) == 0.0){
				den_species1[count2] = (double)(counter1+counter6)/(Nx*Ny);
				den_species2[count2] = (double)(counter2+counter7)/(Nx*Ny);
        den_species3[count2] = (double)(counter3+counter8)/(Nx*Ny);
				den_species4[count2] = (double)(counter4+counter9)/(Nx*Ny);
				den_species5[count2] = (double)(counter5+counter10)/(Nx*Ny);
				den_species6[count2] = (double)counter6/(Nx*Ny);
				den_species7[count2] = (double)counter7/(Nx*Ny);
				den_species8[count2] = (double)counter8/(Nx*Ny);
				den_species9[count2] = (double)counter9/(Nx*Ny);
				den_species10[count2] = (double)counter10/(Nx*Ny);
				den_vacancies[count2] =1.0-den_species1[count2]-den_species2[count2]-den_species3[count2]-den_species4[count2]-den_species5[count2];


				risk_predation1[count2]=(double)n_predations1/(n1_0);
				risk_predation2[count2]=(double)n_predations2/(n2_0);
				risk_predation3[count2]=(double)n_predations3/(n3_0);
				risk_predation4[count2]=(double)n_predations4/(n4_0);
				risk_predation5[count2]=(double)n_predations5/(n5_0);
				risk_infection1[count2]=(double)n_infection6/(n1_0);
				risk_infection2[count2]=(double)n_infection7/(n2_0);
				risk_infection3[count2]=(double)n_infection8/(n3_0);
				risk_infection4[count2]=(double)n_infection9/(n4_0);
				risk_infection5[count2]=(double)n_infection10/(n5_0);
				risk_death1[count2]=(double)(n_death6+n_predations1)/(n1_0);
				risk_death2[count2]=(double)(n_death7+n_predations2)/(n2_0);
				risk_death3[count2]=(double)(n_death8+n_predations3)/(n3_0);
				risk_death4[count2]=(double)(n_death9+n_predations4)/(n4_0);
				risk_death5[count2]=(double)(n_death10+n_predations5)/(n5_0);
        cure_rate[count2]=(double)(n_cure)/(n1_0+n2_0+n3_0+n4_0+n5_0);

				int xx;
				for(xx=(count2-Memory+1); xx<count2+1; xx++){
					immunity_rate[count2] += cure_rate[xx]*((count2-xx+Memory)/Memory);
							}

					count2++;
				n_predations1=0;
				n1_0 = counter1;
				n_predations2=0;
				n2_0 = counter2;
				n_predations3=0;
				n3_0 = counter3;
				n_predations4=0;
				n4_0 = counter4;
				n_predations5=0;
				n5_0 = counter5;
				n_infection6=0;
				n_infection7=0;
				n_infection8=0;
				n_infection9=0;
				n_infection10=0;
				n_death6=0;
				n_death7=0;
				n_death8=0;
				n_death9=0;
				n_death10=0;
				n6_0 = counter6;
				n7_0 = counter7;
				n8_0 = counter8;
				n9_0 = counter9;
				n10_0 = counter10;
				n_cure = 0;

			}

//		}
}
	} // while-key

				int xx;
		            xx=0;
		mda1=0.0;
		mda2=0.0;
		mda3=0.0;
		mda4=0.0;
		mda5=0.0;
		mda6=0.0;
		mda7=0.0;
		mda8=0.0;
		mda9=0.0;
		mda10=0.0;
		mda0=0.0;




			for(xx=(num_generations/2); xx<num_generations; xx++){
				mda1 += den_species1[xx]/(num_generations/2);
				mda2 += den_species2[xx]/(num_generations/2);
				mda3 += den_species3[xx]/(num_generations/2);
				mda4 += den_species4[xx]/(num_generations/2);
				mda5 += den_species5[xx]/(num_generations/2);
				mda6 += den_species6[xx]/(num_generations/2);
				mda7 += den_species7[xx]/(num_generations/2);
				mda8 += den_species8[xx]/(num_generations/2);
				mda9 += den_species9[xx]/(num_generations/2);
				mda10 += den_species10[xx]/(num_generations/2);
				mda0 += den_vacancies[xx]/(num_generations/2);
		        }

	//	 printf("%f %f %f %f %f %f %f %f %f %f %f %d %d \n" , mda1, mda2, mda3, mda4, mda5, mda6, mda7, mda8, mda9, mda10, mda0, seed, count2);



	// recording the densities data
	output_densities(den_species1, den_species2, den_species3, den_species4, den_species5,den_species6, den_species7, den_species8, den_species9, den_species10, den_vacancies,risk_predation1, risk_predation2, risk_predation3, risk_predation4, risk_predation5,risk_infection1, risk_infection2, risk_infection3, risk_infection4, risk_infection5,risk_death1, risk_death2, risk_death3, risk_death4, risk_death5,cure_rate, immunity_rate);
	gsl_rng_free(r);

	free(risk_predation1);
	free(risk_predation2);
	free(risk_predation3);
	free(risk_predation4);
	free(risk_predation5);
	free(risk_infection1);
	free(risk_infection2);
	free(risk_infection3);
	free(risk_infection4);
  free(risk_infection5);
	free(risk_death1);
	free(risk_death2);
	free(risk_death3);
	free(risk_death4);
	free(risk_death5);
  free(immunity_rate);
	free(cure_rate);
	free(phi);
		free(chi);
	free(den_species1);
	free(den_species2);
  free(den_species3);
	free(den_species4);
	free(den_species5);
	free(den_species6);
	free(den_species7);
	free(den_species8);
	free(den_species9);
	free(den_species10);
	free(den_vacancies);
}
