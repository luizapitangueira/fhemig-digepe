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
	    field  :status, :enum do 
	    	pretty_value do 
	    		value ? I18n.t("activerecord.attributes.job.statuses.#{value}") : '-'
	    	end 
	    end
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
	    field  :status, :enum do 
	    	pretty_value do 
	    		value ? I18n.t("activerecord.attributes.job.statuses.#{value}") : '-'
	    	end 
	    end
	    field  :workload
	    field  :if_switch
	  end

	  edit do
		field  :career
		field  :status, :enum do 
			enum do 
				array = Job.statuses.map do |key,value|
					[I18n.t("activerecord.attributes.job.statuses.#{key}"),value]
				end
				array.to_h
			end
		end
		field  :start_date
	    field  :finish_date
	    field  :if_switch
	    field  :why_switch
	    field  :notice
	    field  :notice_publish_date
	    field  :workload
	    field  :creation_type
	    field  :contracts
	  end

	end
end
