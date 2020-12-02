@valid_password_count = 0

def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|
        @array << line.to_s
    end
end
  
def process_array_element
    string_raw = @array[0]
    @string_array = string_raw.scan(/\w+/)
end 

def count_char_instances
    puts @string_array.to_s
    password = @string_array[3].to_s
    character = @string_array[2].to_s
    @count = password.count(character)
end

def count_in_range
    range_min = @string_array[0].to_i
    range_max = @string_array[1].to_i
    if @count.between?(range_min,range_max)
        puts "match"
        @valid_password_count += 1
    else
        puts "no match"
    end

end

def delete_element
    @array.delete_at(0)
end   

def work_through_elements
    array_length = @array.length
    
    array_length.times {
        process_array_element
        count_char_instances
        count_in_range
        delete_element
    }

end
 
read_to_array('test_data.txt')
work_through_elements
puts "total valid passwords: #{@valid_password_count}"