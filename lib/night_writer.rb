print "Please enter the name you would like to be translated into braille "
input_file = gets.chomp
print "Please enter the name you would like for the braille text file. "
output_file = gets.chomp
read_input_file = File.open(input_file, 'r')
char_count = read_input_file.read.delete("\n").length
read_input_file.close
puts "Created '#{output_file}' containing #{char_count} characters\n"