class Player < ActiveRecord::Base

	def to_s
		"#{self.name},  Number: #{self.number}"
	end

end