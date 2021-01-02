#!/usr/bin/env ruby

wire_1, wire_2 = gets.chomp.split(','), gets.chomp.split(',')

d = {'U' => [0,1], 'D' => [0, -1], 'R' => [1, 0], 'L' => [-1, 0]}
coord_w1, coord_w2, = [], []

def manhattan(p1)
  return p1[0].abs + p1[1].abs
end

def trace(instruction, org_cc, map, store)
  times = instruction.slice(1..).to_i
  direction = instruction[0]
  (1..times).each do |iter|
    org_cc[0] += map[direction][0]
    org_cc[1] += map[direction][1]
    store << [org_cc[0],org_cc[1]]
  end
end

org_coord  = [0, 0]
wire_1.each do |i|
  trace(i, org_coord, d, coord_w1)
end

org_coord  = [0, 0]
wire_2.each do |i|
  trace(i, org_coord, d, coord_w2)
end

(coord_w1 & coord_w2).each { |i| print "#{manhattan(i)}\n" }
