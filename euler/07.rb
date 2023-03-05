#!/usr/bin/env ruby

include Math

def is_prime(n)
  if n == 1
    return false
  elsif n == 2
    return true
  elsif n > 2 && n % 2 == 0
    return false
  else
    square_root = Math.sqrt(n).ceil
    (3..square_root).step(2) do |i|
      if n % i == 0
        return false
      end
    end
    return true
  end
end

n = ARGV[0].to_i

primes = []
(1..n*n+1).each do |i|
  break if primes.length == n
  primes << i if is_prime(i)
end
p primes[-1]
