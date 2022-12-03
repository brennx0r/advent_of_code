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
        array = []
        split_array = [] 
        split_array_1 = []
        split_array_2 = []

        #split the string into an array w/ each element as separate characters
        array << line.chomp
        split_array = array[0].split("")

        # split the line in two equal length arrays with a single 
        # letter in each array
        half_length = split_array.length / 2
        
        split_array_1 << split_array.slice(0,half_length)
        split_array_2 << split_array.slice(half_length, split_array.length)
        split_array_1 = split_array_1[0]
        split_array_2 = split_array_2[0]

        # intersect the arrays and return the common letter
        common_letter = split_array_1 & split_array_2

        # Evaluate the letter (upper vs lower case)     
        if !common_letter.to_s.match(/\p{Upper}/) == true
            @value += @alphabet_array.index(common_letter[0]) + 1
        elsif !common_letter.to_s.match(/\p{Lower}/) == true
            @value += @alphabet_array.index(common_letter[0].downcase) + 27
        end       
    end
end

make_alphabet_array
read_to_array('test_data_sample.txt')
# puts @split_array.to_s
puts @value