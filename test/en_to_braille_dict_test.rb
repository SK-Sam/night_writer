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

    def test_it_can_translate_multiple_chars
        string_to_translate = "ha"

        expected = "0.0.\n00..\n....\n"
        assert_equal expected, @en_to_braille.translate(string_to_translate)
    end

    def test_it_can_split_given_string_into_arr_of_braille
        expected = [["0.", "00", ".."],["0.", "..", ".."]]
        assert_equal expected, @en_to_braille.arr_of_braille("ha")
    end
end