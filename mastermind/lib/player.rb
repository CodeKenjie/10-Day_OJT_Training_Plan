class Player
  attr_accessor :guess

  def initialize(name)
    @name = name
    @guess = ""
  end

  public 
    def take_a_guess
      loop do
        print "Take a guess: "
        answer = gets.chomp.strip(" ")
        if valid(answer)
          answer_to_array = answer.split("")
          answers = []
          answer_to_array.each { |n| answers << n.to_i }
          self.guess = answers
          self.guess
          break
        else
          puts 'Invalid Answer. please input 4 numbers'
        end
      end
    end

  private
    def valid(answer)
      if answer.length > 4 or answer.length < 4
        false
      else
        true
      end
    end
end
