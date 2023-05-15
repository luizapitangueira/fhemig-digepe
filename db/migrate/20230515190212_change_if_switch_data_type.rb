class ChangeIfSwitchDataType < ActiveRecord::Migration[6.1]
  def change
    # Adicionar uma nova coluna `if_switch_integer` como inteiro
    add_column :jobs, :if_switch_integer, :integer

    # Migrar os dados da coluna `if_switch` para a nova coluna `if_switch_integer`
    execute <<~SQL
      UPDATE jobs
      SET if_switch_integer = CASE WHEN if_switch::text = 't' THEN 1 ELSE 0 END
    SQL

    # Remover a coluna antiga `if_switch`
    remove_column :jobs, :if_switch

    # Renomear a coluna `if_switch_integer` para `if_switch`
    rename_column :jobs, :if_switch_integer, :if_switch
  end
end
