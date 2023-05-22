# frozen_string_literal: true

class CareerService
	class << self
		def count_careers
			{
				total: Career.all.count
			}
		end
	end
end