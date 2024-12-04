$lines = File.open("./input.txt").readlines.map(&:chomp)
$search_string = "XMAS"
$directions = [[-1,0], [-1,-1], [0,-1], [1,-1], [1,0], [1,1], [0,1], [-1,1]]
$match_count = 0


def look_for_matches_at(x,y)
  remaining_search = $search_string[1, $search_string.size]
  $directions.each do |direction|
    remaining_search.split("").each_with_index do |char, index|
      offset_coords = [x+direction[0]*(index+1), y+direction[1]*(index+1)]
      break if offset_coords.min < 0 #Dont wrap when looking for matches
      check_char = $lines&.[](offset_coords[1])&.[](offset_coords[0])
      break if check_char != char
      $match_count += 1 if index == remaining_search.size-1
    end
  end  
end

$lines.each_with_index do |line, line_index|
  line.split("").each_with_index do |char, char_index|
    look_for_matches_at(char_index, line_index) if char == $search_string[0]
  end
end

puts $match_count

