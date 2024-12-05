lines = File.open("./input.txt").readlines
split_point = lines.find_index("\n")
rules, updates = lines[0..split_point], lines[split_point+1..-1]
sum = 0

updates.each do |update|
  next unless rules.each do |rule|
    a,b=rule.strip.split("|").map{|e| update.index(e)}
    break if a && b && a > b
  end
  a=update.split(",")
  sum+=a[a.size/2].to_i
end

puts sum
