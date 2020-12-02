# frozen_string_literal: true

input = File.readlines('day_02_input.txt')

total_valid_passwords = input.reduce(0) do |total, str|
  length_piece, letter_piece, password = str.split(' ')
  min, max = length_piece.split('-')
  letter, = letter_piece.split(':')
  next total unless (password.count(letter) >= min.to_i) && (password.count(letter) <= max.to_i)

  total + 1
end

puts total_valid_passwords
