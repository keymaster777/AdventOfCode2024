lines = File.open("./input.txt").readlines
split_point = lines.find_index("\n")
rules, updates = lines[0..split_point], lines[split_point+1..-1].map{|e|e.strip.split(",")}
sum = 0

updates.each do |update|
  corrected = 0

  while true
    pre_corrected = corrected
    rules.each do |rule|
      a,b=rule.strip.split("|").map{|e| update.index(e)}
      update[a], update[b], corrected = update[b], update[a], corrected+1 if a && b && a > b
    end
    break if pre_corrected == corrected
  end
  next if corrected == 0
  sum+=update[update.size/2].to_i 
end

puts sum
