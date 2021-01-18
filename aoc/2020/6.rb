#!/usr/bin/env ruby

sum_count = 0
people_counter = 0
questions_encontered = Hash.new(0)
questions_everyone_answered = 0

File.foreach("6.input", chomp: true) { |line|
  if not line.empty?
    line.each_char { |char| questions_encontered[char] += 1 }
    people_counter += 1
  else
    questions_encontered.each_pair { |key, val|
      questions_everyone_answered += 1 if val == people_counter
    }
    sum_count += questions_encontered.keys.length
    questions_encontered = Hash.new(0)
    people_counter = 0
  end
}
p sum_count, questions_everyone_answered
