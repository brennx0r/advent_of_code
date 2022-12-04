@array = []
@count = 0



def read_to_array(file)
    read_lines = File.readlines(file)
    read_lines.each do |line|
        split_line = line.chomp.split(",")
        section1 = split_line[0].to_s.split('-')
        section2 = split_line[1].to_s.split('-')

        if (section1[0].to_i..section1[1].to_i).cover?(section2[0].to_i..section2[1].to_i) == true
            puts "hooray"
            @count += 1
        elsif 
            (section2[0].to_i..section2[1].to_i).cover?(section1[0].to_i..section1[1].to_i) == true
            puts "hooray"
           @count += 1
        else
            puts "no match"
        end

    end
end

read_to_array('test_data_sample.txt')
puts @count.to_s