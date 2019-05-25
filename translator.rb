require 'net/http'
require 'json'

API_KEY = 'trnsl.1.1.20190524T085306Z.731cfb7eea54d43a.b0ebbe951f36acff5116aecc4da5094c5b88ccf3'
API_URL = URI('https://translate.yandex.net/api/v1.5/tr.json/translate')

class Translator

  def self.exit(*_)
    puts 'Пока, приходи если нужна помощь с переводом:)'
    false
  end

  def self.help(*_)
    puts "Переводчик.\nexit - Выход\nhelp - Помощь\nОпции:\n--lang=? # задать язык, на который текст будет переведен (en по умолчанию)"
    true
  end

  def respond_to_missing?(*_)
    true
  end

  def self.method_missing(input, lang = 'en')
    params = {:key => API_KEY, :text => input, :lang => lang || 'en'}
    API_URL.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(API_URL)
    puts res.is_a?(Net::HTTPSuccess) ? JSON(res.body)['text'][0] : 'Не удалось получить перевод'
    true
  end

end