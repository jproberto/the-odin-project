def stock_picker(stock_prices)
=begin
	days = Array.new
	best_profit = 0

	stock_prices_size = stock_prices.size

	stock_prices.each_with_index do |price, i|
		max_value = stock_prices.slice(i, stock_prices_size).max
		profit = max_value - price

		if (profit > best_profit) then
			days[0] = i
			days[1] = stock_prices.index(max_value)
			best_profit = profit
		end
	end

	days
=end

	# finds the combination that has the maximum difference
	best_values = stock_prices.combination(2).max_by{|b,s| s-b}

	# then returns the indexes
	[stock_prices.index(best_values[0]), stock_prices.index(best_values[1])]

end