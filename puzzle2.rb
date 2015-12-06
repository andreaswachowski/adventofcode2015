#!/usr/bin/env ruby
boxes = File.foreach('puzzle2.input')
# boxes = %w(2x3x4 1x1x10)

wrapping_paper_total = 0
ribbon_total = 0

boxes.each do |box|
  l, w, h = (box.split 'x').map(&:to_i)
  areas = [l * w, l * h, w * h]
  wrapping_paper = 2 * areas.inject(0, &:+) + areas.min
  sides = [l, w, h]
  ribbon = 2 * (sides.reduce(0, &:+) - sides.max) + sides.reduce(1, &:*)
  wrapping_paper_total += wrapping_paper
  ribbon_total += ribbon
  puts "Box #{box} needs #{wrapping_paper} wrapping paper and #{ribbon} ribbon"
end
puts "Wrapping paper, total: #{wrapping_paper_total}"
puts "Ribbon, total: #{ribbon_total}"
