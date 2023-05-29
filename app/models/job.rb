# frozen_string_literal: true

class Job < ApplicationRecord

	belongs_to :career
	has_many :contracts
	has_one :job

	validates :status, :if_switch, :creation_type, presence: true
	validates :authorization, length: { is: 6 }, on: :update

	enum creation_type: %i[Transformação Autorização Desligamento_de_Efetivo]
	enum status: %i[Livre Ocupada Publicada Transformada Reservada]
	enum if_switch: %i[Não Sim]
	
	rails_admin do

	  show do
	    field  :id
	    field  :career
	    field  :status
	    field  :job
	    field  :start_date do
	  	  formatted_value do
	  	  	bindings[:object].display_start_date
	  	  end
	  	end
	    field  :finish_date do
	  	  formatted_value do
	  	  	bindings[:object].display_finish_date
	  	  end
	  	end
	    field  :if_switch
	    field  :why_switch
	    field  :notice
	    field  :notice_publish_date
	    field  :workload
	  end

	  list do
	    sort_by :id

	    field  :id
	    field  :career
	    field  :status
	    field  :creation_type
	    field  :workload
	    field  :if_switch
	  end

	  edit do
		field  :career
		field  :status
		field  :creation_type
		field  :job
		field  :start_date, :date do
  	  		strftime_format '%d/%m/%Y'
  	  		read_only false
	  	end	    
	    field  :finish_date, :date do
  	  		strftime_format '%d/%m/%Y'
  	  		read_only false
	  	end	    
	    field  :if_switch
	    field  :why_switch
	    field  :notice
	    field  :notice_publish_date
	    field  :workload
	    field  :contracts
	    field  :authorization
	  end

	  create do
		field  :career
		field  :status
		field  :creation_type
		field  :job
		field  :start_date, :date do
  	  		strftime_format '%d/%m/%Y'
  	  		read_only false
	  	end	    
	    field  :finish_date, :date do
  	  		strftime_format '%d/%m/%Y'
  	  		read_only false
	  	end	    
	    field  :if_switch
	    field  :why_switch
	    field  :notice
	    field  :notice_publish_date
	    field  :workload
	    field  :contracts
	    field  :authorization, :hidden
	  end

	end

	def display_finish_date
		finish_date.present? ? finish_date.strftime('%d/%m/%Y') : '-'
	end

	def display_start_date
		start_date.present? ? start_date.strftime('%d/%m/%Y') : '-'
	end

end
