require 'csv'
csv = CSV.parse(File.read('./input.csv'), headers: false)
left_list = []
right_list = []

csv.each_with_index do |row, index|
  left_list << row[0].to_i
  right_list << row[1].to_i
end

left_list.sort!
right_list.sort!
merged_list = left_list.zip(right_list)
result = merged_list.inject(0) {|result, ele| result + (ele[0]-ele[1]).abs}
puts result
