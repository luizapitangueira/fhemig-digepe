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
      field  :start_date
      field  :finish_date
    end

    list do
      sort_by :id

      field  :id
      field  :career
      field  :status
      field  :start_date
      field  :finish_date
    end

    edit do
      field  :career
      field  :status
      field  :start_date
      field  :finish_date
      field  :authorization
    end

    create do
      field  :career
      field  :status
      field  :start_date
      field  :finish_date
      field  :authorization, :hidden
    end

  end

end
