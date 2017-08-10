require 'sinatra'
require 'diceware'

get '/' do
  gen = Diceware::GeneratePassphrase.new
  gen_request = Diceware::GeneratePassphraseRequest.new(6)
  passphrase = gen.generate(gen_request)
  erb :index, locals: { passphrase: passphrase, num_words: '6' }
end

post '/' do
  gen = Diceware::GeneratePassphrase.new
  gen_request = Diceware::GeneratePassphraseRequest.new(params[:num_words].to_i)
  passphrase = gen.generate(gen_request)
  erb :index, locals: { passphrase: passphrase, num_words: params[:num_words] }
end
