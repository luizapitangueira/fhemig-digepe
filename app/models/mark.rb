class Mark < ApplicationRecord

	validates :n_jobs, :n_workload, :publication_date, presence: true

	rails_admin do

	  show do
	  	field :publication_date
	    field :n_jobs
	  	field :n_workload
	  end

	  list do
	    sort_by :publication_date

	  	field :publication_date
	    field :n_jobs
	  	field :n_workload
	  end

	  edit do
	  	field :publication_date
	    field :n_jobs
	  	field :n_workload
	  end

	  create do
	  	field :publication_date
	    field :n_jobs
	  	field :n_workload
	  end

	end


end
