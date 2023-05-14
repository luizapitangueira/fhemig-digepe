class RemoveQuantityToCareers < ActiveRecord::Migration[6.1]
  def change
    remove_column :careers, :quantity
  end
end
