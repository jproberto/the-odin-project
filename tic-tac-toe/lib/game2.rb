require_relative 'board2'
require_relative 'player'


class Game2

  private
    def self.start_game
      clear

      puts 'Let\'s play Tic Tac Toe? (Y/N)'
      answer = gets.chomp

      return false if answer == 'N' || answer == 'n'

      puts 'What\'s the name of Player 1?'
      name1 = gets.chomp
      @player1 = Player.new(name1, 'X')

      puts 'What\'s the name of Player 2?'
      name2 = gets.chomp

      while (name2 == name1)
        puts 'Players must have different names!'
        puts 'What\'s the name of Player 2?'
        name2 = gets.chomp
      end

      @player2 = Player.new(name2, 'O')

      puts 'All set!'
      puts 'Press any key to continue...'
      gets

      true
    end

    def self.clear
      system('cls')
    end
  # end of private methods

  public
  def self.run
    loop do
      new_game = start_game
      break if !new_game

      board = Board2.new

      round = [@player1, @player2]

      round_count = 0

      loop do 
        clear
        board.display
        break if (board.win? || round_count == 9)

        

        loop do
          puts "What\'s #{round[0].name} next move? (1 to 9)"
          position = gets.chomp.to_i
          
          if board.place_symbol(round[0].symbol, position - 1) then
            break
          else
            puts "Invalid position! Please choose another"
          end
        end

        round.reverse!
        round_count += 1
        puts ''        
      end

      if (board.win?)
        puts "Congratulations #{round[1].name}! You are the winner!"
        puts "#{round[0].name} should try harder next time..."
      else
        puts "It's a tie!"
      end

      gets
    end 

    puts "Thanks for playing! :)"
    gets
  end   
end
