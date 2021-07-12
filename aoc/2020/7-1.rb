#!/usr/bin/env ruby
#
# Nasty code warning, I wrote this a couple of months before, but I never
# uploaded the file. 7-2.rb it's more decent, I think...

def matches_bag?(rule, bag) # bag should be a regex string
  return true if rule.match?(/#{bag}/)
end

def parse_name_bag(rule)
  return rule.split[0..1].join(' ')
end

def parse_inside_bags(rule)
  inside = []
  rule.split('contain')[1].split(',').each do |content|
    inside << parse_name_bag(content)
  end
end

def already_in_array?(rules, rule)
  return true if rules.include?(rule)
end

counter = 0
holding_gold_bag = []
other_bags = []

File.foreach("7.input") do |rule|
  if matches_bag?(rule, "shiny gold bag?")
    holding_gold_bag << rule
    counter += 1
  else
    other_bags << rule
  end
end

holding_gold_bag.each do |rule|
  bag = parse_name_bag(rule)
  other_bags.each do |second_rule|
    if matches_bag?(second_rule, bag)
      if not already_in_array?(holding_gold_bag, second_rule)
      counter += 1
      holding_gold_bag << second_rule
      end
    end
  end
end

p (counter - 1)
