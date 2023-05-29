# frozen_string_literal: true

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
	  	field :finish_date do
	  	  formatted_value do
	  	  	bindings[:object].display_finish_date
	  	  end
	  	end
	  end

	  list do
      	field :job
	  	field :employee
	  	field :hospital
	  	field :start_date
	  	field :estimate_finish_date
	  	field :finish_date
	  end

	  edit do
	  	field :job
	  	field :employee
	  	field :hospital
	  	field :start_date, :date do
	  	 	strftime_format '%d/%m/%Y'
	  	 	read_only true
	  	end
	  	field :estimate_finish_date, :date do
  	  		strftime_format '%d/%m/%Y'
  	  		read_only true
	  	end
	  	field :finish_date, :date do
  	  		strftime_format '%d/%m/%Y'
  	  		read_only false
	  	end	    
	  end

	  create do
	  	field :job
	  	field :employee
	  	field :hospital
	  	field :start_date, :date do
	  	 	strftime_format '%d/%m/%Y'
	  	 	read_only false
	  	end
	  	field :estimate_finish_date, :date do
  	  		strftime_format '%d/%m/%Y'
  	  		read_only false
	  	end
	  	field :finish_date, :date do
  	  		strftime_format '%d/%m/%Y'
  	  		read_only false
	  	end	    
	  end

	end

	def display_finish_date
		finish_date.present? ? finish_date.strftime('%d/%m/%Y') : '-'
	end
end
