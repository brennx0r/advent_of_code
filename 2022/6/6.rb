@count = 0
@saved_stream = []

def read_to_array(file)
    read_lines = File.readlines(file)

    read_lines.each do |line|
        @array = line.chomp.split("")
    end
end

def process_stream
    length = @array.length.to_i

        puts @array[0].to_s
        
    4.times {
        @saved_stream << @array[0]
        @array.shift
        @count += 1
    }
    
    length.times {
        unique_arr =[]
        @saved_stream << @array[0]
        unique_arr = @saved_stream.uniq
        puts @saved_stream.to_s
        puts unique_arr.to_s
        if unique_arr.length == 14
            puts "FOUND IT: "+@count.to_s
            break
        elsif @saved_stream.length < 14
            @count += 1
            @array.shift
        else
            @count += 1
            @array.shift
            @saved_stream.shift
        end
    }

    
end

read_to_array('test_data.txt')
process_stream
