#!/usr/bin/env ruby

rules = []
r = Array.new()
# can_hold_gold_bag = []
# other_bags = []

File.foreach('7.input', chomp: true) do |rule|
  # rules << [rule.split(' contain ')[0][0..-6], rule.split
  r[rule.split(' contain ')[0]] = [rule.split(' contain ')[1].split(', ')]
end

pp r

# File.foreach('7.input', chomp: true) { |line|
#   if line.match?(/shiny gold/)
#     can_hold_gold_bag << [line.split(' contain ')[0],
#                           line.split(' contain ')[1].split(', ')]
#   else
#     rules << [line.split(' contain ')[0],
#               line.split(' contain ')[1].split(', ')]
#   end
# }

# # pp can_hold_gold_bag, '-'*80, rules, '-'*80

# rules.each { |outermost_bag|
#   outermost_bag[1].each { |bag|
#     can_hold_gold_bag.each { |bag_holding_goldbp|
#       if bag.include?(bag_holding_goldbp[0][0..-6]) && ! other_bags.include?(outermost_bag)
#         other_bags << outermost_bag
#       end
#     }
#   }
# }

# p other_bags.length + can_hold_gold_bag.length - 1
