
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <complex.h>
#include <fftw3.h>
#include <gsl/gsl_rng.h>

#include "prototype.h"

// controls:

#define Nx 500 //largura do grid
#define Ny 500 //comprimento do grid
#define num_generations 500 //tempo de simulação
#define initial_population 0.99*(Nx*Ny)/5 //healthy individuals
#define initial_infection1 0.01*(Nx*Ny)/5 //infected individuals
#define initial_infection2 0.01*(Nx*Ny)/5
#define initial_infection3 0.01*(Nx*Ny)/5
#define initial_infection4 0.01*(Nx*Ny)/5
#define initial_infection5 0.01*(Nx*Ny)/5
#define num_interactions (num_generations*Nx*Ny)
#define num_files 20 //número de fotos da simulação

#define seed 233 // semente que define o processo estocástico




#define threshold 0.6 // gatilho: DEVE SER VARIADO de 0.0 (sempre faz social distancing) ATÉ 1.0 (gatilho somente quando 100% é de doentes)
//variando de 0.1 em 0.1
#define i6 2.0 // - valor base: 2.0 - infection // transmissibilidade da doença: inicio 0.2 -- variando de 0.4 em 0.4 ---- terminando em 3.8
#define d6 0.4 // - valor base: 0.2 -- mortality // mortalidade da doença: inicio 0.1 -- variando de 0.8 em 0.8 ---- terminando em 0.9


#define radius 3	// computing radius of local density#define epsilon 0.0
#define dispersion 0.0


// control keys

#define ic_key       0 	// (0 → randomic, 1 →  specific) initial condition
#define c_key        0 	// correlation key (1 → on, 0 →  off)
#define mobility_5ey 0  // (0 → constant, 1 → taxis active, 2 → clever)


//  keys of directional moviment strategy

#define taxis_key 91	// (11 → randomic, 0 → empty space, 1 → attack, 2 → anticipation, 3 → safeg)
#define strategy_key2 11
#define strategy_key3 11
#define strategy_key4 11
#define strategy_key5 11
#define social 1.0
#define taxys_symptomatic 0 // (0 → assymptomatic, 1 → symptomatic)

#define num_correlation 1 // number of output
#define Np 99 		  // number of points of the function C(r)

#define percent_interac 0.0	// (percentage of interactions) in 'percent_interac' of interactions the infection begins.
#define percent_infec   0.0 	// percentage of infected for both species.

// intrinsic rate of growth of species

#define a1 1.0
#define a2 1.0
#define a3 1.0
#define a4 1.0
#define a5 1.0
#define a6 1.0

// intraspecific competition parameter

#define b1 0.000
#define b2 0.000
#define b3 0.000

// interspecific competition parameter

#define c1 1.0
#define c2 1.0
#define c3 1.0
#define c4 1.0
#define c5 1.0
#define c6 1.0


#define cure6 0.2 // cure
#define Memory 1 // immunologic Memory
#define mu 0.0 // immunologic Memory

// mobility

#define mb 1.0
#define m1 mb
#define m2 mb
#define m3 mb
#define mi mb
#define m5 mb
#define m6 mb


// Probability


// probability parameters - species 1
#define pa1 a1/(a1+c1+mb)
#define pm1 mb/(a1+c1+mb)
#define pc1 c1/(a1+c1+mb)

// probability parameters - species 2
#define pa2 a2/(a2+c2+mb)
#define pm2 mb/(a2+c2+mb)
#define pc2 c2/(a2+c2+mb)

// probability parameters - species 3
#define pa3 a2/(a3+c3+mb)
#define pm3 mb/(a3+c3+mb)
#define pc3 c3/(a3+c3+mb)

// probability parameters - species 4
#define pa4 a4/(a4+c4+mb)
#define pm4 mb/(a4+c4+mb)
#define pc4 c4/(a4+c4+mb)

// probability parameters - species 5
#define pa5 a5/(a5+c5+mb)
#define pm5 mb/(a5+c5+mb)
#define pc5 c5/(a5+c5+mb)

// probability parameters - species 6
#define pa6 a6/(a6+c6+mb+i6+d6+cure6)
#define pm6 mb/(a6+c6+mb+i6+d6+cure6)
#define pc6 c6/(a6+c6+mb+i6+d6+cure6)
#define pi6 i6/(a6+c6+mb+i6+d6+cure6)
#define pd6 d6/(a6+c6+mb+i6+d6+cure6)
#define pcure6 cure6/(a6+c6+mb+i6+d6+cure6)
