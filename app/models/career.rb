# frozen_string_literal: true

class Career < ApplicationRecord
	
	has_many :jobs
	has_many :employees
	validates :name, 
			  :abbreviation, 
			  :level, 
			  :step, 
			  :quantity,
			  :category,
			  :workload,  presence: true

	rails_admin do
	  show do
	    field  :name
	    field  :abbreviation
	    field  :level
	    field  :step
	    field  :quantity
	    field  :category
	    field  :workload	    
	  end
	  list do
	    sort_by :name, :level, :step

	    field  :name
	    field  :abbreviation
	    field  :level
	    field  :step
	    field  :quantity
	    field  :category
	    field  :workload	    
	  end
	  edit do
	    field  :name
	    field  :abbreviation
	    field  :level
	    field  :step
	    field  :category
	    field  :workload
	  end
	end
end
