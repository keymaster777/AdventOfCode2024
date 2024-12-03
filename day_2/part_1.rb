require 'csv'
csv = CSV.parse(File.read('./input.csv'), headers: false)

def is_report_safe?(report)
  last_diff = nil
  report.each_with_index do |level, index|
    return true if index == report.count-1

    diff = level.to_i - report[index+1].to_i
    return false unless [1,2,3].include?(diff.abs)
    return false unless last_diff.nil? || diff/diff.abs == last_diff/last_diff.abs
    last_diff = diff
  end
end


count = 0
csv.each_with_index do |row|
  count+=1 if is_report_safe?(row)
end

puts count
