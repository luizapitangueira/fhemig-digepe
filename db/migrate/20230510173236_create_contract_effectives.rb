class CreateContractEffectives < ActiveRecord::Migration[6.1]
  def change
    create_table :contract_effectives do |t|
      t.references :job_effective, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.references :hospital, null: false, foreign_key: true
      t.string :setor
      t.boolean :if_office

      t.timestamps
    end
  end
end
