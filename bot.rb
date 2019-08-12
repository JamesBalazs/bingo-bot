require 'tts'
require 'to_words'

words = File.readlines('/usr/share/dict/words')

sorted_words = {}
('a'..'z').each do |letter|
  sorted_words[letter] = []
end

words.each do |word|
  first_letter = word[0].downcase
  next if !sorted_words.keys.include?(first_letter)
  sorted_words[first_letter] = sorted_words[first_letter].push(word.downcase)
end

(1..90).to_a.shuffle.each do |number|
  prefix = number.to_words.split(' ').map do |word|
    first_letter = word[0].downcase
    sorted_words[first_letter].sample
  end.join(' ').gsub("\n", '')
  call = "#{prefix}, #{number}"

  puts call
  call.play
  gets
end
