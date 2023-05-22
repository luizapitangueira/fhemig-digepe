# frozen_string_literal: true

class JobEffectiveService
	class << self
		def count_jobs_effectives
			{
				total: JobEffective.all.count
			}
		end

		def count_workload
			{
				total_workload: JobEffective.all.sum(:workload)
			}
		end
	end
end