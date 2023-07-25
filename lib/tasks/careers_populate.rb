class CareersPopulate
  require 'csv'

  class << self
    def populate!
      seed_file_path = 'lib/tasks/csv/careers.csv'
      # Creating careers if it not exist
      CSV.foreach(seed_file_path, encoding:'utf-8', col_sep: ';', headers: :first_row) do |row|
        Career.find_or_create_by(name: row[0], 
                                 abbreviation: row[1],
                                 level: row[2],
                                 step: row[3],
                                 category: row[4],
                                 workload: row[5]
                                 ) do |u|
          u.name = row[0]
          u.abbreviation = row[1]
          u.level = row[2]
          u.step = row[3]
          u.category = row[4]
          u.workload = row[5]
        end
      end
    end
  end
end

      

      
      
      
      