class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string  :cpf
      t.string  :masp
      t.integer :admission
      t.string  :name
      t.references :career, null: false, foreign_key: true

      t.timestamps
    end
    add_index :employees, [:cpf, :masp, :admission], :unique => true
  end
end
