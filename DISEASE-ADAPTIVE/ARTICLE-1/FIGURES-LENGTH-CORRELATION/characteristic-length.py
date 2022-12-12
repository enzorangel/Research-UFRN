file_write = open("statistics.dat","w")

y1 = ['0.0',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
y2 = ['0.1',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
y3 = ['0.2',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
y4 = ['0.3',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
y5 = ['0.4',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
y6 = ['0.5',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
y7 = ['0.6',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
y8 = ['0.7',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
y9 = ['0.8',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
y10 = ['0.9',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
y11 = ['1.0',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']

for i in range(11):
    if i<10:
        ref_arquivo = open("statistics-0p"+str(i)+".dat","r")
    elif i==10:
        ref_arquivo = open("statistics-1p0.dat","r")

    x_11 = 0; x_12 = 0; x_13 = 0; x_14 = 0; x_15 = 0;   
    x_21 = 0; x_22 = 0; x_23 = 0; x_24 = 0; x_25 = 0; 
    y_11 = 0; y_12 = 0; y_13 = 0; y_14 = 0; y_15 = 0; 
    y_21 = 0; y_22 = 0; y_23 = 0; y_24 = 0; y_25 = 0; 
    d_11 = 0; d_12 = 0; d_13 = 0; d_14 = 0; d_15 = 0;  
    d_21 = 0; d_22 = 0; d_23 = 0; d_24 = 0; d_25 = 0; 

    Y1 = 0; Y2 = 0; Y3 = 0; Y4 = 0; Y5 = 0;  
    Z1 = 0; Z2 = 0; Z3 = 0; Z4 = 0; Z5 = 0; 

    aux11 = 0; aux12 = 0; aux13 = 0; aux14 = 0; aux15 = 0; 
    aux21 = 10; aux22 = 10; aux23 = 10; aux24 = 10; aux25 = 10; 

    cont1 = 0; cont2 = 0; cont3 = 0; cont4 = 0; cont5 = 0; 
    cont = i
    
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

        #Especie 5:
        if float(valores[9])>0.15 and cont5==0:
            aux15 = float(valores[9])-0.15
            if aux15 < aux25:
                y_15 = int(valores[0])
                aux25 = aux15
                x_15 = float(valores[9])
                d_15 = float(valores[10])
        elif cont5==0 and float(valores[9])<0.15:
            y_25 = int(valores[0])
            #print(y_2)
            x_25 = float(valores[9])
            d_25 = float(valores[10])
            cont5 += 1
    
    ref_arquivo.close()

    Y1 = y_11 + ((y_11 - y_21)/(x_11 - x_21))*(0.15-x_11)
    Y2 = y_12 + ((y_12 - y_22)/(x_12 - x_22))*(0.15-x_12)
    Y3 = y_13 + ((y_13 - y_23)/(x_13 - x_23))*(0.15-x_13)
    Y4 = y_14 + ((y_14 - y_24)/(x_14 - x_24))*(0.15-x_14)
    Y5 = y_15 + ((y_15 - y_25)/(x_15 - x_25))*(0.15-x_15)

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

    #Especie 5:
    if (x_15-15) > (15-x_25):
        Z5 = (Y5*d_15)/x_15
    else:
        Z5 = (Y5*d_25)/x_25
    
    if cont == 0:
        y1[1] = str(Y1)
        y1[2] = str(Z1)
        y1[3] = str(Y2)
        y1[4] = str(Z2)
        y1[5] = str(Y3)
        y1[6] = str(Z3)
        y1[7] = str(Y4)
        y1[8] = str(Z4)
        y1[9] = str(Y5) 
        y1[10] = str(Z5)
    elif cont == 1:
        y2[1] = str(Y1)
        y2[2] = str(Z1)
        y2[3] = str(Y2)
        y2[4] = str(Z2)
        y2[5] = str(Y3)
        y2[6] = str(Z3)
        y2[7] = str(Y4)
        y2[8] = str(Z4)
        y2[9] = str(Y5) 
        y2[10] = str(Z5)
    elif cont == 2:
        y3[1] = str(Y1)
        y3[2] = str(Z1)
        y3[3] = str(Y2)
        y3[4] = str(Z2)
        y3[5] = str(Y3)
        y3[6] = str(Z3)
        y3[7] = str(Y4)
        y3[8] = str(Z4)
        y3[9] = str(Y5) 
        y3[10] = str(Z5)
    elif cont == 3:
        y4[1] = str(Y1)
        y4[2] = str(Z1)
        y4[3] = str(Y2)
        y4[4] = str(Z2)
        y4[5] = str(Y3)
        y4[6] = str(Z3)
        y4[7] = str(Y4)
        y4[8] = str(Z4)
        y4[9] = str(Y5) 
        y4[10] = str(Z5)
    elif cont == 4:
        y5[1] = str(Y1)
        y5[2] = str(Z1)
        y5[3] = str(Y2)
        y5[4] = str(Z2)
        y5[5] = str(Y3)
        y5[6] = str(Z3)
        y5[7] = str(Y4)
        y5[8] = str(Z4)
        y5[9] = str(Y5) 
        y5[10] = str(Z5)
    elif cont == 5:
        y6[1] = str(Y1)
        y6[2] = str(Z1)
        y6[3] = str(Y2)
        y6[4] = str(Z2)
        y6[5] = str(Y3)
        y6[6] = str(Z3)
        y6[7] = str(Y4)
        y6[8] = str(Z4)
        y6[9] = str(Y5) 
        y6[10] = str(Z5)
    elif cont == 6:
        y7[1] = str(Y1)
        y7[2] = str(Z1)
        y7[3] = str(Y2)
        y7[4] = str(Z2)
        y7[5] = str(Y3)
        y7[6] = str(Z3)
        y7[7] = str(Y4)
        y7[8] = str(Z4)
        y7[9] = str(Y5) 
        y7[10] = str(Z5)
    elif cont == 7:
        y8[1] = str(Y1)
        y8[2] = str(Z1)
        y8[3] = str(Y2)
        y8[4] = str(Z2)
        y8[5] = str(Y3)
        y8[6] = str(Z3)
        y8[7] = str(Y4)
        y8[8] = str(Z4)
        y8[9] = str(Y5) 
        y8[10] = str(Z5)
    elif cont == 8:
        y9[1] = str(Y1)
        y9[2] = str(Z1)
        y9[3] = str(Y2)
        y9[4] = str(Z2)
        y9[5] = str(Y3)
        y9[6] = str(Z3)
        y9[7] = str(Y4)
        y9[8] = str(Z4)
        y9[9] = str(Y5) 
        y9[10] = str(Z5)
    elif cont == 9:
        y10[1] = str(Y1)
        y10[2] = str(Z1)
        y10[3] = str(Y2)
        y10[4] = str(Z2)
        y10[5] = str(Y3)
        y10[6] = str(Z3)
        y10[7] = str(Y4)
        y10[8] = str(Z4)
        y10[9] = str(Y5) 
        y10[10] = str(Z5)
    elif cont == 10:
        y11[1] = str(Y1)
        y11[2] = str(Z1)
        y11[3] = str(Y2)
        y11[4] = str(Z2)
        y11[5] = str(Y3)
        y11[6] = str(Z3)
        y11[7] = str(Y4)
        y11[8] = str(Z4)
        y11[9] = str(Y5) 
        y11[10] = str(Z5)                

#for j in range(11):
#    print(y1[j])

espaco = ' '
quebra = " \n"

for i in range(11):
    if i==0:
        for j in range(11):
            lines = y1[j],espaco
            file_write.writelines(lines)
        file_write.writelines(quebra)
    elif i==1:
        for j in range(11):
            lines = y2[j] + espaco
            file_write.writelines(lines)
        file_write.writelines(quebra)
    elif i==2:
        for j in range(11):
            lines = y3[j] + espaco
            file_write.writelines(lines)
        file_write.writelines(quebra)
    elif i==3:
        for j in range(11):
            lines = y4[j] + espaco
            file_write.writelines(lines)
        file_write.writelines(quebra)
    elif i==4:
        for j in range(11):
            lines = y5[j] + espaco
            file_write.writelines(lines)
        file_write.writelines(quebra)
    elif i==5:
        for j in range(11):
            lines = y6[j] + espaco
            file_write.writelines(lines)
        file_write.writelines(quebra)
    elif i==6:
        for j in range(11):
            lines = y7[j] + espaco
            file_write.writelines(lines)
        file_write.writelines(quebra)
    elif i==7:
        for j in range(11):
            lines = y8[j] + espaco
            file_write.writelines(lines)
        file_write.writelines(quebra)
    elif i==8:
        for j in range(11):
            lines = y9[j] + espaco
            file_write.writelines(lines)
        file_write.writelines(quebra)
    elif i==9:
        for j in range(11):
            lines = y10[j] + espaco
            file_write.writelines(lines)
        file_write.writelines(quebra)
    elif i==10:
        for j in range(11):
            lines = y11[j] + espaco
            file_write.writelines(lines)
        file_write.writelines(quebra)

file_write.close()