@group_values = []
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
    puts "OG array: "+@array.to_s

    output = File.open( "all_lines.txt", "a" )
    output << @group_values.sort
    output << "\n"
    output.close

    process_rules
end


def process_rules
    puts "processing rule: split_to_chars"
    split_to_chars
    puts "processing rule: process_answer_counts"
    process_answer_counts
    puts "going to cleanup check"
    cleanup_check
end

def split_to_chars
    @answer_array = @group_values.to_s.scan /\w/
    puts "Split char array: "+@answer_array.to_s
end

def process_answer_counts
    answer_count = @answer_array.uniq.length

    puts "Unique count values: "+@answer_array.uniq.to_s

    @answer_count_array.push(answer_count)
    puts @answer_count_array.to_s
end

def cleanup_check
    if @array.empty? == true
        puts "No more data to process..."
        add_answer_count_array
    else
        @group_values = []
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
