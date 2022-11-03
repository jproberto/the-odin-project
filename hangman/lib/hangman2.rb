def run
  blank = "_"
  @word = "casa"

  errors = []
  matches = []

  until errors.length == 5
    puts 'Type your guess...'
    guess = ""
    
    loop do
      guess = gets.chomp.downcase
      
      if guess.length != 1
        puts 'Only one letter...'
      elsif (errors.include? guess) || (matches.include? guess) then
        puts 'Try a different letter...'
      else
        break
      end
    end

    if (@word.include? guess)
      matches << guess
    else
      errors << guess
    end

    @word.each_char do |c|
      if matches.include? c
        print c
      else
        print blank
      end
    end
    puts
  end
end

run