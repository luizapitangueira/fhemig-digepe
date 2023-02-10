class Employee < ApplicationRecord
	
	belongs_to :career
	has_many :contracts
	validates :cpf, uniqueness: { scope: %i[masp admission], 
		    message: "cpf, masp and admission together must be unique" }
	validates :cpf, 
			  :masp,
			  :admission,
			  :name, presence: true

	rails_admin do
	  show do
	    field :cpf
	  	field :masp
	  	field :admission
	  	field :name
	  	field :career
	  end
	  list do
	    sort_by :name

      	field :cpf
    	field :masp
    	field :admission
    	field :name
    	field :career
	  end
	  edit do
	  	field :cpf
	    field :masp
	    field :admission
	    field :name
	    field :career	    
	  end
	end
end
