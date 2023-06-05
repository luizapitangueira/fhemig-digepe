# frozen_string_literal: true

class Hospital < ApplicationRecord
	
	has_many :contracts
	has_many :contract_effectives

	validates :name, :abbreviation, presence: true
	before_destroy :check_dependencies

	def check_dependencies 
		if contracts.exists? || contract_effectives.exists?
			errors.add(:base, "Esse Hospital pertence a vínculos de contratos ou efetivos, não podendo portanto ser excluído")
			throw :abort
		end
	end

	rails_admin do
	  weight -3

	  show do
	    field  :name 
	    field  :abbreviation	    
	  end

	  list do
	    sort_by :name

	    field  :name
	    field  :abbreviation	    
	  end

	  edit do
	    field  :name	    
	    field  :abbreviation
	  end
	end

end
