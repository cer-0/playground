#!/usr/bin/env python

import math


def is_prime(n):
    square_root = math.floor(math.sqrt(n)) + 1
    if n == 1:
        return False
    if n < 4:
        return True
    if n > 2 and n % 2 == 0:
        return False
    for i in range(3, square_root, 2):
        if n % i == 0:
            return False
    return True


limit = 2 * (10 ** 6)
sum = 2
for i in range(3, limit, 2):
    if is_prime(i):
        sum += i
print(sum)
