require './lib/braille_to_en_dict'

print "Please enter the name you would like to be translated into English: "
input_file = gets.chomp
print "Please enter the name you would like for the English text file: "
output_file = gets.chomp
read_input_file = File.open(input_file, 'r')
text_as_string = read_input_file.read
read_input_file.close
char_count = 0
braille_to_en_dict = BrailleToEnDict.new
File.open(output_file, 'w') do |file|
    file.write(braille_to_en_dict.translate(text_as_string))
end
File.open(output_file, 'r') do |file|
    char_count = file.read.length
end
puts "Created '#{output_file}' containing #{char_count} characters\n"