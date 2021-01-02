#!/usr/bin/env ruby

list = ['1-3 a: abcde', '1-3 b: cdefg', '2-9 c: ccccccccc']

def validate_password_1(min, max, letter, password)
  if password.count(letter) <= max && password.count(letter) >= min
    return true
  end
end

def validate_password_2(index1, index2, letter, password)
  if letter == password[index1 - 1]
    if letter == password[index2 - 1]
      return false
    else
      return true
    end
  elsif letter == password[index2 - 1]
    return true
  end
end

valid_passwords = 0

File.foreach("2.input") do |line|
  min = line.split(":")[0].split("-")[0].to_i
  max = line.split(":")[0].split()[0].split("-")[-1].to_i
  letter = line.split()[1][0]
  password = line.split(":")[-1][1..-1].chomp
  if validate_password_2(min, max, letter, password)
    valid_passwords += 1
  end
end

p valid_passwords
