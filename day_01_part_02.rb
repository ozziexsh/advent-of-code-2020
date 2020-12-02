# frozen_string_literal: true

input = File.readlines('day_01_input.txt').map(&:to_i)

num_one = nil
num_two = nil
num_three = nil

input.each do |num|
  num_two = input.detect { |i| input.include?(2020 - (num + i)) }
  num_three = 2020 - num - num_two unless num_two.nil?
  num_one = num unless num_two.nil?
  break unless num_three.nil?
end

puts num_one * num_two * num_three
