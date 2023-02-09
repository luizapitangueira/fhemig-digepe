class Career < ApplicationRecord
	
	has_many :jobs

	validates :name, 
			  :abbreviation, 
			  :level, 
			  :step, 
			  :quantity,
			  :anual_impact,  presence: true

	rails_admin do
	  show do
	    field  :name
	    field  :abbreviation
	    field  :level
	    field  :step
	    field  :quantity
	    field  :anual_impact	    
	  end
	  list do
	    sort_by :name, :level, :step

	    field  :name
	    field  :abbreviation
	    field  :level
	    field  :step
	    field  :quantity
	    field  :anual_impact	    
	  end
	  edit do
	    field  :name
	    field  :abbreviation
	    field  :level
	    field  :step
	    field  :anual_impact
	  end
	end
end
