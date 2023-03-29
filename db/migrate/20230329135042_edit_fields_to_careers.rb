class EditFieldsToCareers < ActiveRecord::Migration[6.1]
  def change
    add_column  :careers, :category, :string
    add_column  :careers, :workload, :integer
    remove_column  :careers, :anual_impact
  end
end
