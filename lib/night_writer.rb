require './lib/reader'
require './lib/writer'

reader = Reader.take_user_input_en_to_braille
reader.read_file
writer = Writer.new(reader.output_file_name, reader.input_as_string)
writer.translate_en_to_braille
puts "Created '#{reader.output_file_name}' containing #{reader.file_char_count_en_to_braille} characters\n"