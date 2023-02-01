class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable, :recoverable, :rememberable, -- para não deixar usuário se cadastrar ou recuperar senha
  devise :database_authenticatable, :validatable
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, :password_confirmation, presence: true
  validates :profile, inclusion: { in: %w(admin),
    message: "%{value} is not a profile" }

  rails_admin do
    show do
      field  :name
      field  :profile
      field  :email
    end
    list do
      field  :name
      field  :profile
      field  :email
    end
    edit do
      field  :name
      field  :email
      field  :profile
      field  :password
      field  :password_confirmation
    end
  end
end
