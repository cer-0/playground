#!/usr/bin/env ruby

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20

def divisible_by_all(l, n)
  (2..l).each do |i|
    return false if n % i != 0
  end
  return true
end

limit = ARGV[0].to_i
index = limit + 5

while true
  break if divisible_by_all(limit, index)
  index += 5
end
p index
