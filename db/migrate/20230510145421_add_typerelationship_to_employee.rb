class AddTyperelationshipToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :type_relationship, :integer, default: 1
  end
end

