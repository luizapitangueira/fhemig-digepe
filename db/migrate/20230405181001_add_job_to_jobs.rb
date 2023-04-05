class AddJobToJobs < ActiveRecord::Migration[6.1]
  def change
    add_reference :jobs, :job, null: true, foreign_key: true
  end
end
