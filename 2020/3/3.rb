@array_y = 0
@array_row = 1
@element_location = 3
@tree_count = 0

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

def define_x_multiplier
    needed_width = @array_y * 3
    
    if needed_width > @array_x
        difference_base = @array_y * 3
        array_x_gap = difference_base / @array_x
        @array_x_multiplier = array_x_gap + 3
    else 
        @array_x_multiplier = 1
    end    
end

def evaluate_map
    # begin on the "row" - in this case, the element in the OG array
   
puts "Array X (width): "+@array_x.to_s
puts "Array Y (length): "+@array_y.to_s
puts "Array X multiplier: "+@array_x_multiplier.to_s
        times_count = 0
        shift_y = @array_y - 1

        shift_y.times {
            row_string = @array[@array_row].gsub("\n",'')
            row_array = row_string.split('')
            puts row_array.to_s
            puts "Current: "+@element_location.to_s

            if @element_location > @array_x || @element_location == @array_x
                puts "Old: "+@element_location.to_s
                puts "element location at end, looping"
                @element_location = @element_location - @array_x
                puts "New: "+@element_location.to_s
            end

            place = row_array[@element_location]

            puts place.to_s

            decide_if_tree(place)

            @array_row += 1
            @element_location += 3
            times_count += 1
            puts "Times count: "+times_count.to_s
            puts"\n-----------------------------------\n"
        }
  
end


read_to_array('test_data.txt')
get_array_x
define_x_multiplier
evaluate_map
