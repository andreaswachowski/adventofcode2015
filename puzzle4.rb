#!/usr/bin/env ruby
require 'digest'

File.foreach('puzzle4.input') do |line|
  prefix, expected = line.split(':')
  prefix.chomp!
  expected = expected.to_i unless expected.nil?
  postfix = 0
  digest = Digest::MD5.hexdigest "#{prefix}#{postfix}"
  until digest =~ /^00000/
    postfix += 1
    digest = Digest::MD5.hexdigest "#{prefix}#{postfix}"
  end
  if expected.nil?
    puts "Postfix: #{postfix}, digest: #{digest}"
  else
    if postfix == expected
      puts 'OK'
    else
      puts "FAILED. expected: #{expected}, actual: #{postfix}"
    end
  end
end
