#!/usr/bin/env ruby

t = 0
s = 0
1.step 100 do |i|
  s = i + s
  t = i**2 + t
end
p s**2, t, s**2 - t
