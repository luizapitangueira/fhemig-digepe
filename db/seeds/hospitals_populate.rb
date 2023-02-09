class HospitalsPopulate
  require 'csv'

  class << self
    def populate!
      seed_file_path = 'db/seeds/csv/hospitals.csv'
      # Creating hospitals if it not exist
      CSV.foreach(seed_file_path, encoding:'utf-8', col_sep: ';', headers: :first_row) do |row|
        Hospital.find_or_create_by(name: row[0], 
                                 abbreviation: row[1])                                 
      end
    end
  end
end

      
      
      
      
      
      