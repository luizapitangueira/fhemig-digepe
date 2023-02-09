class CreateCareers < ActiveRecord::Migration[6.1]
  def change
    create_table :careers do |t|
      t.string :name
      t.string :abbreviation
      t.string :level
      t.string :step
      t.integer :quantity
      t.float  :anual_impact

      t.timestamps
    end
  end
end
