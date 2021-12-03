def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|
        @array << line.to_s
    end
end

read_to_array('test_data_sample.txt')