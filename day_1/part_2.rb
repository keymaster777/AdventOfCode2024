require 'csv'
csv = CSV.parse(File.read('./input.csv'), headers: false)
left_list = []
$right_list = {}

csv.each_with_index do |row, index|
  left_list << row[0].to_i
  if $right_list.key?(row[1])
    $right_list[row[1]]+=1
  else
    $right_list[row[1]]=1
  end
end

def similarity_for(element)
  if $right_list.key?(element.to_s)
    return $right_list[element.to_s] * element
  else
    return 0
  end
end

result = left_list.inject(0) {|result, ele| result + similarity_for(ele)}
puts result
