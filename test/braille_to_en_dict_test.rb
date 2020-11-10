require './test/test_helper'
require './lib/braille_to_en_dict'

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

    def test_it_can_separate_strings_per_two_chars
        top_row_string = "0..."
        middle_row_string = "...."
        bottom_row_string = "...."
        array_of_rows = [top_row_string, middle_row_string, bottom_row_string]

        expected1 = ["0.", ".."]
        expected2 = ["..", ".."]
        expected3 = ["..", ".."]
        assert_equal expected1, @braille_to_en.separate_each_string_per_two_chars(top_row_string)
        assert_equal expected2, @braille_to_en.separate_each_string_per_two_chars(middle_row_string)
        assert_equal expected3, @braille_to_en.separate_each_string_per_two_chars(bottom_row_string)
    end

    def test_it_can_separate_array_of_strings_per_two_chars
        top_row_string = "0..."
        middle_row_string = "...."
        bottom_row_string = "...."
        array_of_three_strings = [top_row_string, middle_row_string, bottom_row_string]

        expected = [
            ["0.", ".."], 
            ["..", ".."],
            ["..", ".."]
        ]
        assert_equal expected, @braille_to_en.separate_array_of_braille_strings_per_two_chars(array_of_three_strings)

        top_row_string = "0....."
        middle_row_string = "......"
        bottom_row_string = "......"
        array_of_three_strings = [top_row_string, middle_row_string, bottom_row_string]

        expected = [
            ["0.", "..", ".."], 
            ["..", "..", ".."],
            ["..", "..", ".."]
        ]

        assert_equal expected, @braille_to_en.separate_array_of_braille_strings_per_two_chars(array_of_three_strings)
    end

    def test_it_can_format_array_into_braille_format_array
        array_of_rows = [
            ["0.", "0.", "0."], 
            ["..", "..", ".."],
            ["..", "..", ".."]
        ]

        expected = [
            ["0.", "..", ".."],
            ["0.", "..", ".."],
            ["0.", "..", ".."]
        ]
        assert_equal expected, @braille_to_en.format_into_braille_char_array(array_of_rows)

        array_of_rows = [
            ["0.", "0.", "0.", "0."], 
            ["..", "..", "..", ".."],
            ["..", "..", "..", ".."]
        ]

        expected = [
            ["0.", "..", ".."],
            ["0.", "..", ".."],
            ["0.", "..", ".."],
            ["0.", "..", ".."]
        ]
        assert_equal expected, @braille_to_en.format_into_braille_char_array(array_of_rows)
    end

    def test_it_can_join_each_arrays_elements_together_with_newline
        arr_of_rows = [
            ["0.", "..", ".."],
            ["0.", "..", ".."],
            ["0.", "..", ".."]
        ]  

        expected_row1 = "0.\n..\n.."
        expected_row2 = "0.\n..\n.."
        expected_row3 = "0.\n..\n.."
        expected = [expected_row1, expected_row2, expected_row3]
        assert_equal expected, @braille_to_en.braille_as_strings(arr_of_rows)
    end

    def test_it_can_translate_braille_into_english_chars
        string_to_translate = "0.0...0.\n........\n........"

        assert_equal "aa a", @braille_to_en.translate(string_to_translate)
    end

    def test_it_can_split_file_of_over_80_chars_into_multiple_arrays_of_80_or_less
        
        string_of_305 = "0.0.0.0.0.0.0.0.0...0.0.0.0.0.0.0.0.0...0.0.0.0.0.0.0.0.0...0.0.0.0.0.0.0.0.0...\n................................................................................\n................................................................................\n0.0.0.0.0.0.0.0.0...\n....................\n...................."

        expected = ["0.0.0.0.0.0.0.0.0...0.0.0.0.0.0.0.0.0...0.0.0.0.0.0.0.0.0...0.0.0.0.0.0.0.0.0...\n................................................................................\n................................................................................\n", "0.0.0.0.0.0.0.0.0...\n....................\n...................."]
        assert_equal expected, @braille_to_en.separate_braille_over_80_chars_into_arrays(string_of_305)
    end

    def test_it_can_read_braille_file_of_over_80_chars
        string_of_50_en_chars = "0.0.0.0.0.0.0.0.0...0.0.0.0.0.0.0.0.0...0.0.0.0.0.0.0.0.0...0.0.0.0.0.0.0.0.0...\n................................................................................\n................................................................................\n0.0.0.0.0.0.0.0.0...\n....................\n...................."
        
        expected = "aaaaaaaaa aaaaaaaaa aaaaaaaaa aaaaaaaaa aaaaaaaaa "
        assert_equal expected, @braille_to_en.translate(string_of_50_en_chars)
    end
end