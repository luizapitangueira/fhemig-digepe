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
	  	field '', :string do 
	  		label 'Última Restrição'
	  		formatted_value do 
	  			restricted = Restriction.where(employee: bindings[:object][:id]).last 
	  			if restricted
	  				"Tipo: #{restricted.type_restriction}, Data de Início: #{restricted.start_date}, Data de fim: #{restricted.finish_date}" 
	  			else
	  				'Não possui!'
	  			end
	  		end
	  	end
	  end

	  list do
	    sort_by :name

      	field :cpf
    	field :masp
    	field :admission
    	field :name
    	field :career
    	field "Categoria Profissional" do 
    		formatted_value do 
    			bindings[:object].career.category
    		end
    	end
    	field :type_relationship
    	field '', :string do 
	  		label 'Já Possuiu Restrição?'
	  		formatted_value do 
	  			restricted = Restriction.where(employee: bindings[:object][:id]).last 
	  			if restricted
	  				'Sim'
	  			else
	  				'Não'
	  			end
	  		end
	  	end
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
