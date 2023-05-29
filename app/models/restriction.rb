class Restriction < ApplicationRecord
  belongs_to :employee

  validates :employee, :type_restriction, :start_date, :time, presence: true

  enum type_restriction: %i[Agravo Família Capacitação Outro]

  rails_admin do

    show do
      field :employee
      field :cpf
      field :type_restriction
      field :description
      field :start_date, :date do
        strftime_format '%d/%m/%Y'
      end
      field :finish_date do
        formatted_value do
          bindings[:object].display_finish_date
        end
      end
      field :time
    end

    list do
      sort_by :employee

      field :employee
      field :cpf
      field :type_restriction
      field :start_date
      field :finish_date
      field :time
    end

    edit do
      field :employee
      field :type_restriction
      field :description
      field :start_date, :date do
        strftime_format '%d/%m/%Y'
        read_only true
      end
      field :finish_date, :date do
          strftime_format '%d/%m/%Y'
          read_only false
      end     
      field :time
    end

    create do
      field :employee
      field :type_restriction
      field :description
      field :start_date, :date do
        strftime_format '%d/%m/%Y'
        read_only false
      end
      field :finish_date, :date do
          strftime_format '%d/%m/%Y'
          read_only false
      end
      field :time
    end

  end

  def display_finish_date
    finish_date.present? ? finish_date.strftime('%d/%m/%Y') : '-'
  end

end
