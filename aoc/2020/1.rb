#!/usr/bin/env ruby
#
# TODO: improve algorithm (avoid brute forcing)

expenses = File.read("1.input").split.map(&:to_i)

def find_two_entries(expenses)
  expenses.each do |entry1|
    expenses.each do |entry2|
      if entry1 + entry2 == 2020
        return entry1 * entry2
      end
    end
  end
end

p find_two_entries(expenses)

def find_three_entries(expenses)
  expenses.each do |entry1|
    expenses.each do |entry2|
      expenses.each do |entry3|
        if entry1 + entry2 + entry3 == 2020
          return entry1 * entry2 * entry3
        end
      end 
    end
  end
end

p find_three_entries(expenses)
