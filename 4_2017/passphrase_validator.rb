def validator(passphrase)
  true_count = 0
  false_count = 0
  valid = 0
  total = 0
  passphrase_array = []

 @file_lines.each do |line|
   puts "Incoming passphrase: "+line.to_s

   passphrase_array = line.to_s.split(/\s+/)
   passphrase_reduce = passphrase_array.reduce(Hash.new(0)) { |a, b| a[b] += 1; a }
   
   passphrase_reduce.each do |key, value|
   	if value > 1
      false_count += 1
      puts false_count
   	end
   end
   if false_count == 0 
      valid += 1
   end
   # reset false_count
   false_count = 0
   total += 1
 end

 puts "Valid total: "+valid.to_s
 puts "Total lines: "+total.to_s
end

def run_tests

	tests = [

	"aa bb cc dd ee",
	"aa bb cc dd aa",
	"aa bb cc dd aaa"		
	]

	results = [
	true,
	false,
	true 
	]

	tests.each do |test|
		result = validator(test)

		if results[0] == result
			puts "SUCCESS! Test returned expected result of "+result.to_s+"."
		else
			puts "FAIL WHALE! Expected test result was "+results[0].to_s+", but the received result was "+result.to_s+"."
		end
		results.shift
	end
end

def read_file(file)
  @file_lines = File.readlines(file)
end

# run_tests
# validator(read_file('small_test_set.txt'))
validator(read_file('passphrase_list.txt'))
