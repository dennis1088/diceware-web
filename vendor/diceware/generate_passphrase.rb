module Diceware
  class GeneratePassphrase
    def initialize(words_repo = WordRepo.new)
      @words_repo = words_repo
    end

    def generate(num_words)
      words = Array.new

      num_words.times do
        randomIndex = (0..4).map { rand(1..6) }.join.to_i 
        words << @words_repo.find(randomIndex)
      end

      words.join('-')
    end
  end
end
