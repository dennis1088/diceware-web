require 'sinatra'
require 'sinatra/reloader' if development?
require 'diceware'

get '/' do
  num_words = !params[:num_words].nil? ? params[:num_words].to_i : 6 
  capitalize = !params[:capitalize].nil?
  add_digit = !params[:add_digit].nil? 

  gen = Diceware::GeneratePassphrase.new
  gen_request = Diceware::GeneratePassphraseRequest.new(num_words, capitalize, add_digit)
  passphrase = gen.generate(gen_request)

  erb :index, locals: { passphrase: passphrase,
                        num_words: num_words,
                        capitalize: capitalize,
                        add_digit: add_digit }
end
