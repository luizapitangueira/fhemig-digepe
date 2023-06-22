module HomeHelper
	def retrieve_contract_group_start_date
		Contract.where("start_date > ?", "2022-10-10").group(:start_date).count
	end

	def counting_level_careers
		Career.group(:level).count
	end

	def restrictions_by_units
		Employee
			.joins(:contracts, :restrictions)
			.joins('INNER JOIN hospitals h ON contracts.hospital_id = h.id')
			#.where('(restrictions.finish_date <= ? or restrictions.finish_date = null) and restrictions.start_date <= ?', Time.zone.now, Time.zone.now)
			.group('h.abbreviation')
			.order('h.abbreviation')
			.select('h.abbreviation')
			.count('employees.id') 
	end

	def count_contracts_due_in_90_days

	end 

	
end
