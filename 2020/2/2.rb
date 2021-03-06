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

def is_char_instance_in_positions
    puts "Line is: #{@string_array.to_s}"
    password_array = @string_array[3].split(%r{\s*}) 
    puts "Password array is #{password_array}"
    character = @string_array[2].to_s
    position_one = @string_array[0].to_i - 1
    position_two = @string_array[1].to_i - 1
    @check_count = 0

    if character == password_array[position_one]
        @check_count += 1
        puts "match"
        puts @check_count
    end

    if character == password_array[position_two]
        @check_count += 1
        puts "match"
        puts @check_count
    end
    
    if @check_count == 2
        puts "no match"
    elsif @check_count == 1
        puts "match"
        @valid_password_count += 1
    end

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
        is_char_instance_in_positions
        #count_char_instances
        #count_in_range
        delete_element
    }

end
 
read_to_array('test_data.txt')
work_through_elements
puts "total valid passwords: #{@valid_password_count}"