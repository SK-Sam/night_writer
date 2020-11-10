require './test/test_helper'
require './lib/writer'
require './lib/en_to_braille_dict'
require './lib/braille_to_en_dict'

class WriterTest < MiniTest::Test

    def test_it_can_instantiate
        writer = Writer.new("./test/test_writer.txt", "./test/test.txt")

        assert_instance_of Writer, writer
    end

    def test_it_can_translate_from_en_to_braille
        writer = Writer.new("./test/test_writer.txt", "hello world")
        writer.translate_en_to_braille

        file_content = File.open("./test/test_writer.txt", 'r') do |file|
            file.read
        end

        expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
        assert_equal expected, file_content
    end

    def test_it_can_translate_from_braille_to_en
        hello_world_in_braille = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
        writer = Writer.new("./test/test.txt", hello_world_in_braille)
        writer.translate_braille_to_en

        file_content = File.open("./test/test.txt", 'r') do |file|
            file.read
        end

        expected = "hello world"
        assert_equal expected, file_content
    end
end