require_relative 'player'

class Human < Player
  private
    def ask_for_code
      code = 0
      loop do
        code = gets.to_i
        break if code.to_s.size == 4
        puts 'Invalid code. Please insert another.'
      end

      code
    end
  # end of private methods

  public
    def create_code
      puts 'Please enter a 4 digit master code for the computer to break.'
      ask_for_code
    end
    
    def guess(try_number)
      puts "Guess the code! ##{try_number} try:"
      ask_for_code
    end

    def end_message(won)
      if won then
        'You found the code!'
      else
        'You couldn\'t find the code. Better luck next time...'
      end
    end
end