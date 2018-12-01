
def sort(incoming)

  checksum = []

  @spreadsheet_lines.each do |line|
  	list_array = line.split(/\s+/).map(&:to_i).sort
    line_checksum = list_array.last.to_i - list_array.first.to_i
  	checksum.push(line_checksum)
  end

puts checksum.sum
return checksum.sum
end


def spreadsheet(file)
  @spreadsheet_lines = File.readlines(file)
end

def run_tests
  result = sort(spreadsheet('test.txt'))
  if result == 18
    puts "SUCCESS!"
  else
    puts "SAD PANDA - TRY AGAIN"
  end
  puts result
end

sort(spreadsheet('advent_spreadsheet_example.txt'))

# run_tests