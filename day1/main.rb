dial_position = 50
total_num_zero_passes = 0

File.open("input.txt") do |file|
  file.each_line do |line|
    dial_position
    direction = line[0] == "L" ? -1 : 1
    num_clicks = line[1..].to_i

    distance_to_zero = dial_position == 0 ? 100 : (direction == 1 ? 100 - dial_position : dial_position)
    num_clicks_beyond_zero = num_clicks - distance_to_zero
    num_zero_passes = num_clicks_beyond_zero >= 0 ? (num_clicks_beyond_zero / 100).floor + 1 : 0
    new_dial_position = (dial_position + num_clicks * direction) % 100

    total_num_zero_passes += num_zero_passes
    
    dial_position = new_dial_position
  end
end

puts total_num_zero_passes

