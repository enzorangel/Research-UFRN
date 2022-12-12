file_write = open("mu3-lc.dat","w")

y1 = ['',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']



ref_arquivo = open("mu3.dat","r")

x_11 = 0; x_12 = 0; x_13 = 0; x_14 = 0;   
x_21 = 0; x_22 = 0; x_23 = 0; x_24 = 0; 
y_11 = 0; y_12 = 0; y_13 = 0; y_14 = 0; 
y_21 = 0; y_22 = 0; y_23 = 0; y_24 = 0; 
d_11 = 0; d_12 = 0; d_13 = 0; d_14 = 0;  
d_21 = 0; d_22 = 0; d_23 = 0; d_24 = 0; 

Y1 = 0; Y2 = 0; Y3 = 0; Y4 = 0;   
Z1 = 0; Z2 = 0; Z3 = 0; Z4 = 0; 

aux11 = 0; aux12 = 0; aux13 = 0; aux14 = 0; 
aux21 = 10; aux22 = 10; aux23 = 10; aux24 = 10; 

cont1 = 0; cont2 = 0; cont3 = 0; cont4 = 0;  
    
for linha in ref_arquivo:
    valores = linha.split()

    #Especie 1:
    if float(valores[1])>0.15 and cont1==0:
        aux11 = float(valores[1])-0.15
        if aux11 < aux21:
            y_11 = int(valores[0])
            aux21 = aux11
            x_11 = float(valores[1])
            d_11 = float(valores[2])
    elif cont1==0 and float(valores[1])<0.15:
        y_21 = int(valores[0])
        #print(y_2)
        x_21 = float(valores[1])
        d_21 = float(valores[2])
        cont1 += 1

    #Especie 2:
    if float(valores[3])>0.15 and cont2==0:
        aux12 = float(valores[3])-0.15
        if aux12 < aux22:
            y_12 = int(valores[0])
            aux22 = aux12
            x_12 = float(valores[3])
            d_12 = float(valores[4])
    elif cont2==0 and float(valores[3])<0.15:
        y_22 = int(valores[0])
        #print(y_2)
        x_22 = float(valores[3])
        d_22 = float(valores[4])
        cont2 += 1

    #Especie 3:
    if float(valores[5])>0.15 and cont3==0:
        aux13 = float(valores[5])-0.15
        if aux13 < aux23:
            y_13 = int(valores[0])
            aux23 = aux13
            x_13 = float(valores[5])
            d_13 = float(valores[6])
    elif cont3==0 and float(valores[5])<0.15:
        y_23 = int(valores[0])
        #print(y_2)
        x_23 = float(valores[5])
        d_23 = float(valores[6])
        cont3 += 1

    #Especie 4:
    if float(valores[7])>0.15 and cont4==0:
        aux14 = float(valores[7])-0.15
        if aux14 < aux24:
            y_14 = int(valores[0])
            aux24 = aux14
            x_14 = float(valores[7])
            d_14 = float(valores[8])
    elif cont4==0 and float(valores[7])<0.15:
        y_24 = int(valores[0])
        #print(y_2)
        x_24 = float(valores[7])
        d_24 = float(valores[8])
        cont4 += 1

    
ref_arquivo.close()

Y1 = y_11 + ((y_11 - y_21)/(x_11 - x_21))*(0.15-x_11)
Y2 = y_12 + ((y_12 - y_22)/(x_12 - x_22))*(0.15-x_12)
Y3 = y_13 + ((y_13 - y_23)/(x_13 - x_23))*(0.15-x_13)
Y4 = y_14 + ((y_14 - y_24)/(x_14 - x_24))*(0.15-x_14)

#Especie 1:
if (x_11-15) > (15-x_21):
    Z1 = (Y1*d_11)/x_11
else:
    Z1 = (Y1*d_21)/x_21

#Especie 2:
if (x_12-15) > (15-x_22):
    Z2 = (Y2*d_12)/x_12
else:
    Z2 = (Y2*d_22)/x_22

#Especie 3:
if (x_13-15) > (15-x_23):
    Z3 = (Y3*d_13)/x_13
else:
    Z3 = (Y3*d_23)/x_23

#Especie 4:
if (x_14-15) > (15-x_24):
    Z4 = (Y4*d_14)/x_14
else:
    Z4 = (Y4*d_24)/x_24
    
y1[0] = '3.0'
y1[1] = str(Y1)
y1[2] = str(Z1)
y1[3] = str(Y2)
y1[4] = str(Z2)
y1[5] = str(Y3)
y1[6] = str(Z3)
y1[7] = str(Y4)
y1[8] = str(Z4)


espaco = ' '
quebra = " \n"



for j in range(11):
    lines = y1[j],espaco
    file_write.writelines(lines)

file_write.close()