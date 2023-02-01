# /db/seeds.rb
# Deletar Usuário
print "Deletando todos os usuários"
User.delete_all
# Criar usuário
print("Criando todos os usuários")
User.create nome:'Gabriel Dornas', admin:true, email: 'gabrielbdornas@gmail.com', password: 123456, password_confirmation:123456
