require_relative 'human'
require_relative 'computer'
require_relative 'master_code'

class Game
  def self.clear
    system('cls')
  end

  def self.run
    puts 'Let\'s play Mastermind!'
    puts 'Press 1 to play as maker, 2 to play as breaker'
    
    option = 0 

    loop do
      option = gets.chomp.to_i

      break if option == 1 || option == 2
      puts 'I don\'t understand. Say it again'
    end

    clear

    if option == 1 then
      @maker = Human.new
      @breaker = Computer.new
    else
      @maker = Computer.new
      @breaker = Human.new
    end

    master_code = MasterCode.new(@maker.create_code)

    12.times do |i|
      guess = @breaker.guess(i+1)
      result = master_code.compare_code(guess)
      puts "Result: #{result}"

      break if master_code.code_guessed?
    end

    puts @breaker.end_message(master_code.code_guessed?)
    
  end
end