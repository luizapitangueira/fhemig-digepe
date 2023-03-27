class Job < ApplicationRecord

	belongs_to :career
	has_many :contracts

	validates :status, presence: true

	enum status: %i[active inactive switch]

	rails_admin do
	  show do
	    field  :id
	    field  :career
	    field  :status
	  end
	  list do
	    sort_by :id

	    field  :id
	    field  :career
	    field  :status
	  end
	end
end