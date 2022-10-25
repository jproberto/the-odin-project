require_relative 'spec_helper'
require_relative '../lib/stock_picker'

RSpec.describe 'Stock Picker Project\'s' do
	describe '.stock_picker' do
	    it 'works' do
	    	expected_output = [3,4]
	    	expect(stock_picker([17,9,6,3,15,8,6,1,10])).to eq(expected_output)
	    end
		
		it '7 Days' do
	        prices = [17,3,6,9,15,8,6]
	       	expect(stock_picker(prices)).to eq([1,4])
	    end

	    it '14 Days' do
	      	prices = [42,3,6,9,15,8,6,20,12,14,2,9,18,1]
	     	expect(stock_picker(prices)).to eq([1,7])
	  	end
  end
end