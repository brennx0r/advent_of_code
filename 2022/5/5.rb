@stacks = [["F","T","C","L", "R", "P", "G", "Q"],["N", "Q", "H", "W", "R", "F", "S", "J"],["F", "B", "H", "W", "P", "M", "Q"],["V", "S", "T", "D", "F"],["Q", "L", "D", "W", "V", "F", "Z"],["Z", "C", "L", "S"],["Z", "B", "M", "V", "D", "F"],["T", "J", "B"],["Q", "N", "B", "G", "L", "S", "P", "H"]]

@test_stacks = [["N", "Z"],["M","C","D"],["P"]]

@array = []

def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|
        # test_line = "move 2 from 1 to 3"
        input = line.gsub('move ', '').gsub(' from', ',').gsub(' to', ',')
        # puts input.to_s
        @array << input.chomp.split(',')
        make_packages_move
        @array.shift
    end
end

def make_move
    move = @array[0]
    # puts move.to_s

    move[0].to_i.times {

        from = @stacks[move[1].to_i-1]
        to = @stacks[move[2].to_i-1]

        package = from.last
        to << package
        puts to
        from.pop
        puts from
    }
end

def make_packages_move
    move = @array[0]
    # puts move.to_s

    from = @test_stacks[move[1].to_i-1]
    to = @test_stacks[move[2].to_i-1]
    ## Packages
    package_top = from.length-1
    puts package_top
    package_bottom =  from.length - move[0].to_i 
    puts package_bottom
    packages = from[package_bottom..package_top]
    
    move[0].to_i.times {
        to << packages[0]
        puts to.to_s
        packages.shift
        from.pop
    }
end

read_to_array('test_data_sample.txt')
# puts @stacks[0].last.to_s + @stacks[1].last.to_s+ @stacks[2].last.to_s + @stacks[3].last.to_s + @stacks[4].last.to_s + @stacks[5].last.to_s + @stacks[6].last.to_s + @stacks[7].last.to_s + @stacks[8].last.to_s
puts @test_stacks.to_s
puts @test_stacks[0].last.to_s + @test_stacks[1].last.to_s+ @test_stacks[2].last.to_s

