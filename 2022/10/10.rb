@x = 1
@cycle = 0
@signal_strength = []

def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|
        if line.to_s.include?('noop')
            @cycle += 1
            puts @cycle.to_s+" : "+@x.to_s
            if @cycle == 20 || @cycle == 60 || @cycle == 100 || @cycle == 140 || @cycle == 140 || @cycle == 180 || @cycle == 220
                # or @cycle = 140 or @cycle = 180 or @cycle = 220
                signal_strong = @cycle * @x
                puts "Signal: " + signal_strong.to_s
                @signal_strength << signal_strong
                puts @signal_strength
            end
        end

        if line.include?('addx')
            add_value = line.gsub(/^addx /, '').to_i
            
            
            #cycle 1
            @cycle += 1
            puts @cycle.to_s + " : "+@x.to_s
            if @cycle == 20 || @cycle == 60 || @cycle == 100 || @cycle == 140 || @cycle == 140 || @cycle == 180 || @cycle == 220
                # or @cycle = 140 or @cycle = 180 or @cycle = 220
                signal_strong = @cycle * @x
                puts "Signal: " + signal_strong.to_s
                @signal_strength << signal_strong
                puts @signal_strength
            end

            
            #cycle 2 
            @cycle += 1
            puts @cycle.to_s + " : "+@x.to_s
            
            # signal strength (the cycle number multiplied by the value of the X register) 
            # during the 20th cycle and every 40 cycles after that
            if @cycle == 20 || @cycle == 60 || @cycle == 100 || @cycle == 140 || @cycle == 140 || @cycle == 180 || @cycle == 220 
                signal_strong = @cycle * @x
                @x += signal_strong
                puts "Signal: " + signal_strong.to_s
                @signal_strength << signal_strong
                puts @signal_strength
            else
            @x += add_value.to_i
            end
        end

        


    end
end

read_to_array('test_data_sample.txt')
puts @signal_strength.sum.to_s