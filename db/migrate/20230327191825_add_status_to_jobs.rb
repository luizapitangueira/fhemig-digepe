class AddStatusToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :status, :integer, default: 1
    remove_column :jobs, :active
  end
end
