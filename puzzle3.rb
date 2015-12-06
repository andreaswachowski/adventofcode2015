#!/usr/bin/env ruby

# Houses are represented via a hash. The key is a house's coordinates, and its
# associated value is true when the house received a present.  The initial house
# already has a present.

# Each line corresponds to a (test) case
File.foreach('puzzle3.input') do |line|
  directions, expected_number_of_houses_with_presents = line.split(':')
  x = y = 0
  houses = { "#{x},#{y}" => true }
  directions.each_char do |direction|
    case direction
    when '<' then x -= 1
    when '^' then y += 1
    when '>' then x += 1
    when 'v' then y -= 1
    end
    houses["#{x},#{y}"] = true
  end

  houses_with_presents = houses.length
  if expected_number_of_houses_with_presents.nil?
    puts "Houses with presents: #{houses_with_presents}"
  else
    if houses_with_presents == expected_number_of_houses_with_presents.to_i
      result = 'OK'
    else
      result = 'FAILED'
    end
    puts result
  end
end
