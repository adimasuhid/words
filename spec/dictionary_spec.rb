require 'rspec'
require_relative '../dictionary.rb'

describe Dictionary do
  let(:dictionary) { Dictionary.new(['arrows', 'carrot', 'give', 'me']) }

  describe '#sequence' do
    it 'returns collection of phrases with 4 letters' do
      max_length = dictionary.sequence.map(&:length).max
      expect(max_length).to eq 4
    end

    it 'returns non-repeating phrases' do
      expect(dictionary.sequence).to_not include 'arro'
      expect(dictionary.sequence).to eq ['rrow', 'rows', 'carr', 'rrot', 'give']
    end
  end

  describe '#words' do
    it 'returns collection of words where phrases came from' do
      expect(dictionary.words).to eq ['arrows', 'arrows', 'carrot', 'carrot', 'give']
      expect(dictionary.words).to_not include 'me'
    end

    it 'returns words in the same sequence as displayed in #sequence' do
      sequence = dictionary.sequence
      words = dictionary.words

      sequence.length.times do |n|
        expect(words[n]).to include sequence[n]
      end
    end
  end
end
