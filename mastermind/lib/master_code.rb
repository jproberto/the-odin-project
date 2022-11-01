class MasterCode
  private
    def check_same_position(guess_array)
      guess_array.each_with_index do |e, i|
        if @compare[i] == e
          @compare[i] = "*"
          guess_array[i] = "*"
        end
      end

      guess_array
    end

    def check_other_positions(guess_array)
      guess_array.each_with_index do |e, i|
        if e != "*"
          if @compare.include? e
            guess_array[i] = "?"
            @compare[@compare.index(e)] = "?"
          else
            guess_array[i] = nil
          end
        end
      end

      guess_array
    end
  # end of private methods

  public
    def initialize(code)
      puts code
      @code = code
      @code_array = code.to_s.split("")
    end

    def compare_code(guess)
      @code_guessed = guess == @code
      return ["*", "*", "*", "*"] if @code_guessed

      @compare = @code_array.map { |e| e }

      guess_array = guess.to_s.split("")
      guess_array = check_same_position(guess_array)
      guess_array = check_other_positions(guess_array)

      @code_guessed = guess_array == ["*", "*", "*", "*"]
      guess_array.compact.sort
    end

    def code_guessed?
      @code_guessed
    end
end