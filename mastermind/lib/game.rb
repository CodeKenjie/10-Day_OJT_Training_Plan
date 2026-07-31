class Game
  attr_accessor :role, :code, :colors
  attr_reader :player

  def initialize(colors, player)
    @player = player
    @colors = colors
    @code = []
  end

  public
    def start
      loop do
        pick_role
        case self.role
        when 'guesser'
          generate_code
          attemps = 10

          while attemps >= 0
            puts "guess the code [ 1 = #{self.colors[0]}, 2 = #{self.colors[1]}, 3 = #{self.colors[2]}, 4 = #{self.colors[3]} ]"
            player.take_a_guess
            p self.code
            result = rate_guess(self.code, player.guess)
            puts result
            if guessed_correct?(self.code, player.guess)
              puts "You guessed correct color is [ #{self.colors[code[0] - 1]}, #{self.colors[self.code[1] - 1]}, #{self.colors[self.code[2] - 1]}, #{self.colors[self.code[3] - 1]} ]"
              break
            else
              puts "You guessed wrong. you have #{attemps} more tries"
            end
            attemps -= 1
          end
        when 'mastermind' then puts 'sorry not finished yet the guesser is done tho'
        when 'exit' then exit
        end
      end
    end

  private
    def pick_role
      puts "[exit]"
      print 'Choose your role [mastermind | guesser]: '
      picked_role = gets.chomp.downcase
      puts "Invalid role pick again" unless picked_role == 'mastermind' or picked_role == 'guesser' or picked_role == 'exit'
      self.role = picked_role
    end

    def generate_code
      while self.code.length < 4
        n = rand(1..4)
        self.code << n unless self.code.include?(n)
      end
      self.code
    end

    def guessed_correct?(code, guess)
      if code[0] == guess[0] and code[1] == guess[1] and code[2] === guess[2] and code[3] == guess[3]
        true
      else
        false
      end
    end

    def rate_guess(code, guess)
      black = 0
      white = 0

      copy_code = code.dup
      copy_guess = guess.dup

      4.times do |i|
        if copy_code[i] == copy_guess[i]
          black += 1
          copy_code[i] = nil
          copy_guess[i] = nil
        end
      end

      copy_guess.compact.each do |color|
        if index = copy_code.index(color)
          white += 1
          copy_code[index] = nil
        end
      end

      { black: black, white: white }
    end
end
