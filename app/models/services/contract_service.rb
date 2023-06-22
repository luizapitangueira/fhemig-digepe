# frozen_string_literal: true

class ContractService
	class << self
		def count_contracts_due_in_90_days
			Contract.
				where("estimate_finish_date < ? ", 90.days.from_now).
				where("estimate_finish_date > ? ", 1.days.ago).
				count
		end

		
		def data_contracts_due_in_90_days
			Contract
			.where("estimate_finish_date < ? ", 90.days.from_now)
			.where("estimate_finish_date > ? ", 1.days.ago)
			.order(:estimate_finish_date)
		end
	end
end

