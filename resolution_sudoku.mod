# Solution de grille finale
var x{i in 1..9, j in 1..9, k in 1.. 9 } binary;

# Grille initial
param G{i in 1..9, j in 1..9};

# Un seul chiffre par case
s.t. valeurs {i in 1..9, j in 1.. 9}: sum {k in 1..9} x[i,j,k] = 1;
# Un meme chiffre par ligne
s.t. lignes {i in 1..9, k in 1.. 9}: sum {j in 1..9} x[i,j,k] = 1;
# Un meme chiffre par colonne
s.t. colonnes {j in 1..9, k in 1.. 9}: sum {i in 1..9} x[i,j,k] = 1;
# Un meme chiffre par blocs de 3x3
s.t. blocs {xx in {0, 3, 6}, yy in {0, 3, 6}, k in 1..9}:
    sum {i in (xx+1)..(xx+3), j in (yy+1)..(yy+3)} x[i,j,k] = 1;
# Les chiffres vérifie la grille initial
s.t. grille {i in 1..9, j in 1.. 9: G[i,j]!=0}: x[i,j,G[i,j]]=1;

# Compute
solve;

# Affichage de la grille résolue
printf "\n------------------------------------\n";
for {i in 1.. 9} {
    for {j in 1..9} {
         for {k in 1..9 :x[i,j,k]==1} printf " %d ", k;
         printf "|";   
    }
    printf "\n";
    printf "------------------------------------\n";
}

data;
param G: 1 2 3 4 5 6 7 8 9 :=
1 0 0 0 0 0 0 0 0 1
2 0 0 0 0 0 0 0 2 3
3 0 0 4 0 0 5 0 0 0
4 0 0 0 1 0 0 0 0 0
5 0 0 0 0 3 0 6 0 0
6 0 0 7 0 0 0 5 8 0
7 0 0 0 0 6 7 0 0 0
8 0 1 0 0 0 4 0 0 0
9 5 2 0 0 0 0 0 0 0
;

# param G: 1 2 3 4 5 6 7 8 9 :=
# 1 0 7 0 0 0 0 0 0 6
# 2 0 0 0 0 6 9 0 3 0
# 3 5 0 0 0 7 0 0 4 8
# 4 4 0 0 0 9 0 7 0 0
# 5 0 0 0 0 0 0 0 6 0
# 6 8 6 0 1 3 0 0 0 0
# 7 6 0 8 0 0 0 0 5 3
# 8 0 0 0 9 0 0 8 0 0
# 9 9 4 0 0 1 3 6 7 2
# ;
end;
