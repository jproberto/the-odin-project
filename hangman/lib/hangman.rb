class Hangman
  BLANK = '_'

  def initialize
    @extension = '.hgm'
    @dir_saved = 'saved/'
  end

  private
    def new_game
      @word = File.readlines('palavras.txt').sample.to_s.chomp
      @errors = []
      @matches = []
      @win = false
    end

    def load_game
      filename = choose_saved_game

      if filename == ''
        new_game
      else
        linhas = File.readlines(File.join(Dir.pwd, filename))

        @word = linhas[0].to_s.chomp
        @errors = linhas[1].to_s.chomp.split(',')
        @matches = linhas[2].to_s.chomp.split(',')
        @win = false  
      end
    end

    def saved_files
      Dir.glob(@dir_saved+'*').map { |file| file[(file.index('/') + 1)...(file.index('.'))] } 
    end

    def choose_saved_game
      clear_screen
      puts "Esses são os jogos salvos:"

      filenames = saved_files
      puts filenames

      puts
      puts "Digite o nome do arquivo desejado ou 1 para começar um novo jogo."

      filename = ''
      loop do
        filename = gets.chomp
        break if filenames.include? filename || filename == "1"

        puts "Opção inválida. Tente novamente."
      end

      if filename == "1"
        return ''
      else
        puts "Carregando #{filename}..."
        @dir_saved+filename+@extension
      end
    end

    def display
      clear_screen

      @win = true

      print "Descubra a palavra:"
      @word.each_char do |c|
        if @matches.include? c
          print c
        else
          print BLANK
          @win = false
        end
      end

      puts 
      puts "Palpites errados: #{@errors.join(', ')}"
      puts
    end

    def clear_screen
      system('cls')
    end

    def ask
      print "Digite uma letra (Ou 1, caso queira encerrar o jogo): "

      guess = ''

      loop do
        guess = gets.chomp

        break if guess == "1"
        
        guess.to_s.upcase!

        puts
        if guess.match?(/[[:alpha:]]/) && guess.length == 1
          if @errors.include?(guess) || @matches.include?(guess)
            puts "Palpite já feito. Tente de novo."
          else
            break
          end
        else
          puts "Palpite inválido. Tente de novo."
        end
      end

      guess
    end

    def save
      filenames = saved_files

      puts "Digite o nome com o qual deseja salvar seu jogo"
      
      filename = ''
      loop do 
        filename = gets.chomp
        break unless filenames.include? filename

        puts "Já existe um jogo com esse nome, tente novamente"
      end

      File.write(@dir_saved+filename+@extension, [@word,@errors.join(","),@matches.join(",")].join("\n"))
    end
  # end of private methods

  public
    def run
      loop do
        clear_screen
        puts "Bem vinde à Forca"
        puts "Escolha 1 para começar um novo jogo ou 2 para carregar um jogo salvo"

        option = ''
        loop do
          option = gets.chomp.to_i
          break if [1, 2].include? option

          puts "Opção inválida, tente novamente"
        end

        if option == 1
          new_game
        else
          load_game
        end

        loop do
          display
          break if (@win || @errors.length == 6)

          guess = ask

          if guess == "1"
            puts "Deseja realmente sair? (1 para continuar jogando, 2 para salvar e sair, qualquer outra tecla para sair sem salvar)"

            option = gets.chomp.to_i
            
            next if option == 1

            if option == 2
              save
              break
            else 
              break
            end
          end

          if @word.include? guess
            @matches << guess
          else
            @errors << guess
          end
        end

        display
      
        puts

        if @win
          puts "Parabéns! Você venceu!"
        elsif option == 2
          puts "Jogo salvo!"
        else
          puts "Você foi enforcado! A palavra era #{@word}!"
        end

        puts
        puts "Deseja jogar novamente? (S para Sim, qualquer outra tecla para encerrar)"
        break unless gets.chomp.to_s.upcase == "S"
      end
    end
end

Hangman.new.run