class CreateMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :marks do |t|
      t.integer :n_jobs
      t.integer :n_workload
      t.date :publication_date

      t.timestamps
    end
  end
end
