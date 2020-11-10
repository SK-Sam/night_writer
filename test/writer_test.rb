require './test/test_helper'
require './lib/writer'
require './lib/en_to_braille_dict'
require './lib/braille_to_en_dict'

class WriterTest < MiniTest::Test

    def test_it_can_instantiate
        writer = Writer.new("./test/test_writer.txt", "./test/test.txt")

        assert_instance_of Writer, writer
    end
end