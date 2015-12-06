#!/usr/bin/env ruby

# Houses are represented by a hash. The key is a house's coordinates, and its
# associated value is true when the house received a present.  The initial house
# already has a present.

# Each line corresponds to a (test) case
File.foreach('puzzle3.input') do |line|
  directions, expected_number_of_houses_with_presents = line.split(':')
  santas = [[0, 0], [0, 0]]
  santas_turn = true
  santa = santas_turn ? 0 : 1
  houses = { "#{santas[santa][0]},#{santas[santa][1]}" => true }
  directions.each_char do |direction|
    case direction
    when '<' then santas[santa][0] -= 1
    when '^' then santas[santa][1] += 1
    when '>' then santas[santa][0] += 1
    when 'v' then santas[santa][1] -= 1
    end
    houses["#{santas[santa][0]},#{santas[santa][1]}"] = true
    santas_turn = !santas_turn
    santa = santas_turn ? 0 : 1
  end

  houses_with_presents = houses.length
  if expected_number_of_houses_with_presents.nil?
    puts "Houses with presents: #{houses_with_presents}"
  else
    if houses_with_presents == expected_number_of_houses_with_presents.to_i
      result = 'OK'
    else
      result = 'FAILED. ' \
        "expected: #{expected_number_of_houses_with_presents.to_i}, " \
        "actual: #{houses_with_presents}"
    end
    puts result
  end
end
