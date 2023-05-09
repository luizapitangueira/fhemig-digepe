module HomeHelper
	def retrieve_contract_group_start_date
		Contract.where("start_date > ?", "2022-10-10").group(:start_date).count
	end

	def counting_level_careers
		Career.group(:level).count
	end

end
