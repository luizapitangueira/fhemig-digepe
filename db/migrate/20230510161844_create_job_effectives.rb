class CreateJobEffectives < ActiveRecord::Migration[6.1]
  def change
    create_table :job_effectives do |t|
      t.integer :status
      t.date :start_date
      t.date :finish_date
      t.references :career, null: false, foreign_key: true

      t.timestamps
    end
  end
end
