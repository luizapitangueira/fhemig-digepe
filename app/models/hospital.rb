class Hospital < ApplicationRecord
	
	has_many :jobs

	validates :name, :abbreviation, presence: true

	rails_admin do
	  show do
	    field  :name
	    field  :abbreviation	    
	  end
	  list do
	    field  :name
	    field  :abbreviation	    
	  end
	  edit do
	    field  :name	    
	    field  :abbreviation
	  end
	end
end
