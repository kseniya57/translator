#!/usr/bin/env ruby
require './translate'

loop do
  input, lang = gets.chomp.split /\s--lang=/

  if input == 'exit'
    puts 'Пока, приходи если нужна помощь с переводом:)'
    break
  end

  if input == 'help'
    puts "Переводчик.\nexit - Выход\nhelp - Помощь\nОпции:\n--lang=? # задать язык, на который текст будет переведен (en по умолчанию)"
    next
  end

  if input.length == 0
    puts 'Введите текст для перевода'
    next
  end

  puts translate input, lang
end