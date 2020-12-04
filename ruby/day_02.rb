# frozen_string_literal: true

input = File.readlines("#{__dir__}/../inputs/day_02.txt")

def part_one(passwords)
  passwords.reduce(0) do |total, str|
    length_piece, letter_piece, password = str.split(' ')
    min, max = length_piece.split('-')
    letter, = letter_piece.split(':')
    next total unless (password.count(letter) >= min.to_i) && (password.count(letter) <= max.to_i)

    total + 1
  end
end

def password_valid(password, letter, index_one, index_two)
  first_match = password[index_one - 1] == letter
  second_match = password[index_two - 1] == letter

  (first_match && !second_match) || (!first_match && second_match)
end

def part_two(passwords)
  passwords.reduce(0) do |total, str|
    length_piece, letter_piece, password = str.split(' ')
    index_one, index_two = length_piece.split('-')
    letter, = letter_piece.split(':')
    next total unless password_valid(password, letter, index_one.to_i, index_two.to_i)

    total + 1
  end
end

puts part_one(input)
puts part_two(input)
