class Reader
    attr_reader :input_file_name, :output_file_name, :input_as_string

    def self.take_user_input_en_to_braille
        print "Please enter the name you would like to be translated into braille: "
        input_file = gets.chomp
        print "Please enter the name you would like for the braille text file: "
        output_file = gets.chomp
        new(input_file, output_file)
    end

    def initialize(input_file_name, output_file_name)
        @input_file_name = input_file_name
        @output_file_name = output_file_name
        @input_as_string = nil
    end

    def read_file
        File.open(@input_file_name, 'r') do |file|
            @input_as_string = file.read
        end
    end


end