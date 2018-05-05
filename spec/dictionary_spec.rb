require 'rspec'
require_relative '../dictionary.rb'

describe Dictionary do
  let(:dictionary) { Dictionary.new(['arrows', 'carrot', 'give', 'me', 'Rowsy', 'U.S.A.F']) }

  describe '#sequences' do
    it 'returns collection of phrases with 4 letters' do
      max_length = dictionary.sequences.map(&:length).max
      expect(max_length).to eq 4
    end

    it 'returns non-repeating phrases' do
      expect(dictionary.sequences).to_not include 'arro'
      expect(dictionary.sequences).to eq ['rrow', 'carr', 'rrot', 'give', 'owsy', 'usaf']
    end

    it 'treats uppercase and lowercase letters as the same' do
      expect(dictionary.sequences).to_not include 'rows'
    end

    it 'does not count non-alphabetic letters in the count' do
      expect(dictionary.sequences).to include 'usaf'
    end
  end

  describe '#words' do
    it 'returns collection of words where phrases came from' do
      expect(dictionary.words).to eq ['arrows', 'carrot', 'carrot', 'give', 'Rowsy', 'U.S.A.F']
      expect(dictionary.words).to_not include 'me'
    end

    it 'returns words in the same sequence as displayed in #sequences' do
      sequences = dictionary.sequences
      words = dictionary.words

      sequences.length.times do |n|
        filtered_word = words[n].downcase.gsub(/[^a-z]/i, '')
        expect(filtered_word).to include sequences[n]
      end
    end
  end
end
