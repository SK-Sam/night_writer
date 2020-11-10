# Night Writer

### Night Writer is a project which can translate english characters to braille by using the file `night_writer`, and by using `night_reader.rb` we can translate a file from braille to english

### Follow the instructions in the Terminal as it should direct you on how to target files to translate. Text files should live in the root directory of this repo in order to be used.

### Braille characters are represented as 3x2 rows x columns. [Refer here to see the dictionary being utilized for these translations](https://braillebug.org/braille_print.asp)

### Rules for the programs `night_writer` and `night_reader`:
  - Maximum Braille chars per row is 40
  - Any inappropriate newline's or preemptive newlines are treated as spaces to ease the reading in Braille
  - Spaces are counted in summary since an empty space is considered a Braille character
  - No implementation of translating punctiation, capital letters, or numbers
