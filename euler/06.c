#include <stdio.h>

int main()
{
	int i, ssum = 0, sqrs = 0, dif;
	for (i = 0; i <= 100; i ++) {
		ssum += (i * i);
		sqrs += i;
	}
	sqrs *= sqrs;
	dif = sqrs - ssum;
	printf("%d\n%d\n%d\n", ssum, sqrs, dif);
	return 0;
}
