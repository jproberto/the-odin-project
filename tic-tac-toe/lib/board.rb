class Board
  def initialize
    @grid = [
            [' ', ' ', ' '],
            [' ', ' ', ' '],
            [' ', ' ', ' ']
          ]

    @game_over = false
    @round_count = 0

    draw
  end

  private
    def win?(x, y)
      # checks if the row is full with the same symbol
      return true if @grid[x].uniq.count == 1

      # checks if the column is full with the same symbol
      return true if @grid[0][y] == @grid[1][y] && @grid[1][y] == @grid[2][y]

      # if it's a diagonal slot, check if the other slots have the same symbol
      if (x == 0 && y == 0) || (x ==1 && y == 1) || (x == 2 && y == 2) then
        return true if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]
      end

      if (x == 0 && y == 2) || (x ==1 && y == 1) || (x == 2 && y == 0) then
        return true if @grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0]
      end

      # if nothing matches, it's not a win
      false
    end

    def draw
      system('cls')
      puts ''
      puts '   ' + @grid[0][0] + '|' + @grid[0][1] + '|' + @grid[0][2]
      puts '   ' + '—+—+—'
      puts '   ' + @grid[1][0] + '|' + @grid[1][1] + '|' + @grid[1][2]
      puts '   ' + '—+—+—'
      puts '   ' + @grid[2][0] + '|' + @grid[2][1] + '|' + @grid[2][2]
      puts ''
    end

    def positionNotEmpty?(x, y)
      @grid[x][y] != ' '
    end
  # end of private methods

  public
    def place_symbol(symbol, x, y)
      return false if x < 0 || x > 2 || y < 0 || y > 2
      return false if positionNotEmpty?(x, y)

      @grid[x][y] = symbol
      @game_over = win?(x, y)
      @round_count += 1
      draw
      return true
    end

    def game_over?
      @game_over
    end

    def full?
      @round_count == 9
    end
end
