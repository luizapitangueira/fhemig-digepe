class ContractEffective < ApplicationRecord

  belongs_to :jobeffective
  belongs_to :employee
  belongs_to :hospital

  validates :if_office, presence: true

  rails_admin do

    show do
      field :jobeffective
      field :employee
      field :hospital
      field :setor
      field :if_office
    end

    list do
      sort_by :id

      field :jobeffective
      field :employee
      field :hospital
      field :setor
      field :if_office
    end

    edit do
      field :jobeffective
      field :employee
      field :hospital
      field :setor
      field :if_office
    end

    create do
      field :jobeffective
      field :employee
      field :hospital
      field :setor
      field :if_office
    end

  end

end


