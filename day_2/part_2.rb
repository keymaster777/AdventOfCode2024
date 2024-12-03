require 'csv'
csv = CSV.parse(File.read('./input.csv'), headers: false)

def is_report_safe?(report, is_retry)
  last_diff = nil
  bad_data_count = 0
  original = report.join(",")
  report.each_with_index do |level, index|
    break if index == report.count-1

    diff = level.to_i - report[index+1].to_i
    unless [1,2,3].include?(diff.abs) && (last_diff.nil? || diff/diff.abs == last_diff/last_diff.abs)
      bad_data_count += 1
      report[index+1] = level
    else
      last_diff = diff
    end
  end
  
  if bad_data_count == report.count-1 && is_retry == false
    return is_report_safe?(original.split(",").drop(1), true)
  end

  bad_data_count <= 1
end

count = 0
csv.each_with_index do |row|
  count+=1 if is_report_safe?(row, false)
end

puts count
