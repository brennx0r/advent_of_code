@seat_id_array = []

def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|

        @instruction_array = line.scan /\w/
        @ftb_array = @instruction_array[0..6]
        @ltr_array = @instruction_array[7..9]
        
        row = traverse_front_to_back(@ftb_array)
        seat_line = traverse_left_to_right(@ltr_array)

        puts row
        puts seat_line

        result = row * 8 + seat_line
        

        seat_id_eval(result)
        
    end
end

def traverse_front_to_back(ftb_array)
    puts "Starting Array: "+ftb_array.to_s

    # let's build a row array
    @row_array = [] 
    @array_iterator = 0

    128.times {
        @row_array.push(@array_iterator)
        @array_iterator += 1
    }

    while ftb_array.length != 0

        puts "Current array: "+@row_array.to_s
        puts "Current Instructions: "+ftb_array.to_s
        puts "Current length: "+@length.to_s
        
        if ftb_array[0] == "F"
        puts "f"
            @number_start_value = @row_array[0]
            @number_start = @row_array.index(@number_start_value)
            @range = @row_array.length/2
            @number_end_value = @row_array[@range] - 1
            @number_end = @row_array.index(@number_end_value)
        end 

        if ftb_array[0] == "B"
        puts "b"
            @range = @row_array.length/2
            @number_start_value = @row_array[@range]
            @number_start = @number_start = @row_array.index(@number_start_value)
            @number_end_value = @row_array.last
            @number_end = @row_array.index(@number_end_value)

            puts @length
        end

        puts @number_start_value.to_s
        puts @number_end_value.to_s
        @row_array = @row_array[@number_start..@number_end]
        puts @row_array.to_s  
        ftb_array.delete_at(0)
    end
      
    row = @row_array[0]
    return row
    
end

def traverse_left_to_right(ltr_array)

    # let's build a row array
    @row_array = [] 
    @array_iterator = 0

    8.times {
        @row_array.push(@array_iterator)
        @array_iterator += 1
    }

    while ltr_array.length != 0

        puts "Current array: "+@row_array.to_s
        puts "Current Instructions: "+ltr_array.to_s
        puts "Current length: "+@length.to_s
        
        if ltr_array[0] == "L"
        puts "l"
            @number_start_value = @row_array[0]
            @number_start = @row_array.index(@number_start_value)
            @range = @row_array.length/2
            @number_end_value = @row_array[@range] - 1
            @number_end = @row_array.index(@number_end_value)
        end 

        if ltr_array[0] == "R"
        puts "r"
            @range = @row_array.length/2
            @number_start_value = @row_array[@range]
            @number_start = @number_start = @row_array.index(@number_start_value)
            @number_end_value = @row_array.last
            @number_end = @row_array.index(@number_end_value)

            puts @length
        end

        puts @number_start_value.to_s
        puts @number_end_value.to_s
        @row_array = @row_array[@number_start..@number_end]
        puts @row_array.to_s  
        ltr_array.delete_at(0)
    end
      
    row = @row_array[0]
    return row

end

def seat_id_eval(seat_id)
    #let's sort em in this array
    @seat_id_array.push(seat_id)
    @seat_id_array.sort!
    puts @seat_id_array.to_s
    puts "HIGHEST SEAT ID: "+@seat_id_array.last.to_s
end

read_to_array('test_data.txt')
# read_to_array('test_data_sample.txt')
