require 'minitest/autorun'
require './lib/en_to_braille_dict'

class EnToBrailleDictTest < MiniTest::Test

    def setup
        @dictionary = EnToBrailleDict.new
    end

    def test_it_can_translate_single_chars
        string_to_translate = "h"
        assert_equal "0.\n00\n..", @dictionary.translate(string_to_translate)
    end
end