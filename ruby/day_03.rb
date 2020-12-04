# frozen_string_literal: true

input = File.readlines("#{__dir__}/../inputs/day_03.txt").map { |line| line.split('').reject { |char| char == "\n" } }

def navigate_x(row, current_x, increment)
  return current_x + increment unless current_x + increment > row.length - 1

  amount_to_max = (row.length - 1) - current_x
  increment - amount_to_max - 1
end

def count_trees(map, slope_x, slope_y)
  x = 0
  y = 0
  trees = 0

  while y < map.length - 1
    y += slope_y
    x = navigate_x(map[y], x, slope_x)

    trees += 1 if map[y][x] == '#'
  end

  trees
end

# part 01
puts count_trees(input, 3, 1)

# part 02
puts count_trees(input, 1, 1) * count_trees(input, 3, 1) * count_trees(input, 5, 1) * count_trees(input, 7, 1) * count_trees(input, 1, 2)
