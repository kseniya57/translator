require_relative '../translator'
require 'rspec'

describe Translator do

  it 'translates from russian to english and outputs the result' do
    expect { Translator.привет }.to output("hi\n").to_stdout
    expect { Translator.send('Привет мир!') }.to output("Hello world!\n").to_stdout
  end

  it 'translates from english to russian and outputs the result' do
    expect { Translator.Hello('ru') }.to output("Привет\n").to_stdout
    expect { Translator.send('Hello world!', 'ru') }.to output("Всем привет!\n").to_stdout
  end

  it 'returns false if method is exit' do
    expect(Translator.exit).to eq false
  end

  it 'returns true if method is not exit' do
    expect(Translator.ok).to eq true
  end
end