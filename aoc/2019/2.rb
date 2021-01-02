#!/usr/bin/env ruby

codes = File.read("2.input").split(",").map(&:to_i)
codes[1], codes[2] = 12, 2
# codes.each_with_index do |oc, i|
(0..codes.length - 1).step(4) do |i|
  # print "#{codes.slice(i, 4)}\n"
  case codes[i]
  when 99
    break
  when 1
    pos_1 = codes[i+1]
    pos_2 = codes[i+2]
    pos_3 = codes[i+3]
    codes[pos_3] = codes[pos_1] + codes[pos_2]
  when 2
    pos_1 = codes[i+1]
    pos_2 = codes[i+2]
    pos_3 = codes[i+3]
    codes[pos_3] = codes[pos_1] * codes[pos_2]
  else
    print ""
  end
end
p codes[0]
