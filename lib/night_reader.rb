require './lib/reader'
require './lib/writer'

reader = Reader.take_user_input_braille_to_en
reader.read_file
writer = Writer.new(reader.output_file_name, reader.input_as_string)
writer.translate_braille_to_en
puts reader.summarize("night_reader")