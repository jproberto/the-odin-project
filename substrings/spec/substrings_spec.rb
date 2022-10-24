require_relative 'spec_helper'
require_relative '../lib/substrings'

RSpec.describe 'Substrings Project\'s' do
	describe '.substrings' do
		it 'works with single word' do
			expected_output = { "below" => 1, "low" => 1 }
			dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  			expect(substrings("below", dictionary)).to eq(expected_output)
		end

		it 'works with multiple words' do
			expected_output = { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
			dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  			expect(substrings("Howdy partner, sit down! How's it going?", dictionary)).to eq(expected_output)
		end
	end
end