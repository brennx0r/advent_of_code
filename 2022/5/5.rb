@stacks = [["Z", "N"],["M", "C", "D"],["P"]]


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

read_to_array('test_data_sample.txt')

puts "1: " + @stacks[0].to_s
puts "2: " + @stacks[1].to_s
puts "3: " + @stacks[2].to_s