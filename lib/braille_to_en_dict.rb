class BrailleToEnDict
    def initialize
        @dictionary_alpha = {
            "0.\n..\n.." => "a",
            "0.\n0.\n.." => "b",
            "00\n..\n.." => "c",
            "00\n.0\n.." => "d",
            "0.\n.0\n.." => "e",
            "00\n0.\n.." => "f",
            "00\n00\n.." => "g",
            "0.\n00\n.." => "h",
            ".0\n0.\n.." => "i",
            ".0\n00\n.." => "j",
            "0.\n..\n0." => "k",
            "0.\n0.\n0." => "l",
            "00\n..\n0." => "m",
            "00\n.0\n0." => "n",
            "0.\n.0\n0." => "o",
            "00\n0.\n0." => "p",
            "00\n00\n0." => "q",
            "0.\n00\n0." => "r",
            ".0\n0.\n0." => "s",
            ".0\n00\n0." => "t",
            "0.\n..\n00" => "u",
            "0.\n0.\n00" => "v",
            ".0\n00\n.0" => "w",
            "00\n..\n00" => "x",
            "00\n.0\n00" => "y",
            "0.\n.0\n00" => "z",
            "..\n..\n.." => " "
        }
    end

    def separate_to_three_lines(braille_string)
        braille_string.split("\n")
    end

    def separate_each_string_per_two_chars(braille_string)
        braille_string.chars.each_slice(2).map(&:join)
    end
end