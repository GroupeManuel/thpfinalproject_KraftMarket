class Manipdate

	def perform(date)
		diff_in_days = (Time.now - date)/(3600*24)
		if diff_in_days < 1
			return pluralize(diff_in_days*24.to_i, 'heure')
		else
			return pluralize(diff_in_days*24.to_i, 'jour')
		end
	end

end