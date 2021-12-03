
@increases = 0
@decreases = 0
@sames = 0

def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|
        @array << line.to_i
    end

end

def  eval_values

    if @array[0] < @array[1]
        @increases += 1
    elsif @array[0] == @array[1]
        @sames += 1
    elsif @array[0] > @array[1]
        @decreases += 1
    else
    end

    remove_first_element

end

def remove_first_element

    @array.delete_at(0)

    eval_continue

end

def eval_continue

    if @array.count > 1
        eval_values   
    end
end

read_to_array('test_data.txt')
eval_values



puts @increases.to_s
