class AddCpfToRestrictions < ActiveRecord::Migration[6.1]
  def change
    add_column :restrictions, :cpf, :string
  end
end
