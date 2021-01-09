all:
	gcc -o hans_ii_midi main.c bsc.c -lpigpio -lrt -lpthread