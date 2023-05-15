# frozen_string_literal: true

class Hospital < ApplicationRecord
	
	has_many :contracts
	has_many :contract_effectives

	#after_create :track_create

	validates :name, :abbreviation, presence: true

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

	#def track_create
	#	ApplicationController.new.track_create_action(binding)
	#		raise
	#end
end
