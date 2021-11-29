#include <stdio.h>
#include <stdlib.h>

char name[16];

void bofme() {
	char payload[16];

	puts("What's your name?");
	printf("Name > ");
	fflush(stdout);
	scanf("%16s", name);
	printf("Hello, %s.\n", name);

	puts("Do you wanna build a snowman?");
	printf(" > ");
	fflush(stdout);
	scanf("%s", payload);
	printf("!!!%s!!!\n", payload);
	puts("Good.");
}

int main() {
	system("echo 'Welcome to BOF 102!'");
	bofme();
	return 0;
}
