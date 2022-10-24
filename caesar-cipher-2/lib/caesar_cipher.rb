def translate(message, shift = 3) 
	lower_case_letters = ("a".."z").to_a
	upper_case_letters = ("A".."Z").to_a

	# it's easier to work with a negative shift so we reverse everything
	if (shift > 0) then
		lower_case_letters.reverse!
		upper_case_letters.reverse!
		shift *= -1
	end

	new_message = ""

	message.each_char do |char|
		#check if it's a letter
		if (char.match?(/[[A-Za-z]]/)) then

			# checks if it's a lower or upper case letter
			if (char == char.downcase) then
				new_message += switch_letter(char, lower_case_letters, shift)
			else
				new_message += switch_letter(char, upper_case_letters, shift)
			end
		else
		# if it's not a letter, no modification is done
			new_message += char
		end
	end

	new_message
end

def switch_letter(char, array, shift)
	array[array.find_index(char) + shift]
end