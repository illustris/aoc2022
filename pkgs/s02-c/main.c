#define BSZ 8

#include <stdio.h>
#include <string.h>

typedef enum {rock, paper, scissors} move;

typedef enum {lose, draw, win} outcome;

const outcomeScore[] = {0, 3, 6};

inline int getscore(int opponent, int player) {
	return ((1+opponent) % 3 == player) * 6 + (opponent == player) * 3;
}

int part1() {
	char inp[BSZ];
	move player, opponent;
	unsigned int tot_score = 0;
	while (fgets(inp, BSZ, stdin) != NULL) {
		opponent = inp[0] - 'A';
		player = inp[2] - 'X';
		tot_score += getscore(opponent, player) + player + 1;
	}
	return tot_score;
}

inline int getmove(move opponent, outcome out) {
	/* printf("getmove(%d, %d) = %d\n", opponent, out, (opponent + out +3 - 1) % 3); */
	return (opponent + out + 3 - 1) % 3;
}

int part2() {
	char inp[BSZ];
	move opponent, player;
	outcome out;
	unsigned int tot_score = 0;
	while (fgets(inp, BSZ, stdin) != NULL) {
		/* puts(inp); */
		opponent = inp[0] - 'A';
		out = inp[2] - 'X';
		player = getmove(opponent, out);
		/* printf("move: %c\n", 'A' + player); */
		tot_score += getscore(opponent, player) + player + 1;
	}
	return tot_score;
}

int main () {
	// part 1
	// printf("%d\n", part1());
	// part 2
	printf("%d\n", part2());
}

