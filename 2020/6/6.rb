@group_values = []
@answer_array = []
@answer_count_array = []
@file_length = 0
@final_total = 0

def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|

        @array << line.gsub("\n",'')
        @file_length += 1

    end
end

def process_array_element
    
    while @array[0].length != 0
        @group_string = @array[0].scan(/\w+/)
        @group_values.push(@group_string)
        @group_values = @group_values.flatten
        @array.delete_at(0)

        if @array.empty? == true 
            output = File.open( "all_lines.txt", "a" )
            output << @group_values.sort
            output << "\n"
            output.close
            process_rules
        end

    end

    @array.delete_at(0)

    puts "Leaving process_array_element."
    # puts "OG array members: "+@array.to_s
    puts "Group values array: "+@group_values.to_s
    # puts "OG array: "+@array.to_s

    output = File.open( "all_lines.txt", "a" )
    output << @group_values.sort
    output << "\n"
    output.close

    process_rules
end


def process_rules
    puts "----\nprocessing rule: split_to_chars"
    split_to_chars
    puts "----\nprocessing rule: process_answer_counts"
    process_answer_counts
    puts "----\ngoing to cleanup check"
    cleanup_check
end

def split_to_chars
    
    index = 0

    @group_values.length.times {

        @answers = @group_values[index].to_s.scan /\w/
        sorted_unique_answers = @answers.uniq.sort!
        
        @answer_array.push(sorted_unique_answers)
        puts @answer_array.to_s
        index += 1
    }

end

def process_answer_counts
    group_all_yes_answer_count = 0
    if @answer_array.length == 1
        # count up all the elements for the one index
        group_all_yes_answer_count = @answer_array.flatten.length
    else
        @answer_array.sort { |a, b| (b.count <=> a.count) == 0 ? (b.last <=> a.last): (b.count <=> a.count)  }

        puts "Sorted answer array:"+@answer_array.to_s
        #compare all the sorted, unique elements
        element_index = 0
        match_count = 0
        
        main_loop_length = @answer_array[element_index].length

        puts "Main loop length: "+main_loop_length.to_s
        main_loop_length.times {
            
            x_subarr = @answer_array[0]
            y_subarr_index = 0
            
            element_to_match = x_subarr[element_index]
            
            loop_length = @answer_array.length.to_s

            puts "loop length"+loop_length
            
            loop_length.to_i.times {
                puts "--------"
                
                y_subarr = @answer_array[y_subarr_index]
            
                puts "Main Sub-array: "+x_subarr.to_s
                puts "Current Sub-array: "+y_subarr.to_s
                puts "Element to match: "+element_to_match.to_s
                
                if  y_subarr.include?(element_to_match)
                    puts "value matches on the array"
                    match_count += 1 
                    y_subarr_index += 1 
                    puts "y index is #{y_subarr_index} "  
                    puts "--------"
                else 
                    puts "no match - moving on"
                    match_count = 0
                    break
                    puts "--------"
                end
    
            }

        if match_count == @answer_array.length
            group_all_yes_answer_count += 1
            puts match_count
            puts @answer_array.length
            puts "MATCH!"
            match_count = 0
        else
            puts "NO MATCH!"
            puts match_count
            puts @answer_array.length
            match_count = 0
        end

        element_index += 1
        

        puts "element index is "+element_index.to_s
        puts "y_subarr_index is "+y_subarr_index.to_s
        }

    end

    @answer_count_array.push(group_all_yes_answer_count)
    puts @answer_count_array.to_s

end

def cleanup_check
    if @array.empty? == true
        puts "No more data to process..."
        add_answer_count_array
    else
        puts "cleanup: still more to process.."
        @group_values = []
        @answer_array = []
        process_array_element
    end
end

def cleanup_output_files
    output = File.open( "all_lines.txt", "w" )
    output << ""
    output.close
    output = File.open( "output.txt", "w" )
    output << ""
    output.close
    output = File.open( "wrong_count_output.txt", "w" )
    output << ""
    output.close
    output = File.open( "wrong_type_output.txt", "w" )
    output << ""
    output.close
    
end

def add_answer_count_array
    group_answer_sum = @answer_count_array.sum
    puts "Group answer sum is #{group_answer_sum}"
    exit
end

cleanup_output_files
read_to_array('test_data.txt')
process_array_element
