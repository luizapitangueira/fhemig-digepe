class CareersPopulate
  require 'csv'

  class << self
    def populate!
      seed_file_path = 'db/seeds/csv/careers.csv'
      # Creating careers if it not exist
      CSV.foreach(seed_file_path, encoding:'utf-8', col_sep: ';', headers: :first_row) do |row|
        Career.find_or_create_by(name: row[0], 
                                 abbreviation: row[1],
                                 level: row[2],
                                 step: row[3],
                                 ) do |u|
          u.name = row[0]
          u.abbreviation = row[1]
          u.level = row[2]
          u.step = row[3]
          u.quantity = row[4]
          u.anual_impact = row[5]
        end
      end
    end
  end
end

      
      
      
      
      
      