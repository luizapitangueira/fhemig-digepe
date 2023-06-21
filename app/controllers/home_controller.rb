# frozen_string_literal: true

class HomeController < ApplicationController
  #after_action :track_action

  def index
    @count_jobs = JobService.count_jobs
    @count_jobs_effectives = JobEffectiveService.count_jobs_effectives
    @count_jobs_all = @count_jobs[:total] + @count_jobs_effectives[:total] 
    @count_start_date = JobService.count_start_date

    @count_careers = CareerService.count_careers

    @count_contracts_due_in_90_days = ContractService.count_contracts_due_in_90_days
    @table_careers_categorys = JobService.table_careers_categorys
    @table_careers_categorys_fhemig = JobService.table_careers_categorys_fhemig

    @count_workload_jobs = JobService.count_workload
    @count_workload_jobs_effectives = JobEffectiveService.count_workload
    @count_workload_all = @count_workload_jobs[:total_workload] + @count_workload_jobs_effectives[:total_workload]

    @count_marks = MarkService.last_mark(@count_jobs_all, @count_workload_all)
  end

  def report_ahoy
    @data_ahoy = Ahoy::Event.all
  end

  def restriction
    
  end

  def jobcontract
    
  end

  def jobeffective
    
  end

end
