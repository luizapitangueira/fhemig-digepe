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
              # job = Job.create(career: career, active: true)
              # Create employee
              # vinculate employee to job
            

            else
              # job = Job.create(career: career, active: true)
            end
            count += 1
          end
        end  
      end                              
    end
  end
end


# seed_file_path = 'db/seeds/csv/hospitals.csv'
#       # Creating hospitals if it not exist
#       CSV.foreach(seed_file_path, encoding:'utf-8', col_sep: ';', headers: :first_row) do |row|
#         Hospital.find_or_create_by(name: row[0], 
#                                  abbreviation: row[1])