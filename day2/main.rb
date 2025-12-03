sum_invalid_ids = 0

file_content = File.read("input.txt")
ranges = file_content.split(",")

ranges.each do |range|
  range_start, range_end = range.split("-").map(&:to_i)
  for i in range_start..range_end do
    id_s = i.to_s

    is_sequence_repeat = false
    for seq_len in 1..(id_s.length / 2) do
      is_sequence_repeat = id_s.chars.each_slice(seq_len).map(&:join).uniq.length == 1
      break if is_sequence_repeat
    end

    if is_sequence_repeat
      sum_invalid_ids += id_s.to_i
    end
  end
end

puts sum_invalid_ids
