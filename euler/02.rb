#!/usr/bin/env ruby

a = 1
b = 2
c = 0
sum = 2
while c < 4000000 do
  c = a + b
  a = b
  b = c
  if c % 2 == 0
    sum += c
  end
end
p sum
