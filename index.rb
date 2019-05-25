#!/usr/bin/env ruby
require './translator'

loop do
  input, lang = gets.chomp.split /\s--lang=/

  if !input || input.length == 0
    puts 'Введите текст для перевода'
    next
  end

  break unless Translator.send(input, lang)
end