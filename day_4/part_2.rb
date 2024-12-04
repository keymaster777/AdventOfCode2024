$lines = File.open("./input.txt").readlines.map(&:chomp)
$match_count = 0


def look_for_match_at(x,y)
  match = true
  [[-1,-1], [1,-1]].each do |corner|
    offset_coords = [x+corner[0], y+corner[1]]
    char_options = ["M","S"]
    match = false if offset_coords.min < 0 #Dont wrap when looking for matches
    check_char = $lines&.[](offset_coords[1])&.[](offset_coords[0])
    if char_options.include?(check_char)
      char_options -= [check_char]
      offset_coords = [x+(corner[0]*-1), y+(corner[1]*-1)]
      match = false if offset_coords.min < 0 #Dont wrap when looking for matches
      check_char = $lines&.[](offset_coords[1])&.[](offset_coords[0])  
      match = false unless char_options.include?(check_char)
    else
      match = false
    end
  end
  $match_count += 1 if match
end


$lines.each_with_index do |line, line_index|
  line.split("").each_with_index do |char, char_index|
    look_for_match_at(char_index, line_index) if char == "A"
  end
end

puts $match_count

