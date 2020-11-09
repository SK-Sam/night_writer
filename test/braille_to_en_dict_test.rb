require './lib/braille_to_en_dict'
require 'minitest/autorun'

class BrailleToEnDictTest < MiniTest::Test
    def setup
        @braille_to_en = BrailleToEnDict.new
    end

    def test_it_can_instantiate_with_a_set_dictionary
        assert_instance_of BrailleToEnDict, @braille_to_en
    end
end