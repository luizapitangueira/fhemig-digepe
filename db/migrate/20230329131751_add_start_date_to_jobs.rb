class AddStartDateToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :start_date, :date
    add_column :jobs, :finish_date, :date
    add_column :jobs, :if_switch, :boolean, default:0
    add_column :jobs, :why_switch, :string
    add_column :jobs, :notice, :string
    add_column :jobs, :notice_publish_date, :date
    add_column :jobs, :workload, :integer 
    add_column :jobs, :creation_type, :integer, default:1
  end
end

