#!/usr/bin/env ruby
#
# For part 1 sort the output, I could't find a neat way
# of doing this with something like '.max'. ¯\_(ツ)_/¯
#
# For part 2 just generate a sequence from 84 up to 866
# and find which number from that sequence isn't in the
# output of this program. ¯\_(ツ)_/¯

def find_pos(characters, min, max)
  characters.each_char { |char|
    if char == 'F' || char == 'L'
      max = ((max - min) / 2) + min
    elsif char == 'B' || char == 'R'
      min = (((max - min) / 2) + min) + 1
    end
  }
  # p "DBG: col = #{max}"
  return min
end

def find_seat_id(row, column)
  return ((row * 8) + column)
end

File.foreach("5.input", chomp: true) { |line|
  p find_seat_id(find_pos(line[0..-4], 0, 127), find_pos(line[-3..-1], 0, 7))
}
