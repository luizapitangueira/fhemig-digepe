class EmployeesJobsPopulate
  require 'csv'

  class << self
    def populate!
      seed_file_path = 'db/seeds/csv/base_seed.csv'
      careers = Career.all.order(:id)
      count = 1
      careers.each do |career| 
        CSV.foreach(seed_file_path, encoding:'utf-8', col_sep: ';', headers: :first_row) do |row|
          if row[8] == career.abbreviation && row[10] == career.level && row[11] ==  career.step
            if career.quantity <= count
              job = Job.create(career: career, status: 1)
              hospital = Hospital.where(abbreviation: row[6]).first
              employee = Employee.find_or_create_by(
                cpf: row[3],
                masp: row[0],
                admission: row[1], 
                name: row[2],
                career: career, 
                )
              Contract.create(
                job: job,
                employee: employee,
                hospital: hospital,
                start_date: row[13],
                estimate_finish_date: row[14],
                )
              else
                job = Job.create(career: career, status: 1)
            end
            count += 1
          end
        end  
      end                              
    end
  end
end
