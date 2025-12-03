output_joltage = 0
num_batteries = 12

file_content = File.read("input.txt")

file_content.lines.map(&:strip).each do |bank|
  batteries = bank[bank.length - num_batteries, bank.length - 1].chars.map(&:to_i)

  (0..(bank.length - num_batteries - 1)).reverse_each do |index|
    digit = bank[index].to_i

    for battery_index in 0..(num_batteries - 1) do
      break if digit < batteries[battery_index]
      old_battery = batteries[battery_index]
      batteries[battery_index] = digit
      digit = old_battery
    end
  end

  joltage = batteries.join.to_i
  output_joltage += joltage
end

puts output_joltage

