require_relative './dictionary.rb'

filename = ARGV[0] || 'dictionary.txt'
file_array = File.readlines(filename).map(&:strip)
dictionary = Dictionary.new(file_array)

print "Writing sequences..."
IO.write('sequences.txt', dictionary.sequences.join("\n"))
puts "done"

print "Writing words..."
IO.write('words.txt', dictionary.words.join("\n"))
puts "done"
