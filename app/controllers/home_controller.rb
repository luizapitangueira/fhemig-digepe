# frozen_string_literal: true

class HomeController < ApplicationController
  #after_action :track_action

  def index
    @count_jobs = JobService.count_jobs
    @count_jobs_effectives = JobEffectiveService.count_jobs_effectives
    @count_jobs_all = @count_jobs[:total] + @count_jobs_effectives[:total] 

    @count_careers = CareerService.count_careers

    @count_contracts_due_in_90_days = ContractService.count_contracts_due_in_90_days
    @table_careers_categorys = JobService.table_careers_categorys

    @count_workload_jobs = JobService.count_workload
    @count_workload_jobs_effectives = JobEffectiveService.count_workload
    @count_workload_all = @count_workload_jobs[:total_workload] + @count_workload_jobs_effectives[:total_workload]
  end

end
