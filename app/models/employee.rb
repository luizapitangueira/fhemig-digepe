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

	enum type_relationship: %i[effective contract other]

	rails_admin do

	  show do
	    field :cpf
	  	field :masp
	  	field :admission
	  	field :name
	  	field :career
	  	field :type_relationship, :enum do 
	    	pretty_value do 
	    		value ? I18n.t("activerecord.attributes.employee.type_relationships.#{value}") : '-'
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
    	field :type_relationship, :enum do 
	    	pretty_value do 
	    		value ? I18n.t("activerecord.attributes.employee.type_relationships.#{value}") : '-'
	    	end 
	    end
	  end

	  edit do
	  	field :cpf
	    field :masp
	    field :admission
	    field :name
	    field :career	    
	    field :type_relationship, :enum do 
			enum do 
				array = Employee.type_relationships.map do |key,value|
					[I18n.t("activerecord.attributes.employee.type_relationships.#{key}"),value]
				end
				array.to_h
			end
		end
	  end

	  create do
	  	field :cpf
	    field :masp
	    field :admission
	    field :name
	    field :career	    
	    field :type_relationship, :enum do 
			enum do 
				array = Employee.type_relationships.map do |key,value|
					[I18n.t("activerecord.attributes.employee.type_relationships.#{key}"),value]
				end
				array.to_h
			end
		end
	  end

	end
end
