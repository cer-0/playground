#!/usr/bin/env ruby

total = 0
File.open('1.input').each_line do |l|
  current_module, remainig = l.to_i, current_module
  loop do
    remainig = (remainig / 3) - 2
    total += remainig
    break if remainig <= 6
  end
end
p total
