class Job < ApplicationRecord

	belongs_to :career
	has_many :contracts
	validates :active, presence: true

	rails_admin do
	  show do
	    field  :id
	    field  :career
	    field  :active
	  end
	  list do
	    sort_by :id

	    field  :id
	    field  :career
	    field  :active
	  end
	end
end