@array_y = 0
@tree_result_arr = []

def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|
        @array << line.to_s.gsub("\n",'')
        @array_y += 1
    end
end

def get_array_x
    @array_x = @array[0].length
end

def decide_if_tree(place)
    if place == "#"
        puts "We are in the place of a tree!"
        @tree_count += 1
    elsif place == "."
        puts "We are in a place without a tree!"
        @tree_count += 0
    end
    puts "Tree count is #{@tree_count}"
end



def evaluate_map(row, location)
    # begin on the "row" - in this case, the element in the OG array
   
puts "Array X (width): "+@array_x.to_s
puts "Array Y (length): "+@array_y.to_s

        @tree_count = 0
        @array_row = row
        @element_location = location
        times_count = 0

        if row == 1
            shift_y = @array_y - row
        else
            shift_y = @array_y / row
        end

        shift_y.times {
            row_string = @array[@array_row].gsub("\n",'')
            row_array = row_string.split('')
            puts row_array.to_s
            puts "Current: "+@element_location.to_s

            if @element_location > @array_x
                puts "Old: "+@element_location.to_s
                puts "element location at end, looping"
                @element_location = @element_location - @array_x
                puts "New: "+@element_location.to_s
            end

            if @element_location == @array_x
                puts "Old: "+@element_location.to_s
                puts "element location at end, looping"
                @element_location = @element_location - @array_x
                puts "New: "+@element_location.to_s
            end

            place = row_array[@element_location]

            puts place.to_s

            decide_if_tree(place)

            @array_row += row
            @element_location += location
            times_count += 1
            puts "Times count: "+times_count.to_s
            puts"\n-----------------------------------\n"
        }

        @tree_result_arr.push(@tree_count)
        
  
end

def give_tree_total
    tree_total = @tree_result_arr.reduce(:*)
    puts "Tree total: "+tree_total.to_s
end

read_to_array('test_data.txt')
get_array_x
evaluate_map(1,1)
evaluate_map(1,3)
evaluate_map(1,5)
evaluate_map(1,7)
evaluate_map(2,1)

puts @tree_result_arr.to_s
give_tree_total