class ContractEffective < ApplicationRecord

  belongs_to :job_effective
  belongs_to :employee
  belongs_to :hospital

  enum if_office: %i[Não Sim]

  validates :if_office, presence: true

  rails_admin do

    show do
      field :job_effective
      field :employee
      field :hospital
      field :setor
      field :if_office
    end

    list do
      sort_by :id

      field :job_effective
      field :employee
      field :hospital
      field :setor
      field :if_office
    end

    edit do
      field :job_effective
      field :employee
      field :hospital
      field :setor
      field :if_office
    end

    create do
      field :job_effective
      field :employee
      field :hospital
      field :setor
      field :if_office
    end

  end

end


