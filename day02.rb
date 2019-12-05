# frozen_string_literal: true

$input = [1, 0, 0, 3, 1, 1, 2, 3, 1, 3, 4, 3, 1, 5, 0, 3, 2, 10, 1, 19, 1, 19, 5, 23, 1, 23, 9, 27, 2, 27, 6, 31, 1, 31, 6, 35, 2, 35, 9, 39, 1, 6, 39, 43, 2, 10, 43, 47, 1, 47, 9, 51, 1, 51, 6, 55, 1, 55, 6, 59, 2, 59, 10, 63, 1, 6, 63, 67, 2, 6, 67, 71, 1, 71, 5, 75, 2, 13, 75, 79, 1, 10, 79, 83, 1, 5, 83, 87, 2, 87, 10, 91, 1, 5, 91, 95, 2, 95, 6, 99, 1, 99, 6, 103, 2, 103, 6, 107, 2, 107, 9, 111, 1, 111, 5, 115, 1, 115, 6, 119, 2, 6, 119, 123, 1, 5, 123, 127, 1, 127, 13, 131, 1, 2, 131, 135, 1, 135, 10, 0, 99, 2, 14, 0, 0]

def part1
  input = Marshal.load(Marshal.dump($input))
  input[1] = 12
  input[2] = 2

  i = 0
  while input[i] != 99
    if input[i] == 1
      input[input[i + 3]] = input[input[i + 1]] + input[input[i + 2]]
    elsif input[i] == 2
      input[input[i + 3]] = input[input[i + 1]] * input[input[i + 2]]
    end
    i += 4
  end
  input[0]
end

def part2
  expected = 19690720

  (0..99).each do |n|
    (0..99).each do |v|
      input = Marshal.load(Marshal.dump($input))
      input[1] = n
      input[2] = v
      i = 0
      while input[i] != 99
        if input[i] == 1
          input[input[i + 3]] = input[input[i + 1]] + input[input[i + 2]]
        elsif input[i] == 2
          input[input[i + 3]] = input[input[i + 1]] * input[input[i + 2]]
        end
        i += 4
      end
      return n * 100 + v if input[0] == expected
    end
  end
end

puts "Part1: #{part1}"
puts "Part2: #{part2}"
