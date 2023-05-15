class ChangeIfOfficeDataType < ActiveRecord::Migration[6.1]
  def change
    # Adicionar uma nova coluna `if_office_integer` como inteiro
    add_column :contract_effectives, :if_office_integer, :integer

    # Migrar os dados da coluna `if_switch` para a nova coluna `if_office_integer`
    execute <<~SQL
      UPDATE contract_effectives
      SET if_office_integer = CASE WHEN if_office::text = 't' THEN 1 ELSE 0 END
    SQL

    # Remover a coluna antiga `if_office`
    remove_column :contract_effectives, :if_office

    # Renomear a coluna `if_office_integer` para `if_office`
    rename_column :contract_effectives, :if_office_integer, :if_office
  end
end
