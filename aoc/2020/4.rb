#!/usr/bin/env ruby

def validate_year(field, number)
  case field
  when 'byr'
    return true if number >= 1920 && number <= 2002
  when 'iyr'
    return true if number >= 2010 && number <= 2020
  when 'eyr'
    return true if number >= 2020 && number <= 2030
  else return false
  end
end

def validate_height(number, measure_type)
  case measure_type
  when 'cm'
    return true if number >= 150 && number <= 193
  when 'in'
    return true if number >= 59 && number <= 76
  else return false
  end
end

def validate_hair_color(hcl)
  return true if hcl.match?(/^#[0-9a-f]{6}/)
  return false
end

def validate_eye_color(ecl)
  return true if ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include?(ecl)
  return false
end

def validate_passport_id(pid)
  return true if pid.match?(/^\d{9}$/)
  return false
end

def validate_field(key, value)
  case key
  when 'byr', 'iyr', 'eyr'
    validate_year(key, value.to_i)
  when 'hgt'
    validate_height(value[0..-3].to_i, value[-2..-1])
  when 'hcl'
    validate_hair_color(value)
  when 'ecl'
    validate_eye_color(value)
  when 'pid'
    validate_passport_id(value)
  when 'cid'
    return true
  else return false
  end
end

def validate_passport(passport_hash)
  passport_hash.each_pair { |key, value|
    # p "DBG: validating field #{key} with value #{value}"
    return false if ! validate_field(key, value) # false if field isn't valid
  }
  # p "DBG: All fields validated!"
  return true # true in case each field is valid
end

passport_data = Hash.new
passport_data = { 'ecl' => '', 'pid' => '', 'eyr' => '', 'hcl' => '',
                  'byr' => '', 'iyr' => '', 'hgt' => '', 'cid' => '' }
temporal_string = ''
valid_passports = 0
valid_passports_with_valid_fields = 0

File.foreach("4.input", chomp: true) do |line|
  if not line.empty?
    temporal_string.concat(line, ' ')
  else
    p "Processing '#{temporal_string}' fields"
    temporal_string.split().each { |field|
      passport_data[field.split(':')[0]] = field.split(':')[1]
    }
    if not passport_data.has_value?(nil)
      valid_passports_with_valid_fields += 1 if validate_passport(passport_data)
      valid_passports += 1
    end
    passport_data.each_pair { |key, val| passport_data[key] = nil }
    passport_data['cid'] = ''
    temporal_string = ''
  end
end

p "#{valid_passports} valid passports"
p "#{valid_passports_with_valid_fields} valid passports with valid fields"
