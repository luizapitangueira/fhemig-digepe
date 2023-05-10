class JobEffective < ApplicationRecord

  belongs_to :career

  validates :status, presence: true

  enum status: %i[busy switch shutdown]

  rails_admin do

    show do
      field  :id
      field  :career
      field  :status, :enum do 
        pretty_value do 
          value ? I18n.t("activerecord.attributes.job_effective.statuses.#{value}") : '-'
        end 
      end
      field  :start_date
      field  :finish_date
    end

    list do
      sort_by :id

      field  :id
      field  :career
      field  :status, :enum do 
        pretty_value do 
          value ? I18n.t("activerecord.attributes.job_effective.statuses.#{value}") : '-'
        end 
      end
      field  :start_date
      field  :finish_date
    end

    edit do
      field  :career
      field  :status, :enum do 
        enum do 
          array = JobEffective.statuses.map do |key,value|
            [I18n.t("activerecord.attributes.job_effective.statuses.#{key}"),value]
          end
          array.to_h
        end
      end
      field  :start_date
      field  :finish_date
    end

    create do
      field  :career
      field  :status, :enum do 
        enum do 
          array = JobEffective.statuses.map do |key,value|
            [I18n.t("activerecord.attributes.job_effective.statuses.#{key}"),value]
          end
          array.to_h
        end
      end
      field  :start_date
      field  :finish_date
    end

  end

end
