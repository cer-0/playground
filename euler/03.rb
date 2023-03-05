#!/usr/bin/env ruby

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

string = `python sieve_eratosthenes.py 10000`.tr('\n[]', '')
primes = []
number = ARGV[0].to_i

string.split.each do |i|
  primes << i.to_i
end

factors = []
primes.each do |i|
  # Remove this comments and we have a prime factorization program XD
  # while number % i == 0 and number != 1
  if number % i == 0
    # n_number = number/i
    factors << i
  end
end
p factors
