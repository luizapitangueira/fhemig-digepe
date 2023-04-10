# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @count_jobs = JobService.count_jobs
  end
end
