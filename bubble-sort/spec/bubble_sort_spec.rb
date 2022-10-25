require_relative 'spec_helper'
require_relative '../lib/bubble_sort'

RSpec.describe 'Bubble Sort Project\'s' do
	describe '.bubble_sort' do
		it 'works with numbers' do
			expected_output = [0,2,2,3,4,78]
  			expect(bubble_sort([4,3,78,2,0,2])).to eq(expected_output)
		end

		it 'works with strings' do
			expected_output = ["hello", "hey", "hi"]
  			expect(bubble_sort(["hi","hello","hey"])).to eq(expected_output)
		end
	end	
end