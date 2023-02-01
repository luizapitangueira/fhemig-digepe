class Employee < ApplicationRecord
	validates :cpf, :name, presence: true

	rails_admin do
	  show do
	    field  :cpf	    
	    field  :name
	  end
	  list do
	    field  :cpf	    
	    field  :name
	  end
	  edit do
	    field  :cpf
	    field  :name	    
	  end
	end
end
