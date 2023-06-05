Rails.application.routes.draw do
  root 'home#index'
  get 'home/report_ahoy' => 'home#report_ahoy'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
end