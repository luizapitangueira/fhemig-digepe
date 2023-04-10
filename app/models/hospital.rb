# frozen_string_literal: true

class Hospital < ApplicationRecord
	
	has_many :jobs
	has_many :contracts

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
end
