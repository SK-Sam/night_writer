class Writer

    def initialize(output_file_name, file_content)
        @output_file_name = output_file_name
        @file_content = file_content
        @en_to_braille_dict = EnToBrailleDict.new
        @braille_to_en_dict = BrailleToEnDict.new
    end

    def translate_en_to_braille
        File.open(@output_file_name, 'w') do |file|
            file.write(@en_to_braille_dict.translate(@file_content))
        end
    end

end