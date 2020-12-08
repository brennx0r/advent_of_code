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
        result = row * 8 + seat_line
        seat_id_eval(result)
        
    end
end

def traverse_front_to_back(ftb_array)

    # let's build a row array
    @row_array = [] 
    @array_iterator = 0

    128.times {
        @row_array.push(@array_iterator)
        @array_iterator += 1
    }

    while ftb_array.length != 0

        if ftb_array[0] == "F"
            @number_start_value = @row_array[0]
            @number_start = @row_array.index(@number_start_value)
            @range = @row_array.length/2
            @number_end_value = @row_array[@range] - 1
            @number_end = @row_array.index(@number_end_value)
        end 

        if ftb_array[0] == "B"
            @range = @row_array.length/2
            @number_start_value = @row_array[@range]
            @number_start = @number_start = @row_array.index(@number_start_value)
            @number_end_value = @row_array.last
            @number_end = @row_array.index(@number_end_value)
        end

        @row_array = @row_array[@number_start..@number_end] 
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

        if ltr_array[0] == "L"
            @number_start_value = @row_array[0]
            @number_start = @row_array.index(@number_start_value)
            @range = @row_array.length/2
            @number_end_value = @row_array[@range] - 1
            @number_end = @row_array.index(@number_end_value)
        end 

        if ltr_array[0] == "R"
            @range = @row_array.length/2
            @number_start_value = @row_array[@range]
            @number_start = @number_start = @row_array.index(@number_start_value)
            @number_end_value = @row_array.last
            @number_end = @row_array.index(@number_end_value)
        end

        @row_array = @row_array[@number_start..@number_end] 
        ltr_array.delete_at(0)
    end
      
    row = @row_array[0]
    return row

end

def seat_id_eval(seat_id)
    #let's sort em in this array
    @seat_id_array.push(seat_id)
    @seat_id_array.sort!
end

def find_your_seat
    while true == true
    @total = @seat_id_array[0] + 1
        if @total == @seat_id_array[1]
        else
            puts "Found my seat! It's between "+@seat_id_array[0].to_s+" and "+@seat_id_array[1].to_s 
            exit
        end
        @seat_id_array.delete_at(0)
    end
end


read_to_array('test_data.txt')
# read_to_array('test_data_sample.txt')
puts "HIGHEST SEAT ID: "+@seat_id_array.last.to_s
find_your_seat