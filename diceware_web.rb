require 'sinatra'
require './vendor/diceware'

get '/' do
    gen = Diceware::GeneratePassphrase.new
    gen.generate(6)
end
