@forward = 0
@depth = 0
@aim = 0
@aim_modifier = 0

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
            value = @array[0].gsub(/forward /, '').to_i
            @forward += value.to_i
            @aim_modifier = @aim * value
            @depth += @aim_modifier
            debug
        end

        if @array[0].include?"down"
            value = @array[0].gsub(/down /, '')
            # @depth += value.to_i
            @aim += value.to_i
            debug
        end
        
        if @array[0].include?"up"
            value = @array[0].gsub(/up /, '')
            # @depth -= value.to_i
            @aim -= value.to_i
            debug
        end
        @array.shift    
    end

    multiply_values

end

def debug
    puts "-------------------------------------"
    puts "current array:  "+@array[0]
    puts "current depth:  "+@depth.to_s
    puts "current forward:  "+ @forward.to_s
    puts "current aim:  "+ @aim.to_s
    puts "aim mod: " + @aim_modifier.to_s
    puts "-------------------------------------"
    puts "-------------------------------------"
end

def multiply_values
    @result = @depth * @forward
end

read_to_array('test_data.txt')
process_lines


puts @result.to_s
