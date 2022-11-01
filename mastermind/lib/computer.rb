require_relative 'player'

class Computer
  private 
    def generate_code
      4.times.map { rand(5) + 1 }.join.to_i
    end
  #end of private methods

  public
    def create_code
      puts 'Computer has generated the code for you to guess!'
      generate_code
    end
    
    def guess(try_number)
      guess = generate_code
      puts "##{try_number} try: #{guess}"
      guess
    end

    def end_message(won)
      if won then
        'The computer cracked your code!'
      else
        'You are so smarter than a machine!'
      end
    end
end