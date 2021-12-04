@forward = 0
@depth = 0

def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|
        @array << line.to_s
    end
end

def process_lines

    num_elements = @array.count

    num_elements.times do
        if @array[0].include?"forward"
            value = @array[0].gsub(/forward /, '')
            @forward += value.to_i
        end

        if @array[0].include?"down"
            value = @array[0].gsub(/down /, '')
            @depth += value.to_i
        end
        
        if @array[0].include?"up"
            value = @array[0].gsub(/up /, '')
            @depth -= value.to_i
        end
        @array.shift    
    end

    multiply_values

end

def multiply_values

    @result = @depth * @forward

end

read_to_array('test_data.txt')
process_lines


puts @result.to_s
