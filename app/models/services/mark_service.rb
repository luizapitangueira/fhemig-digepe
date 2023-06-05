# frozen_string_literal: true

class MarkService
	class << self
		def last_mark(count_jobs_all,count_workload_all)
			{
				jobs: Mark.last.n_jobs,
				workload: Mark.last.n_workload,
				percent_jobs: ((count_jobs_all.to_f / Mark.last.n_jobs.to_f ) * 100).round(2),
				percent_workload: ((count_workload_all.to_f / Mark.last.n_workload.to_f) * 100).round(2),
				publish_date: Mark.last.publication_date
			}
		end
	end
end