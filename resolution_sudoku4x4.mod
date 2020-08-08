# Solution de grille finale
var x{i in 1..16, j in 1..16, k in 1..16 } binary;

# Grille initial
param G{i in 1..16, j in 1..16};

# Un seul chiffre par case
s.t. valeurs {i in 1..16, j in 1..16}: sum {k in 1..16} x[i,j,k] = 1;
# Un meme chiffre par ligne
s.t. lignes {i in 1..16, k in 1..16}: sum {j in 1..16} x[i,j,k] = 1;
# Un meme chiffre par colonne
s.t. colonnes {j in 1..16, k in 1..16}: sum {i in 1..16} x[i,j,k] = 1;
# Un meme chiffre par blocs de 3x3
s.t. blocs {xx in {0, 4, 8, 12}, yy in {0, 4, 8, 12}, k in 1..16}:
    sum {i in (xx+1)..(xx+4), j in (yy+1)..(yy+4)} x[i,j,k] = 1;
# Les chiffres vérifie la grille initial
s.t. grille {i in 1..16, j in 1..16: G[i,j]!=0}: x[i,j,G[i,j]]=1;

# Compute
solve;

# Affichage de la grille résolue
printf "\n------------------------------------\n";
for {i in 1..16} {
    for {j in 1..16} {
         for {k in 1..16 :x[i,j,k]==1} printf "%d", k;
         printf "\t";   
    }
    printf "\n";
    #printf "------------------------------------\n";
}

data;
param G: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 :=
1 0	0	1	0	0	0	0	3	0	0	0	0	0	15	0	9
2 0	10	0	0	1	0	2	0	16	0	3	7	6	0	8	0
3 0	0	4	0	0	6	0	9	0	5	0	0	0	0	16	0
4 0	7	0	5	12	0	8	0	0	0	0	13	0	10	0	0
5 0	0	0	0	5	0	0	0	0	3	0	0	7	0	0	0
6 0	9	0	0	11	0	7	1	0	2	0	0	0	5	0	10
7 4	0	7	16	0	0	10	0	6	0	0	0	0	1	0	0
8 0	5	0	0	0	3	0	2	0	0	4	16	0	0	15	0
9 5	0	0	6	0	13	0	0	4	0	0	12	0	11	0	1
10 0	3	0	0	0	0	0	0	0	0	15	0	9	0	12	0
11 8	0	16	0	3	0	0	6	0	1	0	0	2	0	0	0
12 0	0	0	7	0	15	4	0	0	0	10	0	0	0	0	8
13 11	0	0	0	10	0	0	0	0	8	0	1	0	16	0	12
14 0	0	2	0	0	16	0	0	5	0	0	11	0	0	1	0
15 0	8	0	0	2	0	0	11	0	0	6	9	0	3	0	0
16 0	0	6	0	0	0	3	0	0	4	0	0	8	0	14	0

;

end;
