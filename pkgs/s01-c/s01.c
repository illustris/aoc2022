#define BSZ 1000

#include <stdio.h>
#include <string.h>

int main () {
	int sum = 0, maxsum = 0;
	char inp[BSZ];
	while (fgets(inp, BSZ, stdin) != NULL) {
		/* printf("-----\ngot buff: %s\n-----\n",inp); */
		if(strlen(inp) && inp[0] != '\n') {
			/* printf("atoi(%s) = %d", inp, atoi(inp)); */
			sum+=atoi(inp);
		}
		else {
			maxsum = (sum > maxsum ? sum : maxsum);
			sum = 0;
		}
	}
	printf("%d\n", maxsum);
}
