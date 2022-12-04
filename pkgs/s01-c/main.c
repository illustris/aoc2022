#define BSZ 1000

#include <stdio.h>
#include <string.h>

int getInt() {
	char inp[BSZ];
	if (!fgets(inp, BSZ, stdin))
		return -2;
	if (inp[0] == '\n')
		return -1;
	return atoi(inp);
}

int maxCal() {
	int inp, sum = 0, maxsum = 0;
	while ((inp = getInt()) > -2) {
		if(inp >= 0)
			sum+=inp;
		else {
			maxsum = (sum > maxsum ? sum : maxsum);
			sum = 0;
		}
	}
	return maxsum;
}

inline void shiftr(int *arr, int n) {
	/* printf("shiftr(arr, %d)\n", n); */
	for(int i=n-1; i>0; i--) {
		/* printf("shift %d->%d\n", i-1, i); */
		arr[i] = arr[i-1];
	}
}

inline void insert(int *arr, int n, int new) {
	// could be replaced with binary search
	for(int i=0;i<n;i++) {
		if (arr[i] < new) {
			shiftr(arr, n-i);
			arr[i] = new;
			break;
		}
	}
}

/* void printTopN(int *arr, int n){ */
/* 	printf("[ "); */
/* 	for(int i=0;i<n;i++) */
/* 		printf("%d ", arr[i]); */
/* 	printf("]\n"); */
/* } */

int sumTopN(int n) {
	int topn[n], sum = 0, inp;
	memset(topn, 0, sizeof(topn));
	while ((inp = getInt()) > -2) {
		if(inp >= 0)
			sum+=inp;
		else {
			/* printTopN(topn, n); */
			insert(topn, n, sum);
			sum = 0;
			/* printTopN(topn, n); */
		}
	}
	int tot = 0;
	for(int i=0;i<n;i++) {tot+=topn[i];}
	return tot;
}

int main () {
	// part 1
	// printf("%d\n", maxCal());
	// part 2
	printf("%d\n", sumTopN(3));
}
