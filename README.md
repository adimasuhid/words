# Words

A simple program to generate sequences and words from a dictionary

## Prerequisites
ruby >= 2.0

## Usage

### Direct from console
Given a custom file name
```
ruby ./dictionary_writer.rb <filename>
```

To use the default `dictionary.txt`
```
ruby ./dictionary_writer.rb
```

### Used as a library
```
require 'dictonary.rb'

dictionary = Dictionary.new(['arrows', 'carrot', 'give', 'me', 'Rowsy', 'U.S.A.F'])

dictionary.sequences #=> ['rrow', 'carr', 'rrot', 'give', 'owsy', 'usaf']
dictionary.words #=> ['arrows', 'carrot', 'carrot', 'give', 'Rowsy', 'U.S.A.F']
```

## Output
`dictionar_writer.rb` outputs two files:
- `sequences.txt` - contains all unique 4-letter sequences from the given file
- `words.txt` - contains all the words that have unique 4-letter sequences, following the sequence of the phrases from `sequences.txt`

## Assumptions

The 4-letter sequences are chosen with the following assumptions:
- Uppercase and downcase letters counts as the same
- Only alphabet letters are counted (i.e. `‘` and `.` are not counted)

## Decisions
- No tests are added for `dictionary_writer.rb` since it’s a simple procedural program that reads from a file and outputs two files. Testing it would only be testing ruby’s capability to read/write files and not necessarily any logic related to the problem. All logic for creating sequences and words are in `dictionary_spec.rb`.
- This solution priortized reusability/readability over speed. If we need to account for speed, we will need to read and consume the words in the file line by line instead of all at once using the `Dictionary` class.

