@array = []
@count = 0



def read_to_array(file)
    read_lines = File.readlines(file)
    read_lines.each do |line|
        split_line = line.chomp.split(",")
        section1 = split_line[0].to_s.split('-')
        section2 = split_line[1].to_s.split('-')
        r1_first = section1[0].to_i
        r1_last = section1[1].to_i
        r2_first = section2[0].to_i
        r2_last = section2[1].to_i


        if !(r1_first > r2_last || r1_last < r2_first) 
            puts "hooray"
            @count += 1
    
        else
            puts "no match"
        end

    end
end

read_to_array('test_data_sample.txt')
puts @count.to_s