def sort(incoming)

  @checksum = []
  
  @spreadsheet_lines.each do |line|  
  list_array = line.split(/\s+/).map(&:to_i).sort

    (0..list_array.length).each do |count|   
      list_array.length.times do |i|
      # divide using first member of the array as the divisor
        division_result = list_array[i+1].to_f / list_array.first.to_f
        
        if division_result % 1 == 0 && division_result != 0.0
          @checksum.push(division_result)
          # puts "PUSH MADE: "+ @checksum.to_s
          list_array = []
        end 
      end
      list_array.shift(1)
    end
  end

puts @checksum.sum.to_s
return @checksum.sum  
end




def spreadsheet(file)
  @spreadsheet_lines = File.readlines(file)
end




def run_tests
  result = sort(spreadsheet('test_part_two.txt'))
  if result == 9
    puts "SUCCESS!"
  else
    puts "SAD PANDA - TRY AGAIN"
  end
  puts result
end



sort(spreadsheet('advent_spreadsheet_example.txt'))
# run_tests

