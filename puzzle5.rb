#!/usr/bin/env ruby

# Santa needs help figuring out which strings in his text file are naughty or
# nice.
#
# A nice string is one with all of the following properties:
#
# * It contains at least three vowels (aeiou only), like aei, xazegov, or
#   aeiouaeiouaeiou.
# * It contains at least one letter that appears twice in a row, like xx,
#   abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
# * It does not contain the strings ab, cd, pq, or xy, even if they are part of
#   one of the other requirements.
#
# For example:
#
# * ugknbfddgicrmopn is nice because it has at least three vowels
#   (u...i...o...), a double letter (...dd...), and none of the disallowed
#   substrings.
# * aaa is nice because it has at least three vowels and a double letter, even
#   though the letters used by different rules overlap.
# * jchzalrnumimnmhp is naughty because it has no double letter.
# * haegwjzuvuyypxyu is naughty because it contains the string xy.
# * dvszwmarrgswjxmb is naughty because it contains only one vowel.
#
# How many strings are nice?

min_vowels = 3
blacklist = %w(ab cd pq xy)
number_of_nice_strings = 0

File.foreach('puzzle5.input') do |line|
  input, expected = line.split(':').map(&:chomp)
  input = input.chars

  vowels = 0
  twice = false
  contains_blacklisted = false
  i = 0
  while i < input.length
    c = input[i]
    vowels += 1 if c =~ /[aeiou]/
    twice = twice || i > 0 && c == input[i-1]
    contains_blacklisted = contains_blacklisted ||
      (i > 0 &&
       blacklist.include?(input[i - 1..i].join))
    nice = vowels >= min_vowels && twice && !contains_blacklisted
    i += 1
  end

  number_of_nice_strings +=1 if nice

  actual = nice ? '1' : '0'
  unless expected.nil?
    if actual == expected
      puts 'OK'
    else
      puts "FAILED. expected: #{expected}, actual: #{actual}"
    end
  end
end

puts "Number of nice strings: #{number_of_nice_strings}"
