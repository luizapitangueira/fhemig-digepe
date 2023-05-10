# frozen_string_literal: true

class HomeController < ApplicationController
  #after_action :track_action

  def index
    @count_jobs = JobService.count_jobs
    @count_contracts_due_in_90_days = ContractService.count_contracts_due_in_90_days
    @table_careers_categorys = JobService.table_careers_categorys
  end

end
