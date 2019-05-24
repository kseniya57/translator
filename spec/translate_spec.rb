require_relative '../translate'
require 'rspec'

describe '#translate' do

  it 'translate from russian to english' do
    expect(translate('Привет', 'en')).to eq 'Hi'
    expect(translate('Привет мир!', 'en')).to eq 'Hello world!'
  end

  it 'translate from english to russian' do
    expect(translate('Hello', 'ru')).to eq 'Привет'
    expect(translate('Hello world!', 'ru')).to eq 'Всем привет!'
  end

  it 'should not throw error if an error has occured' do
    expect(translate('', 'ru')).to eq 'Не удалось получить перевод'
  end
end