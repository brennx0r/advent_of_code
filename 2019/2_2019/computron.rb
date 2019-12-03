@instruction_array = []
@instruction_array_clone = []

def input(file) 
    @result = File.readlines(file)
end

def pre_run_replacements
    @instruction_array.delete_at(1)
    @instruction_array.insert(1, "12")
    @instruction_array.delete_at(2)
    @instruction_array.insert(2, "2")
end

def convert_to_array(input)
    input.each do |line|
        @instruction_array = line.split(',')
    end
    @instruction_array_clone = @instruction_array.clone
    pre_run_replacements
    read_index_0
end

def exit_check
    if @instruction_array_clone[0] == "99"
        puts "Reached 99 - exiting program with result at index 0: "+@instruction_array.to_s
        exit
    end
    
    # if @instruction_array.count > 50
    #     puts "somethings wrong - exiting"
    #     exit
    # end
end

def step_next
   exit_check
   @instruction_array_clone.shift(4)
   puts "OG: "+@instruction_array.to_s
   puts "Copy: "+@instruction_array_clone.to_s
   read_index_0
end

def read_index_0
    if @instruction_array_clone[0] == "1"
        puts "We need to add this shit"
        first_index = @instruction_array_clone[1].to_i
        puts first_index
        second_index = @instruction_array_clone[2].to_i
        puts second_index
        third_index = @instruction_array_clone[3].to_i
        puts third_index
        result = @instruction_array[first_index].to_i + @instruction_array[second_index].to_i
        @instruction_array.delete_at(third_index)
        @instruction_array.insert(third_index, result)
        step_next
    end

    if @instruction_array_clone[0] == "2"
        puts "We need to multiply this shit"
        first_index = @instruction_array_clone[1].to_i
        puts first_index
        second_index = @instruction_array_clone[2].to_i
        puts second_index
        third_index = @instruction_array_clone[3].to_i
        puts third_index
        result = @instruction_array[first_index].to_i * @instruction_array[second_index].to_i
        @instruction_array.delete_at(third_index)
        @instruction_array.insert(third_index, result)
        step_next
    end

end

def run_tests
    convert_to_array(input('test_input.txt'))
end

def run
    convert_to_array(input('input.txt'))
end

#run_tests
run
