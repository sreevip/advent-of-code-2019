# frozen_string_literal: true

def parse_input
  file = File.open('../input/2019_day06.input')
  lines = file.readlines
  file.close

  regexp = /^(\w+)\)(\w+)$/
  lines.map do |line|
    line.match regexp
  end
end

def get_orb_count(system, root, level)
  return 0 if system[root].nil?

  system[root].map do |next_planet|
    level + get_orb_count(system, next_planet, level + 1)
  end.sum
end

def create_solar_system(orbits)
  system = {}
  centers = {}

  orbits.each do |orbit|
    center = orbit[1]
    rotater = orbit[2]
    if system[center].nil?
      system[center] = [rotater]
    else
      system[center] << rotater
    end
    centers[rotater] = center
  end

  [centers, system]
end

def part1
  orbits = parse_input

  centers, system = create_solar_system(orbits)

  center = orbits[0][1]
  center = centers[center] until centers[center].nil?

  get_orb_count(system, center, 1)
end

def part2
  orbits = parse_input
  centers, = create_solar_system(orbits)

  path = []
  planet_you = 'YOU'
  until planet_you.nil?
    planet_you = centers[planet_you]
    path << planet_you
  end

  steps = 0
  planet_san = 'SAN'
  until planet_san.nil?
    return steps + path.index(planet_san) - 1 if path.include?(planet_san)

    planet_san = centers[planet_san]
    steps += 1
  end
end

puts "Part1: #{part1}"
puts "Part2: #{part2}"
