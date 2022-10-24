def substrings(sentence, dictionary)
	result = Hash.new
	sentence = sentence.downcase

	dictionary.each do |entry|
		count = sentence.scan(entry).size
		result[entry] = count if (count > 0)
	end

	result
end