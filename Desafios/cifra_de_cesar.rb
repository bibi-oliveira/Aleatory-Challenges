# frozen_string_literal: true

def cifra_cesar(word_to_encrypt, space = 3)
  word_to_encrypt.chars.map do |letter|
    number = letter.ord
    number = (number + space) if number.between?(65, 90) || number.between?(97, 122)
    number.chr
  end.join
end

def encrypt
  puts 'do you want to encrypt ?'
  word = gets.chomp.to_s
  puts cifra_cesar(word)
end

encrypt
