require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative 'utilities'

class Methods2Test < MiniTest::Test
	def setup
		@m = Class.new do
     include Utilities
   	end.new
	end

	def test_evaluate_leap_year 
		assert_equal true, @m.evaluate_leap_year?(4000)
		assert_equal false, @m.evaluate_leap_year?(2100)
		assert_equal false, @m.evaluate_leap_year?(2007)
		assert_equal true, @m.evaluate_leap_year?(2008)
	end

	def test_percent_of_year
		assert_equal '0.0%', @m.percent_of_year(1)
		assert_equal '36.8%', @m.percent_of_year(11605248)
		assert_equal '100.0%', @m.percent_of_year(31536000)
	end
end
