@noun = 0 
@verb = 99

def reset_arrays
    @instruction_array = []
    @instruction_array_clone = []
end

def input(file) 
    @result = File.readlines(file)
end

def pre_run_replacement_noun
    puts "noun: "+@noun.to_s
    @instruction_array.delete_at(1)
    @instruction_array.insert(1, @noun.to_s)
    @noun+= 1
end

def pre_run_replacement_verb
    puts "verb: "+@verb.to_s
    @instruction_array.delete_at(2)
    @instruction_array.insert(2, @verb.to_s)
    @verb -= 1
end

def convert_to_array(input)
    reset_arrays
    input.each do |line|
        @instruction_array = line.split(',')
    end
    @instruction_array_clone = @instruction_array.clone
    pre_run_replacement_noun
    pre_run_replacement_verb
    read_index_0
end

def exit_check
    if @instruction_array_clone[0] == "99" and @instruction_array[1].to_s = "19690720"
        puts "Reached 99 - exiting program run. Result number is "+@instruction_array[0].to_s
        exit
    else
        run
        puts "Beginning another program run since we didn't get result '19690720'"  
    
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
