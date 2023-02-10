class Contract < ApplicationRecord

	belongs_to :job
	belongs_to :employee

	rails_admin do
	  show do
	    field :job
	  	field :employee
	  	field :start_date
	  	field :estimate_finish_date
	  	field :finish_date
	  end
	  list do
      	field :job
	  	field :employee
	  	field :start_date
	  	field :estimate_finish_date
	  	field :finish_date
	  end
	  edit do
	  	field :job
	  	field :employee
	  	field :start_date
	  	field :estimate_finish_date
	  	field :finish_date	    
	  end
	end
end
