#!/usr/bin/env ruby
#
# My previous idea was pretty complicated, I tried to add letters to an array and see if
# there were zero duplicates, good for the first part, but not useful for the second.
# George suggested using a hash, this made things so much easier.

sum_count = 0
people_counter = 0
questions_encountered = Hash.new(0)
questions_everyone_answered = 0

File.foreach("6.input", chomp: true) { |line|
  if not line.empty?
    line.each_char { |char| questions_encountered[char] += 1 }
    people_counter += 1
  else
    questions_encountered.each_pair { |key, val|
      questions_everyone_answered += 1 if val == people_counter
    }
    sum_count += questions_encountered.keys.length
    questions_encountered = Hash.new(0)
    people_counter = 0
  end
}

p sum_count, questions_everyone_answered
