#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int generatePin() 
{
	//https://www.geeksforgeeks.org/rand-and-srand-in-ccpp/
	srand(time(0));
	return rand();
}


int main()
{
	printf("%ld", generatePin());
	return 0;
}