# frozen_string_literal: true

class Job < ApplicationRecord

	belongs_to :career
	has_many :contracts
	has_one :job

	validates :status, :if_switch, :creation_type, presence: true
	validates :authorization, length: { is: 6 }, on: :update

	enum creation_type: %i[Transformação Autorização Desligamento_de_Efetivo]
	enum status: %i[Livre Ocupada Publicada Transformada Reservada]
	
	rails_admin do

	  show do
	    field  :id
	    field  :career
	    field  :status
	    field  :job
	    field  :start_date
	    field  :finish_date
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
		field  :start_date
	    field  :finish_date
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
		field  :start_date
	    field  :finish_date
	    field  :if_switch
	    field  :why_switch
	    field  :notice
	    field  :notice_publish_date
	    field  :workload
	    field  :contracts
	    field  :authorization, :hidden
	  end

	end

end
