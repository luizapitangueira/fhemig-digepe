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
	  	configure :start_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  	configure :estimate_finish_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  	configure :finish_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  end
	  list do
      	field :job
	  	field :employee
	  	field :hospital
	  	configure :start_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  	configure :estimate_finish_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  	configure :finish_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  end
	  edit do
	  	field :job
	  	field :employee
	  	field :hospital
	  	configure :start_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  	configure :estimate_finish_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end
	  	configure :finish_date, :date do
	  	  strftime_format '%d/%m/%Y'
	  	end	    
	  end
	end
end
