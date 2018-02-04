require 'sinatra'
require "sinatra/reloader" if development?
require 'diceware'

get '/' do
  gen = Diceware::GeneratePassphrase.new
  gen_request = Diceware::GeneratePassphraseRequest.new(6)
  passphrase = gen.generate(gen_request)
  erb :index, locals: { passphrase: passphrase, num_words: '6', capitalize: 'off', add_digit: 'off' }
end

post '/' do
  num_words = params[:num_words].to_i
  capitalize = params[:capitalize] == 'on' ? true : false
  add_digit = params[:add_digit] == 'on' ? true : false
  gen = Diceware::GeneratePassphrase.new
  gen_request = Diceware::GeneratePassphraseRequest.new(num_words, capitalize, add_digit)
  passphrase = gen.generate(gen_request)
  erb :index, locals: { passphrase: passphrase, num_words: params[:num_words], capitalize: params[:capitalize], add_digit: params[:add_digit] }
end
