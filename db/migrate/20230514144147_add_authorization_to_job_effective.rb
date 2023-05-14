class AddAuthorizationToJobEffective < ActiveRecord::Migration[6.1]
  def change
    add_column :job_effectives, :authorization, :integer, limit: 6
  end
end

