class Contract < ApplicationRecord

	belongs_to :job
	belongs_to :employee
	validates :start_date,
			  :estimate_finish_date, presence: true

	rails_admin do
	  weight +2
	  
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
