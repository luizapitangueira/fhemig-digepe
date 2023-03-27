class Contract < ApplicationRecord

	belongs_to :job
	belongs_to :employee
	belongs_to :hospital
	validates :start_date,
			  :estimate_finish_date, presence: true

	rails_admin do
	  weight +2
	  
	  show do
	    field :job
	  	field :employee
	  	field :hospital
	  	field :start_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  	field :estimate_finish_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  	field :finish_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  end
	  list do
      	field :job
	  	field :employee
	  	field :hospital
	  	field :start_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  	field :estimate_finish_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  	field :finish_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  end
	  edit do
	  	field :job
	  	field :employee
	  	field :hospital
	  	field :start_date, :date do
	  		read_only do
	  	  		strftime_format '%d/%m/%Y'
	  	  	end
	  	end
	  	field :estimate_finish_date, :date do
	  		read_only do
	  	  		strftime_format '%d/%m/%Y'
	  	  	end
	  	end
	  	field :finish_date, :date do
	  		read_only do
	  	  		strftime_format '%d/%m/%Y'
	  	  	end
	  	end	    
	  end
	end
end
