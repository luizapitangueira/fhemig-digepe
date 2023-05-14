class CreateRestrictions < ActiveRecord::Migration[6.1]
  def change
    create_table :restrictions do |t|
      t.integer :type_restriction
      t.string :description
      t.date :start_date
      t.date :finish_date
      t.string :time
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
