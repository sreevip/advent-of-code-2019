# frozen_string_literal: true

def part1
  file = File.open('../input/2019_day08.input')
  line = file.readlines.last
  file.close

  rows = 6
  cols = 25
  area = rows * cols

  num_layers = line.length / area

  min_layer = { text: '', zeros: area }
  res = -1
  (0..num_layers - 1).each do |i|
    layer = line[i * area..(i + 1) * area - 1]
    char_count = layer.split('').group_by { |c| c }
                      .map { |k, v| [k, v.length] }.to_h
    if char_count['0'] < min_layer[:zeros]
      min_layer[:zeros] = char_count['0']
      res = char_count['1'] * char_count['2']
    end
  end
  res
end

def part2
  file = File.open('../input/2019_day08.input')
  line = file.readlines.last
  file.close

  rows = 6
  cols = 25
  area = rows * cols

  num_layers = line.length / area

  result = Array.new(area, 2)

  (0..num_layers).each do |i|
    p_i = 0

    layer = line[i * area..(i + 1) * area - 1].split('')
    layer.each do |p|
      result[p_i] = p.to_i if result[p_i] == 2
      p_i += 1
    end
  end

  (0..rows).each do |i|
    row = result[i * cols..(i + 1) * cols - 1].to_s
    puts "#{row}\n".gsub("\s", '').gsub(',', ' ').gsub('0', ' ').gsub('1', 'X')
  end

  nil
end

puts "Part1: #{part1}"
puts "Part2: #{part2}"
