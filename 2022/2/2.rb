def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []
    @score = 0

    read_lines.each do |line|
        @array = []
        @array << line.split
        score_shape
        score_outcome
        # puts @array.to_s
        # puts @score
        
        
    end
end

def score_shape
    play = @array[0]
    shape = play[1]
    
    if shape == "X"
        @score += 1
    elsif shape == "Y"
        @score += 2
    elsif shape == "Z"
        @score += 3
    end


end

def score_outcome
    play = @array[0].sum("").to_s 
    # puts "play value is: "+play.to_s

    if play.include?("AY") or play.include?("BZ") or play.include?("CA")  == true
        @score += 6
    elsif 
        play.include?("AX") or play.include?("BY") or play.include?("CZ") == true
        @score += 3
    else
        @score += 0
    end
end

read_to_array('test_data_sample.txt')
puts @score
