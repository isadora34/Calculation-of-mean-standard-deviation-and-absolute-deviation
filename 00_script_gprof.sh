#!/bin/bash
TAM=30
mkdir Gprof_Execucoes1
mkdir Gprof_Execucoes2
for ((j=1; j <= $TAM; j++))
do
	echo "Executando Soma $j..."
	gcc -pg -o programa1 somavetores1.c -fopenmp
	./programa1 >> saida1.txt
	gprof -p programa1 &> Gprof_profile1_$j.txt
	
	gcc -pg -o programa2 somavetores2.c -fopenmp
	./programa2 >> saida2.txt
	gprof -p programa2 &> Gprof_profile2_$j.txt
	
	mv Gprof_profile1_$j.txt Gprof_Execucoes1
	mv Gprof_profile2_$j.txt Gprof_Execucoes2 
done
mv Gprof_Execucoes1 Gprof
mv Gprof_Execucoes2 Gprof
rm gmon.out
mv programa1 Gprof
mv programa2 Gprof
mv saida1.txt Gprof
mv saida2.txt Gprof
cp somavetores1.c Gprof
cp somavetores2.c Gprof
