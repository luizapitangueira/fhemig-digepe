class Job < ApplicationRecord

	belongs_to :career
	has_many :contracts

	validates :status, :if_switch, :creation_type, presence: true

	enum status: %i[free busy publish switch]
	enum creation_type: %i[notice switched]

	rails_admin do
	  show do
	    field  :id
	    field  :career
	    field  :status
	    field  :start_date
	    field  :finish_date
	    field  :if_switch
	    field  :why_switch
	    field  :notice
	    field  :notice_publish_date
	    field  :workload
	    field  :creation_type

	  end
	  list do
	    sort_by :id

	    field  :id
	    field  :career
	    field  :status
	    field  :workload
	    field  :if_switch
	  end
	end
end
