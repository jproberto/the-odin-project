puts 'Iniciando...'

linhas = File.readlines('palavras.txt')

palavras = []

linhas.each do |linha|
  if linha.chomp.length >= 3 && linha.chomp.length <= 12 && !linha.include?('-')
    palavras << linha
  end
end

File.write('novo.txt', palavras.join)

puts 'Finalizado!'