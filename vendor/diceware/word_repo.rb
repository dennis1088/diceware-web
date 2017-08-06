module Diceware
  class WordRepo
    def find(id)
      File.open(File.join(File.dirname(__FILE__), './diceware.wordlist')) do |f|
        f.any? do |line|
          if line[0..4] == id.to_s
            return line.split[1]
          end
        end
      end
    end
  end
end