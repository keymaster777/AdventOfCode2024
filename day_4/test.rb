$lines = File.open("./input_dummy.txt").readlines.map(&:chomp)
$search_string = "XMAS"
$match_count = 0

test = $lines.join("").scan(/X(?=.{10}M(?=.{10}A(?=.{10}S)))/)

p test

