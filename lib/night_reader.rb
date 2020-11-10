require './lib/braille_to_en_dict'
require './lib/reader'

reader = Reader.take_user_input_braille_to_en
reader.read_file
braille_to_en_dict = BrailleToEnDict.new
File.open(reader.output_file_name, 'w') do |file|
    file.write(braille_to_en_dict.translate(reader.input_as_string))
end
puts "Created '#{reader.output_file_name}' containing #{reader.file_char_count_braille_to_en} characters\n"