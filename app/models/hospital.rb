class Hospital < ApplicationRecord
	
	has_many :jobs

	validates :name, :abbreviation, presence: true

	rails_admin do
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
