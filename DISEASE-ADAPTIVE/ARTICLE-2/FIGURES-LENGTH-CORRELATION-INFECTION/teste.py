file_write = open("statistics.dat","w")

y = ['','','']


espaco = ' '
quebra = " \n"

kappa = 0.8

for i in range(1,18,1):

    ref_arquivo = open("statistics-"+str(i)+".dat","r")

    optimum = 0.0
    desvio = 0.0
    analise = 0
    aux11 = 0.0
    cont = i
    cont_linha = 0

    for linha in ref_arquivo:
        valores = linha.split()

        cont_linha += 1

        #Especie 1:
        if cont_linha != 1:
            if float(valores[2])+float(valores[7])>aux11:
                optimum = float(valores[0])
                desvio = (float(valores[30])/float(valores[2]))*optimum
                #analise = float(valores[2])+float(valores[7])
                aux11 = float(valores[2])+float(valores[7])
            elif float(valores[2])+float(valores[7])<=aux11:
                aux11 = aux11

    y[0] = str(kappa/6.2)
    y[1] = str(optimum)
    y[2] = str(desvio)

    kappa += 0.2

    for j in range(3):
        lines = y[j],espaco
        file_write.writelines(lines)

    file_write.writelines(quebra)

    
    ref_arquivo.close() 

file_write.close()
