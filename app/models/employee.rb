# frozen_string_literal: true

class Employee < ApplicationRecord
	
	belongs_to :career
	has_many :contracts
	has_many :restrictions

	validates :cpf, uniqueness: { scope: %i[masp admission], 
		    message: "cpf, masp and admission together must be unique" }

	validates :cpf, 
			  :masp,
			  :admission,
			  :name, 
			  :type_relationship, presence: true

	enum type_relationship: %i[Efetivo Contrato Outro]

	rails_admin do

	  show do
	    field :cpf
	  	field :masp
	  	field :admission
	  	field :name
	  	field :career
	  	field :type_relationship
	  end

	  list do
	    sort_by :name

      	field :cpf
    	field :masp
    	field :admission
    	field :name
    	field :career
    	field :type_relationship
	  end

	  edit do
	  	field :cpf
	    field :masp
	    field :admission
	    field :name
	    field :career	
	    field :type_relationship    
	  end

	  create do
	  	field :cpf
	    field :masp
	    field :admission
	    field :name
	    field :career	    
	    field :type_relationship
	  end

	end
end
