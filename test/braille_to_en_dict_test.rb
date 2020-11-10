require './lib/braille_to_en_dict'
require 'minitest/autorun'

class BrailleToEnDictTest < MiniTest::Test
    def setup
        @braille_to_en = BrailleToEnDict.new
    end

    def test_it_can_instantiate_with_a_set_dictionary
        assert_instance_of BrailleToEnDict, @braille_to_en
    end

    def test_it_can_break_down_braille_text_per_three_newlines
        string_input = "0...0...0...0...0...0...0...0...0...0...0...0...0...0...0...0...0...0...0...0...\n....0.......0.......0.......0.......0.......0.......0.......0.......0.......0...\n................................................................................\n"

        expected_string_1 = "0...0...0...0...0...0...0...0...0...0...0...0...0...0...0...0...0...0...0...0..."
        expected_string_2 = "....0.......0.......0.......0.......0.......0.......0.......0.......0.......0..."
        expected_string_3 = "................................................................................"
        expected = [expected_string_1, expected_string_2, expected_string_3]
        assert_equal expected, @braille_to_en.separate_to_three_lines(string_input)
    end

    def test_it_can_format_three_strings_into_braille_char_format
        top_row_string = "0..."
        middle_row_string = "...."
        bottom_row_string = "...."
        array_of_three_strings = [top_row_string, middle_row_string, bottom_row_string]

        expected = ["0.\n..\n..", "..\n..\n.."]
        assert_equal expected, @braille_to_en.format_into_braille_char_array(array_of_three_strings)
    end
end