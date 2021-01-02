#!/usr/bin/env ruby

def computer(noun, verb)
  codes = File.read("2.input").split(",").map(&:to_i)
  codes[1], codes[2] = noun, verb
  (0..codes.length - 1).step(4) do |i|
    break if codes[i] == 99
    pos_1, pos_2, pos_3 = codes[i+1], codes[i+2], codes[i+3]
    if codes[i] == 1
      codes[pos_3] = codes[pos_1] + codes[pos_2]
    elsif codes[i] == 2
      codes[pos_3] = codes[pos_1] * codes[pos_2]
    end
  end
  return codes[0]
end

(0..99).step do |i|
  (0..99).step do |j|
    if computer(i, j) == 19690720
      print "#{100 * i + j}\n"
      break
    end
  end
end

