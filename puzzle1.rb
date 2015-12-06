#!/usr/bin/env ruby
puzzle = File.foreach('puzzle1.txt').first(1)[0]

story = 0
pos = 0

while story != -1 && pos < puzzle.length do
  story += 1 if puzzle[pos] == '('
  story -= 1 if puzzle[pos] == ')'
  pos += 1
end

puts pos
