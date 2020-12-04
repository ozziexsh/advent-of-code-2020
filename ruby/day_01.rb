# frozen_string_literal: true

input = File.readlines("#{__dir__}/../inputs/day_01.txt").map(&:to_i)

def part_one(numbers)
  result = numbers.detect do |num|
    has_pair = numbers.include?(2020 - num)
    break num if has_pair
  end
  result * (2020 - result)
end

def part_two(numbers)
  num_one =  num_two = num_three = nil

  numbers.each do |num|
    num_two = numbers.detect { |i| numbers.include?(2020 - (num + i)) }
    num_three = 2020 - num - num_two unless num_two.nil?
    num_one = num unless num_two.nil?
    break unless num_three.nil?
  end

  num_one * num_two * num_three
end

puts part_one(input)
puts part_two(input)
