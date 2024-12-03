text = File.open("./input.txt").read
scanned = text.scan(/mul\(\d\d*,\d\d*\)|do\(\)|don\'t\(\)/)

def process_scanned(instructions)
  enabled = true
  instructions.inject(0) do |result, ele|
    if ["do()", "don't()"].include?(ele)
      enabled = (ele == "do()")
      next result
    end 

    next result + ele.scan(/\d\d*/).map(&:to_i).inject(:*) if enabled
    result 
  end
end

result = process_scanned(scanned)
p result
