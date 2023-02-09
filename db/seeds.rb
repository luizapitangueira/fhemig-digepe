require Rails.root.join('db/seeds/careers_populate.rb')

print "Criando Usuários "
User.find_or_create_by(email: 'admin@example.com') do |u|
	u.name = 'Admin'
	u.profile = 'admin'
	u.password = '123456'
end                  
puts "-- OK!"
                           
print "Criando Carreiras "
CareersPopulate.populate!
puts "-- OK!"