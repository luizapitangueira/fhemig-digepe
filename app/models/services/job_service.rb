# frozen_string_literal: true

class JobService
	class << self
		def count_jobs
			{
				total: Job.all.count,
				free: Job.where(status: :free).count,
				busy: Job.where(status: :busy).count
			}
		end

		def table_careers_categorys
			result = Job.joins(:career)
            .group('(careers.name, careers.category)')
            .count(:id)
            .map { |k, count| { 'category' => k.split(',')[0].gsub('\"',''), 'name' => k.split(',')[1], 'Quant. vagas' => count} }
            result
		end

	end
end