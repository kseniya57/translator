require 'net/http'
require 'json'
API_KEY = 'trnsl.1.1.20190524T085306Z.731cfb7eea54d43a.b0ebbe951f36acff5116aecc4da5094c5b88ccf3'
API_URL = URI('https://translate.yandex.net/api/v1.5/tr.json/translate')

def translate(input, lang)
  params = {:key => API_KEY, :text => input, :lang => lang || 'en'}
  API_URL.query = URI.encode_www_form(params)

  res = Net::HTTP.get_response(API_URL)

  res.is_a?(Net::HTTPSuccess) ? JSON(res.body)['text'][0] : 'Не удалось получить перевод'
end