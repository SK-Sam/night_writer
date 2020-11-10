require 'minitest/autorun'
require './lib/en_to_braille_dict'

class EnToBrailleDictTest < MiniTest::Test

    def setup
        @en_to_braille = EnToBrailleDict.new
    end

    def test_it_can_instantiate_with_a_set_dictionary
        assert_instance_of EnToBrailleDict, @en_to_braille
    end

    def test_it_can_translate_single_chars
        string_to_translate = "h"
        assert_equal "0.\n00\n..\n", @en_to_braille.translate(string_to_translate)
    end

    def test_it_can_split_given_string_into_arr_of_braille
        expected = [["0.", "00", ".."],["0.", "..", ".."]]
        assert_equal expected, @en_to_braille.arr_of_braille("ha")
    end

    def test_it_can_separate_braille_array_into_three_lines_format
        expected = [["0.", "0."], ["00", ".."], ["..", ".."]]
        assert_equal expected, @en_to_braille.format_into_three_arrays("ha")
    end

    def test_it_can_turn_three_arrays_into_three_braille_strings
        expected = "0.0.\n00..\n....\n"  
        assert_equal expected, @en_to_braille.format_into_three_braille_strings("ha")
    end

    def test_it_can_translate_multiple_chars
        string_to_translate = "ha"

        expected = "0.0.\n00..\n....\n"
        assert_equal expected, @en_to_braille.translate(string_to_translate)
    end

    def test_it_can_handle_spaces
        string_to_translate = "hello world"

        expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
        assert_equal expected, @en_to_braille.translate(string_to_translate)
    end

    def test_string_is_divided_per_40_into_array_of_strings
        string_of_44 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        string_of_88 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

        expected = ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "aaaa"]
        expected_88_size = ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "aaaaaaaa"]
        assert_equal expected, @en_to_braille.separate_string_per_40_chars(string_of_44)
        assert_equal expected_88_size, @en_to_braille.separate_string_per_40_chars(string_of_88)
    end

    def test_it_can_newline_after_40_en_characters
        fourty_one_char_string_to_translate = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

        assert_equal 6, @en_to_braille.translate(fourty_one_char_string_to_translate).count("\n")
    end
end