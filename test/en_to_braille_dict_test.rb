require 'minitest/autorun'
require './lib/en_to_braille_dict'

class EnToBrailleDictTest < MiniTest::Test

    def setup
        @en_to_braille = EnToBrailleDict.new
    end

    def test_it_can_instantiate_with_a_set_dictionary
        assert_equal "a", @en_to_braille.dictionary.keys[0]
    end

    def test_it_can_translate_single_chars
        string_to_translate = "h"
        assert_equal "0.\n00\n..", @en_to_braille.translate(string_to_translate)
    end
end