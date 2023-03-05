#!/usr/bin/env ruby

grid = []
File.foreach("grid") do |line|
  temp_row = []
  line.split.each do |num|
    temp_row << num.to_i
  end
  grid << temp_row
end

def prod(array)
  res = 1
  array.each { |i| res *= i }
  return res
end

grid.each do |j|
  j.each do |i|
    j.map! { |x| x > 0 && x < 10 ? 1 : x }
  end
end

greatest = 0
grid.each do |row|
  (0).upto(16) do |i|
    break if row[i, 4].include?(0)
    greatest = prod(row[i, 4]) if prod(row[i, 4]) > greatest
  end
end

grid.transpose.each do |row|
  (0).upto(16) do |i|
    break if row.include?(0)
    greatest = prod(row[i, 4]) if prod(row[i, 4]) > greatest
  end
end

(0).upto(16) do |r|
  (r).upto(16) do |i|
    temp_arr = []
    (0).upto(3) do |j|
      temp_arr << grid[r+j][i+j]
    end
    greatest = prod(temp_arr) if prod(temp_arr) > greatest
  end
end

(3).upto(19) do |r|
  (0).upto(16) do |i|
    temp_arr = []
    (0).upto(3) do |j|
      temp_arr << grid[r-j][i+j]
    end
    greatest = prod(temp_arr) if prod(temp_arr) > greatest
  end
end
p greatest
