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

    def test_it_can_open_a_file_and_save_as_string
        reader = Reader.new("./test/test.txt", "braille.txt")

        assert_equal "hello world", reader.read_file
    end

    def test_it_can_find_file_char_count
        reader = Reader.new("./test/test.txt", "braille.txt")
        reader.read_file

        assert_equal 11, reader.file_char_count_en_to_braille
    end

    def test_it_can_instantiate_differently_in_night_reader
        reader = Reader.take_user_input_braille_to_en
        reader.stubs(:input_file_name).returns("braille.txt")
        reader.stubs(:output_file_name).returns("message.txt")

        assert_equal "braille.txt", reader.input_file_name
        assert_equal "message.txt", reader.output_file_name
    end

    def test_it_can_find_file_char_count_for_braille_to_en
        reader = Reader.new("braille.txt", "./test/test.txt")

        assert_equal 11, reader.file_char_count_braille_to_en
    end
end