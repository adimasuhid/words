class Dictionary
  DEFAULT_PHRASE_LENGTH = 4

  def initialize(contents)
    @contents = contents
    @phrases = {}

    setup_phrases
  end

  def sequence
    unique_phrases.keys
  end

  def words
    unique_phrases.values
  end

  private

  attr_reader :contents, :phrases

  def setup_phrases
    contents.each { |word| add_phrases_from(word) }
  end

  def add_phrases_from(word)
    counter = 0

    loop do
      min = counter
      max = counter + 3
      phrase = word[min..max]

      break if phrase.length < DEFAULT_PHRASE_LENGTH

      save(phrase, word)

      counter += 1
    end
  end

  def save(phrase, word)
    if phrases.has_key? phrase
      phrases[phrase] = nil
    else
      phrases[phrase] = word
    end
  end

  def unique_phrases
    phrases.select { |_,v| !v.nil? }
  end
end