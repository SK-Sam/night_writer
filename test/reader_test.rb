require './test/test_helper'
require './lib/reader'

class ReaderTest < MiniTest::Test

    def test_it_can_instantiate_and_ask_user_for_input
        reader = Reader.take_user_input_en_to_braille
        reader.stubs(:input_file_name).returns("message.txt")
        reader.stubs(:output_file_name).returns("braille.txt")

        assert_equal "message.txt", reader.input_file_name
        assert_equal "braille.txt", reader.output_file_name
    end
end