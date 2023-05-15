class AddWorkloadToJobEffective < ActiveRecord::Migration[6.1]
  def change
    add_column :job_effectives, :workload, :integer
  end
end
