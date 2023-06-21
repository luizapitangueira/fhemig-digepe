# frozen_string_literal: true

class JobService
	class << self
		def count_jobs
			{
				total: Job.all.count,
				free: Job.where(status: :Livre).count,
				busy: Job.where(status: :Ocupada).count
			}
		end

		def table_careers_categorys
			result = Job.joins(:career)
            .group('(careers.category)')
            .count(:id)
            .map { |k, count| { 'name' => k.split(',')[0].gsub('\"',''), 'data' => count} }
            formatted_data = result.map {|item| {name: item['name'], data: item['data']}}
		end

		def table_careers_categorys_fhemig #alterar para as carreiras da fhemig com o where
			result = Job.joins(:career)
            .group('(careers.category)')
            .count(:id)
            .map { |k, count| { 'name' => k.split(',')[0].gsub('\"',''), 'data' => count} }
            formatted_data = result.map {|item| {name: item['name'], data: item['data']}}
		end

		def count_workload
			{
				total_workload: Job.all.sum(:workload)
			}
		end

		def count_start_date
			Job.where.not(start_date:nil).group(:start_date).count  
		end

	end
end