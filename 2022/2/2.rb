def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []
    @score = 0

    read_lines.each do |line|
        @array = []
        @array << line.split
        puts @array.to_s
        score_action
        puts @score 
    end
end

def score_shape(shape)
    if shape == "X"
        @score += 1
    elsif shape == "Y"
        @score += 2
    elsif shape == "Z"
        @score += 3
    end
end

def score_action
    play = @array[0]
    action = play[1]
    
    if action == "X"
        @score += 0
        puts "lose"
        lose
    elsif action == "Y"
        @score += 3
        puts "draw"
        draw
    elsif action == "Z"
        @score += 6
        puts "win"
        win
    end
end

def lose
    # They play rock, we play scissors
    # They play paper, we play rock
    # They play scissors, we play paper
    play = @array[0]
    opponent_play = play[0]

    if opponent_play == "A"
        shape = "Z"
    elsif opponent_play == "B"
        shape = "X"
    elsif opponent_play == "C"
        shape = "Y"
    end
    puts shape
    score_shape(shape)
end

def draw
    play = @array[0]
    opponent_play = play[0]

    if opponent_play == "A"
    shape = "X"
    elsif opponent_play == "B"
        shape = "Y"
    elsif opponent_play == "C"
        shape = "Z"
    end
    puts shape
    score_shape(shape)
end

def win
    # They play rock, we play paper
    # They play paper, we play scissors
    # They play scissors, we play rock
    play = @array[0]
    opponent_play = play[0]

    if opponent_play == "A"
        shape = "Y"
    elsif opponent_play == "B"
        shape = "Z"
    elsif opponent_play == "C" 
        shape = "X"
    end
    puts shape
    score_shape(shape)
end



def score_outcome
    play = @array[0].sum("").to_s 
    # puts "play value is: "+play.to_s

    if play.include?("CX") or play.include?("BZ") or play.include?("AY")  == true
        # puts "win"
        @score += 6
    elsif 
        play.include?("AX") or play.include?("BY") or play.include?("CZ") == true
        # puts "tie"
        @score += 3
    else
        # puts "loss"
        @score += 0
    end
end

read_to_array('test_data_sample.txt')
puts @score
