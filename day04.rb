# frozen_string_literal: true

def part1
  a = 193651
  b = 649729

  matches = 0
  (a..b).each do |i|
    digits = i.to_s
    has_duplicate = digits.split('').uniq.length < 6
    next unless has_duplicate

    is_not_match = (0..4).map do |j|
      digits[j] <= digits[j + 1]
    end.include?(false)

    matches += 1 unless is_not_match
  end
  matches
end

def part2
  a = 193651
  b = 649729

  matches = 0
  (a..b).each do |i|
    digits = i.to_s

    has_duplicate_only = false
    (0..9).each do |d|
      regex2 = /\d*#{d}{2}\d*/
      regex3 = /\d*#{d}{3}\d*/
      has_duplicate_only ||= regex2.match?(digits) && !regex3.match?(digits)
    end
    next unless has_duplicate_only

    is_match = true
    (0..4).map do |j|
      is_match &&= digits[j] <= digits[j + 1]
    end

    matches += 1 unless is_match
  end
  matches
end

puts "Part1: #{part1}"
puts "Part2: #{part2}"
