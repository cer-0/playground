#!/usr/bin/env ruby

total = 0
File.open('1.input').each_line do |l|
  total += l.to_i / 3 - 2
end
p total
