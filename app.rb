require 'sinatra'
require 'diceware'

get '/' do
    gen = Diceware::GeneratePassphrase.new
    genRequest = Diceware::GeneratePassphraseRequest.new(6)
    passphrase = gen.generate(genRequest)
    erb :index, :locals => {:passphrase => passphrase}
end
