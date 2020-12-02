# frozen_string_literal: true

input = File.readlines('day_01_input.txt').map(&:to_i)

result = input.detect do |num|
  has_pair = input.include?(2020 - num)
  break num if has_pair
end

puts result * (2020 - result)
