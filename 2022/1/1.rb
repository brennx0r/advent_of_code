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
    @calorie_totals << @array.sum
end

def calc_top_3
    sorted_array = @calorie_totals.sort.reverse!
    puts sorted_array
    sum = sorted_array[0]+sorted_array[1] + sorted_array[2]
    puts sum
end

read_to_array('test_data.txt')
calc_top_3

