def read_line(file)
    read_lines = File.readlines(file)

    # Making a line array to house all the characters in the line to process
    line_array = []

    #calibration number array - these are the values we're going to add
    calib_num_arr = []

    read_lines.each do |line|
        
        # here we go with some ugly interpolation, whee

        corner_cases = {
            "twone" => "21",
            "oneight" => "18",
            "eightwo" => "82",
            "eighthree" => "83",
            "threeight" => "38",
            "fiveight" => "58",
            "sevenine" => "79",
            "nineight" => "98"
        }

        num_values = {
            "one" => "1",
            "two" => "2",
            "three" => "3",
            "four" => "4",
            "five" => "5",
            "six" => "6",
            "seven" => "7",
            "eight" => "8",
            "nine" => "9",
            

        }

        puts line 
       
        line_corner_cases = line.gsub(/twone|oneight|eightwo|eighthree|threeight|fiveight|sevenine|nineight/, corner_cases)
        new_str = line_corner_cases.gsub(/one|two|three|four|five|six|seven|eight|nine/, num_values)
        line_array = new_str.gsub(/[^0-9]/, '').split("")
        puts line_array.to_s

        number = line_array.first + line_array.last

        calib_num_arr << number.to_i

        puts calib_num_arr.to_s
        puts calib_num_arr.sum

    end
end

read_line('test_data.txt')
