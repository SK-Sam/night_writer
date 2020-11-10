require './lib/en_to_braille_dict'
require './lib/reader'

reader = Reader.take_user_input_en_to_braille
reader.read_file
en_to_braille_dict = EnToBrailleDict.new
File.open(reader.output_file_name, 'w') do |file|
    file.write(en_to_braille_dict.translate(reader.input_as_string))
end
puts "Created '#{reader.output_file_name}' containing #{reader.file_char_count_en_to_braille} characters\n"