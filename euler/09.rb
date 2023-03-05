#!/usr/bin/env ruby
# This still needs to be improved
include Math

def find_duplet(n)
  n.downto(1).each do |i|
    (1..i).each do |k|
      if k*k + i*i == n*n && k < i
        return k, i if (k + i + n) == 1000
      else
        return 0, 0
      end
    end
  end
end

(1..1000).each do |i|
  c = i*i
  cs = Math.sqrt(c).truncate
  if find_duplet(cs) != [0,0]
    p find_duplet(cs)
  end
  # p "#{find_duplet(cs)} #{cs}"
end
