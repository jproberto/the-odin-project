class Board2
  def initialize
    @grid = Array.new(9, ' ')
    @win_combinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    @win = false
  end

  def display
    puts ''
    puts '   ' + @grid[0] + '|' + @grid[1] + '|' + @grid[2]
    puts '   ' + '—+—+—'
    puts '   ' + @grid[3] + '|' + @grid[4] + '|' + @grid[5]
    puts '   ' + '—+—+—'
    puts '   ' + @grid[6] + '|' + @grid[7] + '|' + @grid[8]
    puts ''
  end

  def place_symbol(symbol, position)
    return false if @grid[position] != ' '

    @grid[position] = symbol

    @win_combinations.map! do |combination| 
      combination.map! do |element| 
        if element == position then
          element = symbol
        else
          element = element
        end
      end
    end

    true
  end

  def win?
    @win_combinations.collect { |combination| combination if combination.uniq.size == 1 }.compact.size == 1
  end
end