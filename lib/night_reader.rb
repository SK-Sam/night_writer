print "Please enter the name you would like to be translated into English: "
input_file = gets.chomp
print "Please enter the name you would like for the English text file: "
output_file = gets.chomp
read_input_file = File.open(input_file, 'r')
text_as_string = read_input_file.read
read_input_file.close
char_count = text_as_string.length / 6 - 1
#en_to_braille_dict = EnToBrailleDict.new
#File.open(output_file, 'w') do |file|
    #file.write(en_to_braille_dict.translate(text_as_string))
#end
puts "Created '#{output_file}' containing #{char_count} characters\n"