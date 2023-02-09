class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :career, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
