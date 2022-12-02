def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []
    @calorie_totals = []

    read_lines.each do |line|
        if line.to_i != 0
            @array << line.to_i
        else
            @calorie_totals << @array.sum
            @array = []
        end    
    end
end

def 

read_to_array('test_data_sample.txt')
puts @calorie_totals.max

