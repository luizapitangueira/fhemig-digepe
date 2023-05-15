class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods

  self.table_name = "ahoy_events"

  belongs_to :visit
  belongs_to :user, optional: true

  rails_admin do
    navigation_label "Histórico"
    label "Acessos"

     list do
      sort_by :id

      field  :user do
        label "Usuário"
      end

      field  :name do
        label "Ação"
      end

      field  :properties do
        label "Propriedades"
        searchable true
      end

      field  :time do
        label "Data da ação"
      end
    end
  end
end
