class EnToBrailleDict
    def initialize
        @dictionary_alpha = {
            "a" => "0.\n..\n..",
            "b" => "0.\n0.\n..",
            "c" => "00\n..\n..",
            "d" => "00\n.0\n..",
            "e" => "0.\n.0\n..",
            "f" => "00\n0.\n..",
            "g" => "00\n00\n..",
            "h" => "0.\n00\n..",
            "i" => ".0\n0.\n..",
            "j" => ".0\n00\n..",
            "k" => "0.\n..\n0.",
            "l" => "0.\n0.\n0.",
            "m" => "00\n..\n0.",
            "n" => "00\n.0\n0.",
            "o" => "0.\n.0\n0.",
            "p" => "00\n0.\n0.",
            "q" => "00\n00\n0.",
            "r" => "0.\n00\n0.",
            "s" => ".0\n0.\n0.",
            "t" => ".0\n00\n0.",
            "u" => "0.\n..\n00",
            "v" => "0.\n0.\n00",
            "w" => ".0\n00\n.0",
            "x" => "00\n..\n00",
            "y" => "00\n.0\n00",
            "z" => "0.\n.0\n00",
            " " => "..\n..\n.."
        }
    end

    def translate(en_string)    
        separate_string_per_40_chars(en_string.gsub("\n", " ")).map do |string|
            format_into_three_braille_strings(string)
        end.join
    end

    def separate_string_per_40_chars(en_string)
        en_string.chars.each_slice(40).map(&:join)
    end

    def arr_of_braille(en_string)
        arr_of_braille = en_string.split("").map do |letter|
            @dictionary_alpha[letter]
        end
        arr_of_braille.map do |braille|
            braille.split("\n")
        end
    end
    
    def format_into_three_arrays(en_string)
        line1 = []
        line2 = []
        line3 = []
        translation_container = [line1, line2, line3]
        arr_of_braille(en_string).each do |arr|
            line1 << arr[0]
            line2 << arr[1]
            line3 << arr[2]
        end
        translation_container
    end
    
    def format_into_three_braille_strings(en_string)
        format_into_three_arrays(en_string).each do |line|
            line << "\n"
        end.flatten.join
    end
end
