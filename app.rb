require 'sinatra'
require 'diceware'

get '/' do
  gen = Diceware::GeneratePassphrase.new
  genRequest = Diceware::GeneratePassphraseRequest.new(6)
  passphrase = gen.generate(genRequest)
  erb :index, :locals => {:passphrase => passphrase, :num_words => '6'}
end

post '/' do
  gen = Diceware::GeneratePassphrase.new
  genRequest = Diceware::GeneratePassphraseRequest.new(params[:num_words].to_i)
  passphrase = gen.generate(genRequest)
  erb :index, :locals => {:passphrase => passphrase, :num_words => params[:num_words]}
end
