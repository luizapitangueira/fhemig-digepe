require Rails.root.join('lib/tasks/careers_populate.rb')
require Rails.root.join('lib/tasks/hospitals_populate.rb')
require Rails.root.join('lib/tasks/employees_jobs_populate.rb')

namespace cadastro: do
	task local: :environment do
		print "Criando Usuários "
		User.find_or_create_by(email: 'luiza.pitangueira@fhemig.mg.gov.br') do |u|
			u.name = 'Luiza Pitangueira'
			u.profile = 'admin'
			u.password = '123456'
		end                  
		puts "-- OK!"
		                           
		print "Criando Carreiras "
		CareersPopulate.populate!
		puts "-- OK!"

		print "Criando Hospitais "
		HospitalsPopulate.populate!
		puts "-- OK!"

		print "Criando Vagas e Contratados  "
		EmployeesPopulate.populate!
		puts "-- OK!"
	end
end