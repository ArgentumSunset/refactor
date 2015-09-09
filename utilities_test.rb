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

	def test_convert_to_military_time 
		assert_equal '10:32', @m.convert_to_military_time('10:32 AM')
		assert_equal '14:12', @m.convert_to_military_time('2:12 PM')
	end

	def test_convert_to_standard_time
		assert_equal '10:32 AM', @m.convert_to_standard_time('10:32')
		assert_equal '2:12 PM', @m.convert_to_standard_time('14:12')
	end

	def test_bedtime 
		assert_equal true, @m.bedtime?('9:34 PM', false)
		assert_equal false, @m.bedtime?('9:34 PM', true)
		assert_equal true, @m.bedtime?('3:12 AM', true)
		assert_equal true, @m.bedtime?('3:12 AM,', false)
	end
	
	def test_difference_in_percentages
		assert_equal '1.0%', @m.difference_in_percentages(315360,637200)
		assert_equal '1.0%', @m.difference_in_percentages(637200,315360)
		assert_equal '50.0%', @m.difference_in_percentages(0,15768000)
	end
end
