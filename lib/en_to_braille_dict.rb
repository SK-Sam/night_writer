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
            "l" => "0.\n0.\n..",
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
            "z" => "0.\n.0\n00"
        }
        @dictionary_numeric = {
            "#" => ".0\n.0\n00",
            "0" => ".0\n00\n..",
            "1" => "0.\n..\n..",
            "2" => "0.\n0.\n..",
            "3" => "0.\n0.\n..",
            "4" => "00\n.0\n..",
            "5" => "0.\n.0\n..",
            "6" => "00\n0.\n..",
            "7" => "00\n00\n..",
            "8" => "0.\n00\n..",
            "9" => ".0\n0.\n.."
        }
        @dictionary_punctiation = {
            "!" => "..\n00\n0.",
            "'" => "..\n..\n0.",
            "," => "..\n0.\n..",
            "-" => "..\n..\n00",
            "." => "..\n00\n.0",
            "?" => "..\n0.\n00"
        }
    end

    def translate(en_string)    
        return @dictionary_alpha[en_string] + "\n" if en_string.length == 1
        format_into_three_braille_strings(en_string)
    end

    def arr_of_braille(en_string)
        arr_of_braille = en_string.split("").map do |letter|
            @dictionary_alpha[letter]
        end
        arr_of_braille.map do |braille|
            braille.split("\n")
        end
    end

end
