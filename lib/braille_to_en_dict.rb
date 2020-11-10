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
    
    def separate_array_of_braille_strings_per_two_chars(braille_array)
        braille_array.map do |row|
            separate_each_string_per_two_chars(row)
        end
    end

    def format_into_braille_char_array(braille_char_arr)
        braille_char_arr[0].zip(braille_char_arr[1], braille_char_arr[2])
    end

    def braille_as_strings(braille_char_arr)
        joined_string = braille_char_arr.map do |row|
            row.join("\n")
        end
    end

    def translate(braille_string)
        separated_arr_into_rows = separate_array_of_braille_strings_per_two_chars(separate_to_three_lines(braille_string))
        columned_format = format_into_braille_char_array(separated_arr_into_rows)
        braille_as_strings(columned_format).map do |braille_chars|
            @dictionary_alpha[braille_chars]
        end.join
    end

end