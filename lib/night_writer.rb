require './lib/reader'
require './lib/writer'

reader = Reader.take_user_input_en_to_braille
reader.read_file
writer = Writer.new(reader.output_file_name, reader.input_as_string)
writer.translate_en_to_braille
puts reader.summarize("night_writer")