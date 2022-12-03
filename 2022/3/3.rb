@array = []
@trio = []
@value = 0

def make_alphabet_array
    array = []
    alphabet = "abcdefghijklmnopqrstuvwxyz"

    array << alphabet
    @alphabet_array = array[0].split("")
end

def read_to_array(file)
    read_lines = File.readlines(file)
    
    read_lines.each do |line|
        @array << line.chomp         
    end
end

def evaluate_trio
    length = @array.length / 3
    
    length.times {
        @trio = []
            3.times {
                @trio << @array[0]
                @array.shift()
            }
        array1 = @trio[0].split("")
        array2 = @trio[1].split("")
        array3 = @trio[2].split("")
        
        common_letter = array1 & array2 & array3

        if !common_letter.to_s.match(/\p{Upper}/) == true
            @value += @alphabet_array.index(common_letter[0]) + 1
        elsif !common_letter.to_s.match(/\p{Lower}/) == true
            @value += @alphabet_array.index(common_letter[0].downcase) + 27
        end 
    }
end

make_alphabet_array
read_to_array('test_data.txt')
evaluate_trio
puts @value