@stacks = [["F","T","C","L", "R", "P", "G", "Q"],["N", "Q", "H", "W", "R", "F", "S", "J"],["F", "B", "H", "W", "P", "M", "Q"],["V", "S", "T", "D", "F"],["Q", "L", "D", "W", "V", "F", "Z"],["Z", "C", "L", "S"],["Z", "B", "M", "V", "D", "F"],["T", "J", "B"],["Q", "N", "B", "G", "L", "S", "P", "H"]]


@array = []

def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|
        input = line.gsub('move ', '').gsub(' from', ',').gsub(' to', ',')
        puts input.to_s
        @array << input.chomp.split(',')
        make_move
        @array.shift
    end
end

def make_move
    move = @array[0]
    puts move.to_s

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

read_to_array('test_data.txt')

puts @stacks[0].last.to_s + @stacks[1].last.to_s+ @stacks[2].last.to_s + @stacks[3].last.to_s + @stacks[4].last.to_s + @stacks[5].last.to_s + @stacks[6].last.to_s + @stacks[7].last.to_s + @stacks[8].last.to_s
 

