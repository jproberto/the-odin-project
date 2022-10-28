require_relative 'board'
require_relative 'player'


class Game

  private
    def self.start_game
      system('cls')

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
  # end of private methods

  public
  def self.run
    loop do
      new_game = start_game
      break if !new_game

      board = Board.new

      round = [@player1, @player2]

      loop do 
        loop do
          puts "What\'s #{round[0].name} next move?"
          puts "Row: "
          row = gets.chomp.to_i
          puts "Column: "
          col = gets.chomp.to_i

          if board.place_symbol(round[0].symbol, row - 1, col - 1) then
            break
          else
            puts "Invalid slot! Please choose another"
          end
        end

        break if (board.game_over? || board.full?)
        round.reverse!

        puts ''
      end

      if (board.game_over?)
        puts "Congratulations #{round[0].name}! You are the winner!"
        puts "#{round[1].name} should try harder next time..."
      else
        puts "It's a tie!"
      end

      gets
    end 

    puts "Thanks for playing! :)"
    gets
  end   
end

