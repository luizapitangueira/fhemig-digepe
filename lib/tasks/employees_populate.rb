class EmployeesPopulate
  require 'csv'

  class << self
    def populate!
      seed_file_path = 'lib/tasks/csv/employees.csv'
      CSV.foreach(seed_file_path, encoding:'utf-8', col_sep: ';', headers: :first_row) do |row|
        Employee.find_or_create_by(
          cpf: row[3],
          masp: row[0],
          admission: row[1], 
          name: row[2],
          type_relationship: row[4]
          career: row[5], 
          )
      end                    
    end
  end
end
