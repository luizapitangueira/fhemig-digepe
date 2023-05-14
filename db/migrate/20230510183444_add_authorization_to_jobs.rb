class AddAuthorizationToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :authorization, :integer, limit: 6
  end
end
