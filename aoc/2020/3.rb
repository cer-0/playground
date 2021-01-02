#!/usr/bin/env ruby

def count_trees_in_slope(right, down, arboreal_map)
  row = 0
  column = 0
  trees_encountered = 0
  position = arboreal_map[row][column]

  while row < (arboreal_map.length() - down) do
    right.times do |column_counter|
      column += 1
      column = column % arboreal_map[0].length()
    end
    row += down
    position = arboreal_map[row][column]
    if position == "#"
      # p "tree at #{column}, #{row}"
      trees_encountered += 1 
    end
  end
  p "Found #{trees_encountered} trees"
  return trees_encountered
end

geology = []

File.foreach("3.input") do |line|
  geology << line.chomp().split('')
end

slopes_to_test = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
product_result = 1

slopes_to_test.each do |slope|
  p "testing slope: #{slope[0]} right, #{slope[1]} down"
  product_result *= count_trees_in_slope(slope[0], slope[1], geology)
  p product_result
end
