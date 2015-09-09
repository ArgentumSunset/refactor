module Utilities

	SECONDS_IN_A_YEAR = 31536000.0
	
	def evaluate_leap_year?(x)
		is_divisible_by?(x,100) && is_divisible_by?(x,400) || is_divisible_by?(x,4) && !is_divisible_by?(x,100)
	end

	def percent_of_year(a)
		to_float(year_percent(a)) + '%'
	end

	def convert_to_military_time(x)
		a, b = x.split(":")
		c, d = b.split(" ")

		if d.downcase == 'pm'
			e = (a.to_i == 12 ? a + ':' + c : (a.to_i + 12).to_s + ':' + c)
		elsif d.downcase == 'am'
			e = (a.to_i == 12 ? e = (a.to_i - 12).to_s + ":" + c : e = a + ":" + c)
		end
	end

	def convert_to_standard_time(x)
		a, b = x.split(":")
		c = (a.to_i == 12 ? a + ':' + b + "PM" : (a.to_i < 12 ? a + ':' + b + " AM" : (a.to_i - 12).to_s + ':' + b + " PM"))
	end

	def bedtime?(time, bool)
		hours = time.split(":")[0].to_i
		am_or_pm = time.split(":")[1].split(" ")[1]

		(hours >= 8 && bool || hours >= 10 && !bool) && am_or_pm == 'PM' ? false : true
	end

	def difference_in_percentages(num_secs1, num_secs2)
		year_percent1 = percent_of_year(num_secs1)[0..-2].to_f
		year_percent2 = percent_of_year(num_secs2)[0..-2].to_f
		num_secs1 < num_secs2 ? total_percent(year_percent2,year_percent1) : total_percent(year_percent1, year_percent2)
	end
	private
		def is_divisible_by?(int, dividend)
			int % dividend == 0
		end
		def to_float(x)
			'%.1f' % x
		end
		def year_percent(a)
			(a / SECONDS_IN_A_YEAR) * 100
		end
		def total_percent(percent1, percent2)
			('%.1f' % (percent1 - percent2)).to_s + '%'
		end
end