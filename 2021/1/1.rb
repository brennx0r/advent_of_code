@increases = 0
@decreases = 0
@sames = 0
@sum_array = []

def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|
        @array << line.to_i
    end
end

def add_elements

    array_count = @array.count
    n = 0

    array_count.times do

        if array_count - n < 3
            break
        else
        
            sum = @array[n] + @array[n+1] + @array[n+2]
            @sum_array << sum
            puts @sum_array.to_s
        
            n += 1

        end
    end

    eval_values

end


def  eval_values
    if @sum_array[0] < @sum_array[1]
        @increases += 1
    elsif @sum_array[0] == @sum_array[1]
        @sames += 1
    elsif @sum_array[0] > @sum_array[1]
        @decreases += 1
    else
    end
    remove_first_element
end

def remove_first_element
    @sum_array.delete_at(0)
    eval_continue
end

def eval_continue
    if @sum_array.count > 1
        eval_values   
    end
end

read_to_array('test_data.txt')
add_elements

puts @increases.to_s