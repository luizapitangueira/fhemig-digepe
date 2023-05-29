class JobEffective < ApplicationRecord

  belongs_to :career
  has_many :contract_effectives

  validates :status, presence: true
  validates :authorization, length: { is: 6 }, on: :update

  enum status: %i[Ocupada Transformada Desligamento]

  rails_admin do

    show do
      field  :id
      field  :career
      field  :status
      field  :workload
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
    end

    list do
      sort_by :id

      field  :id
      field  :career
      field  :status
      field  :workload
      field  :start_date
      field  :finish_date
    end

    edit do
      field  :career
      field  :status
      field  :workload
      field  :start_date, :date do
          strftime_format '%d/%m/%Y'
          read_only false
      end     
      field  :finish_date, :date do
          strftime_format '%d/%m/%Y'
          read_only false
      end     
      field  :authorization
    end

    create do
      field  :career
      field  :status
      field  :workload
      field  :start_date, :date do
          strftime_format '%d/%m/%Y'
          read_only false
      end     
      field  :finish_date, :date do
          strftime_format '%d/%m/%Y'
          read_only false
      end     
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
