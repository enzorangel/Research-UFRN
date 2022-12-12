file_write = open("statistics.dat","w")

y1 = ['0.1',' ']
y2 = ['0.18',' ']
y3 = ['0.26',' ']
y4 = ['0.34',' ']
y5 = ['0.42',' ']
y6 = ['0.50',' ']
y7 = ['0.58',' ']
y8 = ['0.66',' ']
y9 = ['0.74',' ']
y10 = ['0.82',' ']
y11 = ['0.90',' ']


espaco = ' '
quebra = " \n"

for i in range(1,12,1):

    ref_arquivo = open("mort-"+str(i)+".dat","r")

    optimum = 0.0
    desvio = 0.0
    analise = 0
    aux11 = 0.0
    cont = i

    for linha in ref_arquivo:
        valores = linha.split()

        #Especie 1:
        if float(valores[2])+float(valores[7])>aux11:
            optimum = float(valores[0])
            #desvio = float(valores[30])
            analise = float(valores[2])+float(valores[7])
            aux11 = float(valores[2])+float(valores[7])
        elif float(valores[2])+float(valores[7])<=aux11:
            aux11 = aux11

    
    ref_arquivo.close() 

    #print(analise)  

    if cont == 1:
        y1[cont] = str(optimum) 
        #y1[cont+1] = str(desvio) 
    elif cont == 2:          
        y2[cont-1] = str(optimum)
        #y2[cont] = str(desvio) 
    elif cont == 3:
        y3[cont-2] = str(optimum)
        #y3[cont-1] = str(desvio) 
    elif cont == 4:
        y4[cont-3] = str(optimum)
        #y4[cont-2] = str(desvio) 
    elif cont == 5:
        y5[cont-4] = str(optimum)
        #y5[cont-3] = str(desvio) 
    elif cont == 6:
        y6[cont-5] = str(optimum)
        #y6[cont-4] = str(desvio) 
    elif cont == 7:
        y7[cont-6] = str(optimum)
        #y7[cont-5] = str(desvio) 
    elif cont == 8:
        y8[cont-7] = str(optimum)
        #y8[cont-6] = str(desvio) 
    elif cont == 9:
        y9[cont-8] = str(optimum)
        #y9[cont-7] = str(desvio) 
    elif cont == 10:
        y10[cont-9] = str(optimum)
        #y10[cont-8] = str(desvio) 
    elif cont == 11:
        y11[cont-10] = str(optimum) 
        #y11[cont-9] = str(desvio)    


for j in range(2):
    lines = y1[j],espaco
    file_write.writelines(lines)
file_write.writelines(quebra)

for j in range(2):
    lines = y2[j],espaco
    file_write.writelines(lines)
file_write.writelines(quebra)

for j in range(2):
    lines = y3[j],espaco
    file_write.writelines(lines)
file_write.writelines(quebra)

for j in range(2):
    lines = y4[j],espaco
    file_write.writelines(lines)
file_write.writelines(quebra)

for j in range(2):
    lines = y5[j],espaco
    file_write.writelines(lines)
file_write.writelines(quebra)

for j in range(2):
    lines = y6[j],espaco
    file_write.writelines(lines)
file_write.writelines(quebra)

for j in range(2):
    lines = y7[j],espaco
    file_write.writelines(lines)
file_write.writelines(quebra)

for j in range(2):
    lines = y8[j],espaco
    file_write.writelines(lines)
file_write.writelines(quebra)

for j in range(2):
    lines = y9[j],espaco
    file_write.writelines(lines)
file_write.writelines(quebra)

for j in range(2):
    lines = y10[j],espaco
    file_write.writelines(lines)
file_write.writelines(quebra)

for j in range(2):
    lines = y11[j],espaco
    file_write.writelines(lines)


file_write.close()