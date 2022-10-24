require_relative 'spec_helper'
require_relative '../lib/caesar_cipher'

RSpec.describe 'Caesar Cipher Project\'s' do
	describe '.translate' do
		context "given hello, world!" do
	  		it 'works with low case, positive shift' do
		      	expected_output = "mjqqt, btwqi!"
		      	expect(translate("hello, world!", 5)).to eq(expected_output)
		    end

		    it 'works with low case, negative shift' do
		      	expected_output = "czggj, rjmgy!"
		      	expect(translate("hello, world!", -5)).to eq(expected_output)
		    end
		end

		context "given HELLO, WORLD!" do
		    it 'works with up case, positive shift' do
		      	expected_output = "OLSSV, DVYSK!"
		      	expect(translate("HELLO, WORLD!", 7)).to eq(expected_output)
		    end

		    it 'works with up case, negative shift' do
		      	expected_output = "AXEEH, PHKEW!"
		      	expect(translate("HELLO, WORLD!", -7)).to eq(expected_output)
		    end
	    end

	    context "given Hello, World" do
		    it 'works with both cases, positive shift' do
		      	expected_output = "Rovvy, Gybvn!"
		      	expect(translate("Hello, World!", 10)).to eq(expected_output)
		    end

		    it 'works with both cases, negative shift' do
		      	expected_output = "Xubbe, Mehbt!"
		      	expect(translate("Hello, World!", -10)).to eq(expected_output)
		    end
	    end

	    context "given unexpected shift factors" do
		    it 'works with 0 as shift factor' do
		    	expected_output = "Hello, World!"
		    	expect(translate("Hello, World!", 0)).to eq(expected_output)
		    end

		    it 'works without shift factor' do
		    	expected_output = "Khoor, Zruog!"
		    	expect(translate("Hello, World!")).to eq(expected_output)
		    end
		end
	end
end