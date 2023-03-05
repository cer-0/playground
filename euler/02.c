#include <stdio.h>

int main()
{
	int a = 1, b = 2, c = 0, sum = 2;
	do {
		c = a + b;
		a = b;
		b = c;
		if ( c % 2 == 0) {
			sum += c;
		}
	} while ( b < 4000000 );
	printf("%d\n", sum);
	return 0;
}
