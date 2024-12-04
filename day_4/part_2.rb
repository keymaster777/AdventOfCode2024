$lines = File.open("./input.txt").readlines.map(&:chomp)
$char_opts = ["M","S"]
$match_count = 0

def check_char(coords, char_options)
  return nil if coords.min < 0 
  check_char = $lines&.[](coords[1])&.[](coords[0])
  return char_options.include?(check_char) ? check_char : nil
end

def look_for_match_at(x,y)
  [[-1,-1], [1,-1]].each do |corner|
    matched_char = check_char([x+corner[0], y+corner[1]], $char_opts)
    return if matched_char.nil?

    remaining_char_opts = $char_opts - [matched_char]
    return if check_char(
      [x+(corner[0]*-1), y+(corner[1]*-1)],
      remaining_char_opts
    ).nil?
  end
  $match_count += 1
end

$lines.each_with_index do |line, line_index|
  line.split("").each_with_index do |char, char_index|
    look_for_match_at(char_index, line_index) if char == "A"
  end
end

puts $match_count

