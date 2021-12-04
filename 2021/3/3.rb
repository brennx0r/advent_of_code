@row_count = 0
@gamma = []
@epsilon = []
class Binary
    def self.to_decimal(binary)
        raise ArgumentError if binary.match?(/[^01]/)

        binary.reverse.chars.map.with_index do |digit, index|
        digit.to_i * 2**index
        end.sum
    end
end
  

  
def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|
        scrubbed_line = line.gsub(/\n/, "")
        @array << scrubbed_line.split("")
        @row_count += 1

    end

    evaluate_gamma
end

def evaluate_gamma
    length = @array[0].count
    
    length.times do
    
        tmp_array = []
        n = 0
        ones = 0
        zeroes = 0
        @row_count.times do

            if @array[n][0] == "1"
                ones += 1
                @array[n].shift()
            elsif
                @array[n][0] == "0"
                zeroes += 1
                @array[n].shift()
            else
            end

            puts ones
            puts zeroes
            n+= 1
        end

        if ones > zeroes 
            @gamma << 1
            @epsilon << 0
        else
            @gamma << 0
            @epsilon << 1
        end
    end

    form_final_gamma_binary
end

def form_final_gamma_binary
    gamma_binary = @gamma.join("")
    @gamma_decimal = Binary.to_decimal(gamma_binary)
    form_epsilon
end

def form_epsilon 
    epsilon_binary = @epsilon.join("")
    @epsilon_decimal = Binary.to_decimal(epsilon_binary)
end


read_to_array('test_data.txt')

result = @gamma_decimal * @epsilon_decimal
puts "Result: "+result.to_s



