class Job < ApplicationRecord

	rails_admin do
	  show do
	    field  :hospital
	    field  :employee
	    field :career
	  end
	  list do
	    field  :hospital
	    field  :employee
	    field :career
	  end
	  edit do
	    field  :hospital
	    field  :employee
	    field :career
	  end
	end
end
