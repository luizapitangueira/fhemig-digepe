# /db/seeds.rb
# Deletar Usuário
print "Deletando todos os usuários"
User.delete_all
# Criar usuário
print("Criando todos os usuários")
User.create name:'Gabriel Dornas', profile:'admin', email: 'gabrielbdornas@gmail.com', password: 123456, password_confirmation:123456
