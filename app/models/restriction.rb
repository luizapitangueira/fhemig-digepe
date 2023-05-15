class Restriction < ApplicationRecord
  belongs_to :employee

  validates :employee, :type_restriction, :start_date, :time, presence: true

  enum type_restriction: %i[Agravo Família Capacitação Outro]

  rails_admin do

    show do
      field :employee
      field :type_restriction
      field :description
      field :start_date
      field :finish_date
      field :time
    end

    list do
      sort_by :employee

      field :employee
      field :type_restriction
      field :start_date
      field :finish_date
      field :time
    end

    edit do
      field :employee
      field :type_restriction
      field :description
      field :start_date
      field :finish_date
      field :time
    end

    create do
      field :employee
      field :type_restriction
      field :description
      field :start_date
      field :finish_date
      field :time
    end

  end


end
