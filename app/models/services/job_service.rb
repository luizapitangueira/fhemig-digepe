class JobService
	class << self
		def count_jobs
			{
				total: Job.all.count,
				free: Job.where(status: :free).count,
				busy: Job.where(status: :busy).count
			}
		end
	end
end