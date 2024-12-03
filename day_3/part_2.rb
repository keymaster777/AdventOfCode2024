text = File.open("./input.txt").read
scanned = text.scan(/mul\(\d\d*,\d\d*\)|do\(\)|don\'t\(\)/)

def process_scanned(instructions)
  enabled = true
  instructions.inject(0) do |result, ele|
    enabled = (ele == "do()") if ["do()", "don't()"].include?(ele)
    
    if enabled && ele.include?("mul")
      result + ele.scan(/\d\d*/).map(&:to_i).inject(:*)
    else
      result 
    end
  end
end

result = process_scanned(scanned)
p result
