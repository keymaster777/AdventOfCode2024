$lines = File.open("./input.txt").readlines.map(&:chomp)
$match_count = 0


def look_for_match_at(x,y)
  [[-1,-1], [1,-1]].each do |corner|
    offset_coords = [x+corner[0], y+corner[1]]
    char_options = ["M","S"]

    return if offset_coords.min < 0 
    check_char = $lines&.[](offset_coords[1])&.[](offset_coords[0])
    return unless char_options.include?(check_char)

    offset_coords = [x+(corner[0]*-1), y+(corner[1]*-1)]
    char_options -= [check_char]

    return  if offset_coords.min < 0 
    check_char = $lines&.[](offset_coords[1])&.[](offset_coords[0])  
    return unless char_options.include?(check_char)
  end
  $match_count += 1
end


$lines.each_with_index do |line, line_index|
  line.split("").each_with_index do |char, char_index|
    look_for_match_at(char_index, line_index) if char == "A"
  end
end

puts $match_count

