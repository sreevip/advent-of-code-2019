# frozen_string_literal: true

def part1
  file = File.open("../input/2019_day01.input")
  masses = file.readlines.map(&:to_i)
  file.close

  masses.reduce(0) { |sum, mass| sum + mass / 3 - 2 }
end

def part2
  file = File.open("../input/2019_day01.input")
  masses = file.readlines.map(&:to_i)
  file.close

  sum = 0
  masses.each do |mass|
    while mass > 8
      sum = sum + mass / 3 - 2
      mass = mass / 3 - 2
    end
  end
  sum
end

puts "Part1: #{part1}"
puts "Part2: #{part2}"
