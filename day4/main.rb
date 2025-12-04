file_content = File.read("input.txt")

num_rows = file_content.lines.length
num_cols = file_content.lines[0].strip.length

puts "num_rows=#{num_rows}, num_cols=#{num_cols}"

# initialize grid with one extra row and column so that we can avoid
# complicated boundary checking later on
grid = Array.new(num_rows + 1) { Array.new(num_cols + 1, 0) }
adjacency_grid = Array.new(num_rows) { Array.new(num_cols, 0) }

file_content.lines.map(&:strip).each_with_index do |row, row_index|
  row.chars.each_with_index do |cell, col_index|
    grid[row_index][col_index] = (cell == "@" ? 1 : 0)
  end
end

total_rolls_removed = 0
while true
  num_accessible = 0

  for row_index in 0..(num_rows - 1) do
    for col_index in 0..(num_cols - 1) do
      num_adjacent = (
        grid[row_index - 1][col_index - 1] + grid[row_index - 1][col_index] + grid[row_index - 1][col_index + 1] +
        grid[row_index][col_index - 1] + grid[row_index][col_index + 1] +
        grid[row_index + 1][col_index - 1] + grid[row_index + 1][col_index] + grid[row_index + 1][col_index + 1] 
      )

      adjacency_grid[row_index][col_index] = num_adjacent
      if grid[row_index][col_index] == 1 && num_adjacent < 4
        num_accessible += 1
        total_rolls_removed += 1
        grid[row_index][col_index] = 0
      end

    end
  end

  break if num_accessible == 0
end

puts total_rolls_removed
puts adjacency_grid.map {|row| row.map {|cell| cell > 0 ? "@" : "."}}.map(&:join)
