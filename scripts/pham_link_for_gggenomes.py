import sys

# Abrimos ambos ficheros en modo lectura
with open(sys.argv[1], 'r') as file1, open(sys.argv[2], 'r') as file2:
    # Leemos las líneas de ambos ficheros
    lines1 = file1.readlines()
    lines2 = file2.readlines()

#file3 = open(sys.argv[3], 'w')

# Iteramos sobre cada línea de ambos ficheros
for line1 in lines1:
    cols1 = line1.strip().split('\t')  # Dividimos por tabulador la línea del primer fichero
    for line2 in lines2:
        cols2 = line2.strip().split('\t')  # Dividimos por tabulador la línea del segundo fichero
        if cols1[9] == cols2[9]:
        #if cols1[10] == cols2[10]:
            #new_line=str(line1.strip() + '\t' + line2.strip())  # Escribimos en file3 la combinación de ambas líneas
            #print(cols1[10])
            #print(cols2[10])
            #print(new_line)
            #print(cols1[9])
            #print(cols2[9])
            new_line=str(line1.strip() + '\t' + line2.strip())  # Escribimos en file3 la combinación de ambas líneas
            print(new_line)
#file3.close()
