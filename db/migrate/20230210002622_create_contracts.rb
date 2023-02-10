class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.references :job, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.date :start_date
      t.date :estimate_finish_date
      t.date :finish_date

      t.timestamps
    end
  end
end