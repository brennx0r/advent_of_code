def read_line(file)
    read_lines = File.readlines(file)

    # Making a line array to house all the characters in the line to process
    line_array = []

    #calibration number array - these are the values we're going to add
    calib_num_arr = []

    read_lines.each do |line|
        
        line_array = line.gsub(/[^0-9]/, '').split("")
        puts @line_array.to_s

        number = line_array.first + line_array.last

        calib_num_arr << number.to_i

        puts calib_num_arr.sum

    end
end

read_line('test_data.txt')
