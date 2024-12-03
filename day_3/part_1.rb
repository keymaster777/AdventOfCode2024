text = File.open("./input.txt").read
scanned = text.scan(/mul\(\d\d*,\d\d*\)/)

def get_multiplied(val)
  val.scan(/\d\d*/).map(&:to_i).inject(:*)
end

result = scanned.inject(0) {|result, ele| result + get_multiplied(ele)}

puts result
