require './lib/reader'
require './lib/writer'

reader = Reader.take_user_input_braille_to_en
reader.read_file
writer = Writer.new(reader.output_file_name, reader.input_as_string)
writer.translate_braille_to_en
puts "Created '#{reader.output_file_name}' containing #{reader.file_char_count_braille_to_en} characters\n"